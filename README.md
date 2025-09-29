# dotfiles

My dotfiles managed using GNU stow.

--- 

A ignore file can be made using the .stow-local-ignore file and naming the files/folders to be ignored.

--- 

# Installation 

Installation can be done by cloning the repo and following the below steps 

```bash
git clone https://github.com/DynamiteMonki/dotfiles ~/dotfiles 
cd dotfiles
stow .
```

and important cmd,

```bash
stow --adopt .
```
