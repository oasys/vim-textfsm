# vim-textfsm

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)

&copy; 2021 Jason Lavoie

Vim syntax plugin for [TextFSM](https://github.com/google/textfsm)
template files.  TextFSM is a template-based state machine for parsing
semi-formatted text files, such as those returned from the CLI of
networking devices.

## Screenshots

![Cisco IOS Show CDP Neighbors](images/cisco_ios_show_cdp_neighbors_detail.textfsm.png)

## Configuration

By default all files with a `.textfsm` extension will have this syntax
set.  For different a filetype, add something like this to your
`~/.vimrc`:

```vim
autocmd BufRead,BufNewFile *.template *.tmpl set filetype=textfsm
```

## Installation

### Pathogen

Run the following command:

```bash
git clone https://github.com/oasys/vim-textfsm.git ~/.vim/bundle/vim-textfsm
```

### Vundle

Add the following line to your `~/.vimrc`:

```vim
Plugin 'oasys/vim-textfsm'
```

### Plug

Add the following line to your `~/.vimrc`:

```vim
Plug 'oasys/vim-textfsm'
```

### No Plugin Manager

Copy all of the files manually into your `~/.vim` directory.
