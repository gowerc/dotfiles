

# Dot Files

This repository contains my dot files. They are managed using
[GNU Stow](https://www.gnu.org/software/stow/).


## Installation / Misc Commands

Note that all of the following assume you are in the root directory of this repository.

Create symlinks for all files in this repo in the home directory. Note that by default `stow`
will setup symlinks in the parent directory e.g. `../` thus we need to specify the target directory
of `$HOME` if our dotfiles repo is note in the home directory.
```bash
stow --target=$HOME .      # for all files
stow --target=$HOME <file> # for specific file to create symlink for
```

Delete all symlinks in the home directory for files that exist within this reporisotry
(will throw an error if a non-symlink file has the same name as a file in our repo):
```bash
stow --delete --target=$HOME .
```

Refresh all the symlinks in the home directory for files that exist within this repository:
```bash
stow --restow --target=$HOME .
```

## Misc Notes

You should run `mkdir ~/bin` first as otherwise Stow will symlink the entire bin folder from
this git repo rather than just the individual files within the bin folder.


`.profile_common` attempts to source another file called `.profile_local`. This file
is intended to contain any local configurations that are only intended for that specific
machine. It can also be used to define the `NICKNAME` variable for the machine will will be
displayed via the `about` function that I defined in `.profile_common`.

