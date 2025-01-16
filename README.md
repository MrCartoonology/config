For git/github I have a passphrase. I want it automatically loaded.

For a while I did this

```
  ssh-add ~/.ssh/id_rsa
```

In the `.zshrc`. You have to provide input for each terminal.
Breaks Visual Studio Code running a python file.

Now i use the apple keychain, so .ssh/config gets this:
  
```
Host *
  AddKeysToAgent yes
  UseKeychain yes   # For macOS only
  IdentityFile ~/.ssh/id_rsa
```

and I run this once (I think)

```
  ssh-add --apple-use-keychain ~/.ssh/id_rsa
```

and now I do this

```
eval $(ssh-agent)
ssh-add --apple-use-keychain ~/.ssh/id_rsa
```

in the .zshrc