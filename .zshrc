 autoload -Uz compinit
compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' menu select
#export LS_COLORS='rs=0:di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:tw=30;42:ow=34;42:st=37;44:ex=01;32:';
#zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# z
source ~/z/z.sh

# fzf
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

unalias z 2> /dev/null
z() {
  [ $# -gt 0 ] && _z "$*" && return
  cd "$(_z -l 2>&1 | fzf --height 40% --nth 2.. --reverse --inline-info +s --tac --query "${*##-* }" | sed 's/^[0-9,.]* *//')"
}

colorlist() {
    for color in {000..015}; do
        print -nP "%F{$color}$color %f"
    done
    printf "\n"
    for color in {016..255}; do
        print -nP "%F{$color}$color %f"
        if [ $(($((color-16))%6)) -eq 5 ]; then
            printf "\n"
        fi
    done
}

# starship
#eval "$(starship init zsh)"

# espup
alias get_esprs='sh ~/export-esp.sh'

# display
alias x0='xrandr --output eDP1 --auto'

# alias
alias la='ls -a'
alias ll='ls -l'
alias lla='ls -a -l'
alias lf='ls -1 -F'
alias bat='bat --paging=never --theme=TwoDark'
alias f='fzf --reverse --border'
alias fontpreview='fontpreview-ueberzug'
alias c++='clang++'
alias rust='cargo run --bin'
alias atcode='cargo test --test'
alias clip='xclip -selection c'
alias grep='grep --color=auto'
alias ip='ip -color=auto'
alias ls='eza --icons'

# oh my zsh
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=(
    git
    docker
)
source $ZSH/oh-my-zsh.sh
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
[[ ! -f ~/dotfiles/zsh/.p10k.zsh ]] || source ~/dotfiles/zsh/.p10k.zsh
