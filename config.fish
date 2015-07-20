# External scripts {{{
# }}}

# Handy functions {{{
function eg; vim ~/.gitconfig; end
function ef; vim ~/.config/fish/config.fish; end
function efg; vim ~/.fishrc_google; end
function ev; vim ~/.vimrc; end
function em; vim ~/.muttrc; end
function et; vim ~/.tmux.conf; end
function eo; vim ~/.config/openbox/rc.xml; end

function gofish; . {$HOME}/.config/fish/config.fish; end

function oconf; openbox --reconfigure; end

# edit files that need to be merged
# function geu; git status -s | grep \^UU | cut -f 2 -d ' ' | xargs vim; end
function gap; git add -p; end
function gst; git status; end
# }}}

# Paths {{{
set -x GOPATH $HOME/go

set -x EDITOR "vim"
set -x BROWSER "google-chrome"
set -x TERM "xterm-256color"

# less goodies
set -x LESS -XRF

# Customize to your needs...
set -x PATH $PATH /usr/local/sbin /usr/local/bin /usr/sbin /usr/bin /sbin /bin {$HOME}/bin {$GOPATH}/bin

# Prompt {{{

set normal (set_color normal)
set magenta (set_color magenta)
set yellow (set_color yellow)
set green (set_color green)
set gray (set_color -o black)

function virtualenv_prompt
    if [ -n "$VIRTUAL_ENV" ]
        printf '(%s) ' (basename "$VIRTUAL_ENV")
    end
end

function git_prompt
    if git root >/dev/null 2>&1
        set_color normal
        printf ' on '
        set_color red
        printf '%s' (git currentbranch ^/dev/null)
        set_color green
        git_prompt_status
        set_color normal
    end
end

function prompt_pwd --description 'Print the current working directory, shortend to fit the prompt'
    echo $PWD | sed -e "s|^$HOME|~|"
end

function fish_prompt
    set last_status $status

    # z --add "$PWD"

    echo

    set_color red
    printf '%s' (whoami)
    set_color normal
    printf ' at '

    set_color yellow
    printf '%s' (hostname|cut -d . -f 1)
    set_color normal
    printf ' in '

    set_color $fish_color_cwd
    printf '%s' (prompt_pwd)
    set_color normal

    git_prompt

    echo

    virtualenv_prompt

    if test $last_status -eq 0
        set_color white -o
        printf '><((°> '
    else
        set_color red -o
        printf '[%d] ><((ˣ> ' $last_status
    end

    set_color normal
end

# }}}
