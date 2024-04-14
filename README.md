# My dotfiles

This directory contains the dotfiles for my system

## Requirements

Ensure you have the following installed on your system

### Git

```
brew install git
```

### Stow

```
brew install stow
```

## Installation

First, check out the dotfiles repo in your $HOME directory using git

```
$ git clone git@github.com:yakomisar/dotfiles.git dotfiles
$ cd dotfiles
```

then use GNU stow to create symlinks

```
$ stow .
```

## Before you leave a machine

> Every new beginning comes from some other beginning’s end.


```
# Copy all yours
brew leaves > leaves.txt

# Fresh installation
xargs brew install < leaves.txt
```
