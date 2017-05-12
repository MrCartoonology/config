(custom-set-variables
  ;; custom-set-variables was added by Custom -- don't edit or cut/paste it!
  ;; Your init file should contain only one such instance.
 '(case-fold-search t)
 '(column-number-mode t)
 '(global-font-lock-mode t nil (font-lock))
 '(save-place t nil (saveplace))
 '(tab-width 2)
 '(transient-mark-mode t)
 '(uniquify-buffer-name-style (quote forward) nil (uniquify))
 '(x-select-enable-cliboard t))
(custom-set-faces
  ;; custom-set-faces was added by Custom -- don't edit or cut/paste it!
  ;; Your init file should contain only one such instance.
 )

;;(add-to-list 'load-path "~/icicles")
;;(add-to-list 'load-path "~/.emacs.d/packagedirs")
;;(let ((default-directory  "~/.emacs.d/packagedirs/"))
;;  (normal-top-level-add-subdirs-to-load-path))

;;(when (> emacs-major-version 23)
;;  (require 'package)
;;  (package-initialize)
;;  (add-to-list 'package-archives 
;;               '("melpa" . "http://melpa.milkbox.net/packages/")
;;               'APPEND))

;; (require 'icicles)
;; (icy-mode 1)

(setq kill-whole-line t)
(setq make-backup-files nil)
(global-set-key "\C-xl" 'goto-line)
(global-set-key [f4] 'revert-buffer)
(global-set-key [f5] 'desktop-save)
(global-set-key [f9] 'compile)
(define-key global-map "\C-f" 'save-buffer)
(define-key global-map "\C-o" 'find-file)
(define-key global-map "\C-t" 'toggle-truncate-lines)

(setq c-basic-offset 2)
(setq c-basic-indent 2)
(setq py-indent-offset 2)
(setq tab-width 2)
(setq-default tab-width 2)
(setq indent-tabs-mode nil)
(setq-default indent-tabs-mode nil)
;; For some reason in verions 
(setq indent-line-function 'insert-tab)
(setq tab-stop-list (number-sequence 2 400 2))

(setq x-select-enable-clipboard t)


;; how to get emacs to not indent in the namespace, from http://stackoverflow.com/questions/13825188/suppress-c-namespace-indentation-in-emacs
(defconst my-cc-style
  '("cc-mode"
    (c-offsets-alist . ((innamespace . [0])))))

(c-add-style "my-cc-mode" my-cc-style)
;; but then you have to set the indentation style to my-cc-style.  You do this
;; with c-set-style - or C-c

;; we want to map f8 to running scons on a project

;; emacs seems really slow with file operations, maybe it is our nsf, but here's some things from
;; stack overflow
(setq recentf-keep '(file-remote-p file-readable-p))
(remove-hook 'find-file-hooks 'vc-find-file-hook)
;; also to Alt-x byte-compile-file your.emacs file

;disable backup
(setq backup-inhibited t)
;disable auto save
(setq auto-save-default nil)

;; I can't get this org mode to work?  first I get an error from somewhere about -Q
;;
;;(add-to-list 'load-path "~/emacs_packages/org-8.0.3/lisp")

;;(require 'org-install)
;;(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
;;(define-key global-map "\C-cl" 'org-store-link)
;;(define-key global-map "\C-ca" 'org-agenda)
;;(setq org-log-done t)


;; this is from http://www.linta.de/~aehlig/techblog/2012-05-10.html
;; about indenting psuedo code - I can't figure out how to hook it into a mode though
;;(defvar pseudocode-indent 2
;;  "Standard indentation for pseudo code")

;;(defvar pseudocode-emptyline
;;  "^\\s-*$"
;;  "Regular expression matching an empty line")

;;(defvar pseudocode-opening
;;  "^\\s-*\\(fun\\|if\\|else\\)"
;;  "Regular expression matching lines starting an indentation level in pseudo code")

;;(defvar pseudocode-closing
;;  "^\\s-*\\(nuf\\|fi\\|else\\)"
;;  "Regular expression matching lines ending an indentation level in pseudo code")

;;(defun pseudocode-indent-line ()
;;  "Indent current line according to pseudo code style"
;;  (interactive)
;;  (save-excursion
;;    (indent-line-to
;;     (max
;;      0
;;      (catch 'indent
;;        (save-excursion
;;          (beginning-of-line)
;;          (if (bobp) (throw 'indent 0))
;;          (let ((outdent (if (looking-at pseudocode-closing)
;;                             (- pseudocode-indent) 
;;                           0)))
;;            (forward-line -1)
;;            (while (looking-at pseudocode-emptyline)
;;              (if (bobp) (throw 'indent 0))
;;              (forward-line -1))
;;            (if (looking-at pseudocode-opening)
;;                (throw 'indent (+ (current-indentation) pseudocode-indent outdent)))
;;            (throw 'indent (+ (current-indentation) outdent)))))))))
;;            
;;                             
;;(defun pseudocode-mode ()
;;  "Mode for editing pseudo-code files (incomplete, for demonstrating indentation only)"
;;  (interactive)
;;  (set (make-local-variable 'indent-line-function) 'pseudocode-indent-line))


;; from cedet.sourceforge.net/setup.shtml

;;(load-file "~/emacs-24.3/lisp/cedet/cedet.el")
;;(global-ede-mode 1)                      ; Enable the Project management system
;;(require 'semantic/sb)
;;(semantic-mode 1)
;;
;;(when window-system    ; start speedbar if we're using a window system
;;  (speedbar t))


;;(semantic-load-enable-code-helpers)      ; Enable prototype help and smart completion 
;;(global-srecode-minor-mode 1)            ; Enable template insertion menu

;;(ede-cpp-root-project "myrelease"
;;                :name "My Release"
;;                :file "~/w/project/CMakeLists.txt"
;;                :include-path '("~/myrelease/include"
;;                               ))


(autoload 'matlab-mode "matlab" "Matlab Editing Mode" t)
 (add-to-list
  'auto-mode-alist
  '("\\.m$" . matlab-mode))
 (setq matlab-indent-function t)

(load "~/cython-mode.el")

;; add SConstruct and SConscript to emacs
(add-to-list 'auto-mode-alist '(".*SConstruct$" . python-mode))
(add-to-list 'auto-mode-alist '(".*SConscript$" . python-mode))
(load "~/column-marker.el")

(require 'package)
(add-to-list 'package-archives
             '("elpy" . "http://jorgenschaefer.github.io/packages/"))


(defvar myPackages
  '(better-defaults
    elpy ;; add the elpy package
    material-theme))

(elpy-enable)
  
