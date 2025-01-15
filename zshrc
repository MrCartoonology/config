alias icloud="cd ~/Library/Mobile\ Documents/com~apple~CloudDocs"

# list recent git branches
alias gitbranches='git for-each-ref --sort=-commiterdate refs/heads/ --format="%(committer-date:short) %(refname:short)" | sort'

# ask for passphrase when start shell to make git commands easier
ssh-add ~/.ssh/id_rsa
