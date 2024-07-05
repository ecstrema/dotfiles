# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
xterm-color | *-256color) color_prompt=yes ;;
esac

if [ "$color_prompt" = yes ]; then
    # see https://bash-prompt-generator.org/
    PROMPT_COMMAND='PS1_CMD1=$(__git_ps1 "(%s) ")'
    PS1='\[\e[35;1m\]${PS1_CMD1}\[\e[32m\]\u@\h\[\e[39m\]:\[\e[94m\]\w\[\e[0m\] \\$ '
else
    # Same as above but without colors
    PROMPT_COMMAND='PS1_CMD1=$(__git_ps1 "(%s) ")'
    PS1='${PS1_CMD1}\u@\h:\w\$ '
fi

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'
