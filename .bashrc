# Init {{{

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# }}}

# Prompt {{{

export PS1='\[\e[1;32m\]\u \[\e[1;32m\]// \[\e[0;35m\]\W \[\e[0m\]$ '

# }}}

# History {{{

# append to history rather than overwriting
shopt -s histappend

# less conservative values
export HISTFILESIZE=5000
export HISTSIZE=2500

# }}}

# Program defaults {{{

export EDITOR="vim"
export BROWSER="chromium"
export TERM="xterm-256color"
export PAGER="less"

# }}}

# Aliases {{{

alias ls='ls --color=auto'
alias ..='cd ..'
alias ...='cd ../..'
alias ev='vim ~/.vimrc'

## git

### edit files that need to be merged
alias geu='git diff --name-status --diff-filter=U | cut -f 2 | parallel -Xj1 --tty vim'

alias gl='git log'
alias gap='git add -p'
alias gst='git status'
alias gdi='git diff'
alias gcm='git commit -m'
alias gcp='git checkout -p'

# }}}

# Functions {{{

## TODO: break these into one function per file
source ~/bin/funcs.sh

# }}}

# Ugly bits {{{

# no more stderr spam
unset GREP_OPTIONS

# less goodies
export LESS=-XRF

# }}}

# golang {{{
export GOPATH=$HOME/go
# }}}

# Path {{{
export PATH=$HOME/npm/bin:$PATH:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:~/bin:$GOPATH/bin:~/.gem/ruby/2.2.0/bin/:~/lib/hub-2.2.3/bin
# }}}

# Plan 9 {{{
export PLAN9=/usr/local/plan9
export PATH=$PATH:$PLAN9/bin
# }}}

# Perl {{{
PATH="/home/stephen/perl5/bin${PATH+:}${PATH}"; export PATH;
PERL5LIB="/home/stephen/perl5/lib/perl5${PERL5LIB+:}${PERL5LIB}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/stephen/perl5${PERL_LOCAL_LIB_ROOT+:}${PERL_LOCAL_LIB_ROOT}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/stephen/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/stephen/perl5"; export PERL_MM_OPT;
# }}}
