#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

if [ -f "$HOME/.bash-git-prompt/gitprompt.sh" ]; then
    GIT_PROMPT_ONLY_IN_REPO=1
    source "$HOME/.bash-git-prompt/gitprompt.sh"
fi

current_time=$(date +%s)
birth_time=$(stat -c %W /)
elapsed_seconds=$(( current_time - birth_time ))
days_alive=$(( elapsed_seconds / 86400 ))
weeks_alive=$(( days_alive / 7 ))

case $weeks_alive in
    0) tier_color="\[\e[38;5;130m\]" ; tier_name="Bronze"   ;; # Brown/Orange
    1) tier_color="\[\e[38;5;248m\]" ; tier_name="Silver"   ;; # Gray/Silver
    2) tier_color="\[\e[38;5;214m\]" ; tier_name="Gold"     ;; # Golden Yellow
    3) tier_color="\[\e[38;5;117m\]" ; tier_name="Platinum" ;; # Light Blue
    *) tier_color="\[\e[38;5;51m\]"  ; tier_name="Diamond"  ;; # Cyan/Diamond
esac

reset="\[\e[0m\]"
green="\[\e[32m\]"
blue="\[\e[34m\]"

PS1="${tier_color}[${days_alive}]${reset}${green}\u@\h${reset}:${blue}\w${reset}\n\$ "
