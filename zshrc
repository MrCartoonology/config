alias icloud="cd ~/Library/Mobile\ Documents/com~apple~CloudDocs"

# list recent git branches
alias gitbranches='git for-each-ref --sort=-commiterdate refs/heads/ --format="%(committer-date:short) %(refname:short)" | sort'

eval $(ssh-agent)
ssh-add --apple-use-keychain ~/.ssh/id_rsa

