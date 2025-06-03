function t_now {
    date +%s%3N
}

function t_start {
    t_start=${t_start:-$(t_now)}
}

function t_stop {
    local d_ms=$(($(t_now) - $t_start))
    local d_s=$((d_ms / 1000))
    local ms=$((d_ms % 1000))
    local s=$((d_s % 60))
    local m=$(((d_s / 60) % 60))
    local h=$((d_s / 3600))
    if ((h > 0)); then
        t_show=${h}h${m}m
    elif ((m > 0)); then
        t_show=${m}m${s}s
    elif ((s >= 10)); then
        t_show=${s}.$((ms / 100))s
    elif ((s > 0)); then
        t_show=${s}.$((ms / 10))s
    else
        t_show=${ms}ms
    fi
    unset t_start
}

trap 't_start' DEBUG

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
xterm-color | *-256color) color_prompt=yes ;;
esac

PROMPT_COMMAND='PS1_CMD1=$(__git_ps1 "(%s) ");t_stop'
if [ "$color_prompt" = yes ]; then
    # see https://bash-prompt-generator.org/
    PS1='\[\e[35;1m\]${PS1_CMD1}\[\e[32m\]\u\[\e[32m\]@\[\e[32m\]\h\[\e[39m\]:\[\e[94m\]\w\[\e[0m\] \[\e[2m\]${t_show}\[\e[0m\]\n\\$ '
else
    # Same as above but without colors
    PS1='${PS1_CMD1}\u@\h:\w\$ '
fi

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto -A'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
else
    alias ls='ls -A'
fi

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
    if [ -f /usr/share/bash-completion/bash_completion ]; then
        . /usr/share/bash-completion/bash_completion
    elif [ -f /etc/bash_completion ]; then
        . /etc/bash_completion
    fi
fi

[[ -f ~/.bash-preexec.sh ]] && source ~/.bash-preexec.sh
eval "$(atuin init bash)"

# Add an alias for pass=gopass and pass=gopass.exe under Windows
if [[ -n "$WINDIR" ]]; then
    alias pass='gopass.exe'
else
    alias pass='gopass'
fi
