#
# ~/.zshrc
#


#-- Alias --#
[[ -f .aliases ]] && source .aliases


#-- Completion --#
[ -e /usr/local/share/zsh-completions ] && fpath=(/usr/local/share/zsh-completions $fpath)
autoload -U compinit
compinit -u


#-- Archive settings --#
export ZIPINFOOPT=-OCP932
export UNZIPOPT=-OCP932


#-- Key --#
# create a zkbd compatible hash;
# to add other keys to this hash, see: man 5 terminfo
typeset -A key

key[Home]=${terminfo[khome]}

key[End]=${terminfo[kend]}
key[Insert]=${terminfo[kich1]}
key[Delete]=${terminfo[kdch1]}
key[Up]=${terminfo[kcuu1]}
key[Down]=${terminfo[kcud1]}
key[Left]=${terminfo[kcub1]}
key[Right]=${terminfo[kcuf1]}
key[PageUp]=${terminfo[kpp]}
key[PageDown]=${terminfo[knp]}

# setup key accordingly
[[ -n "${key[Home]}"     ]]  && bindkey  "${key[Home]}"     beginning-of-line
[[ -n "${key[End]}"      ]]  && bindkey  "${key[End]}"      end-of-line
[[ -n "${key[Insert]}"   ]]  && bindkey  "${key[Insert]}"   overwrite-mode
[[ -n "${key[Delete]}"   ]]  && bindkey  "${key[Delete]}"   delete-char
[[ -n "${key[Up]}"       ]]  && bindkey  "${key[Up]}"       up-line-or-history
[[ -n "${key[Down]}"     ]]  && bindkey  "${key[Down]}"     down-line-or-history
[[ -n "${key[Left]}"     ]]  && bindkey  "${key[Left]}"     backward-char
[[ -n "${key[Right]}"    ]]  && bindkey  "${key[Right]}"    forward-char
[[ -n "${key[PageUp]}"   ]]  && bindkey  "${key[PageUp]}"   beginning-of-buffer-or-history
[[ -n "${key[PageDown]}" ]]  && bindkey  "${key[PageDown]}" end-of-buffer-or-history

# Finally, make sure the terminal is in application mode, when zle is
# active. Only then are the values from $terminfo valid.
if (( ${+terminfo[smkx]} )) && (( ${+terminfo[rmkx]} )); then
    function zle-line-init () {
        printf '%s' "${terminfo[smkx]}"
    }
    function zle-line-finish () {
        printf '%s' "${terminfo[rmkx]}"
    }
    zle -N zle-line-init
    zle -N zle-line-finish
fi


#-- Do not sound --#
setopt nolistbeep
setopt nolistbeep


#-- Save history. --#
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
setopt share_history


#-- Make colors available --#
autoload -Uz colors
colors


#-- Pass to the path --#
[[ -d ~/.bin ]] && export PATH="~/.bin:${PATH}"


#-- PROMPT --#
# if [[ ${TERM} = "linux" ]]; then
#     PROMPT='%B%F{red}%(?..%? )%f%b%B%F{red}%n%f%b@%m %B%40<..<%~%<< %b%# '
# else
#     function powerline_precmd() {
#         PS1="$(powerline-shell  )"
#     }
# 
#     function install_powerline_precmd() {
#         for s in "${precmd_functions[@]}"; do
#             if [ "$s" = "powerline_precmd" ]; then
#                 return
#             fi
#         done
#         precmd_functions+=(powerline_precmd)
#     }
# 
#     install_powerline_precmd
# fi
#

plugins=(git)
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="gruvbox"
SOLARIZED_THEME="dark"
source $ZSH/oh-my-zsh.sh

# load zgen
source "${HOME}/.zgen/zgen.zsh"

#-- Like fish prompt --#
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
alias ls="ls -ltr --color=auto"
alias oppai=ls
alias oppai='ls'
alias packman=pacman
alias pai="echo ちんぽにゃ！"
alias cl=clear
alias :wq=exit
alias n=nvim
alias bat='bat --style="numbers,grid"'

[[ -z "$TMUX" && ! -z "$PS1" ]] && tmux -u

chpwd() { ls -ltr --color=auto }
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
export PATH="/home/soshi/.local/share/gem/ruby/3.0.0/bin:$PATH"

export LANG=ja_JP.utf8;

eval $(thefuck --alias)

alias g=lazygit
