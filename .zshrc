# TODO(sww): add vim folds + orgaanize into sections

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="kphoen"

export GOPATH=$HOME/go

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

export EDITOR="vim"
export BROWSER="google-chrome-stable"
export TERM="xterm-256color"

source $ZSH/oh-my-zsh.sh

# autocorrect is the worst
unsetopt correct

# less goodies
export LESS=-XRF

# Customize to your needs...
export PATH=$HOME/npm/bin:$HOME/lib/iojs-v2.2.1-linux-x64/bin:$PATH:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:~/bin:$GOPATH/bin

# Handy little aliases
alias sz='source ~/.zshrc'
alias eg='vim ~/.gitconfig'
alias ez='vim ~/.zshrc'
alias ev='vim ~/.vimrc'
alias em='vim ~/.muttrc'
alias et='vim ~/.tmux.conf'
alias eo='vim ~/.config/openbox/rc.xml'
alias oconf='openbox --reconfigure'

# git goodies
# edit files that need to be merged
alias geu='git diff --name-status --diff-filter=U | cut -f 2 | parallel -Xj1 --tty vim'
alias gap='git add -p'
alias gst='git status'
alias gdi='git diff'
alias gcm='git commit -m'
alias gcp='git checkout -p'
alias gau='git ls-files --others --exclude-standard | xargs git add'

# Plan 9
export PLAN9=/usr/local/plan9
export PATH=$PATH:$PLAN9/bin

