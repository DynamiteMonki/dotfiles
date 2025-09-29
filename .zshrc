if [[ ! -f ~/.zinit/bin/zinit.zsh ]]; then 
  print -P "%F{yellow}Installing zinit...%"
  mkdir -p ~/.zinit
  git clone --depth=1 https://github.com/zdharma-continuum/zinit.git ~/.zinit/bin 
fi 
source ~/.zinit/bin/zinit.zsh

#### HISTORY SETTINGS ####
HISTFILE=~/.zsh_history
HISTSIZE=5000
SAVEHIST=5000
setopt INC_APPEND_HISTORY SHARE_HISTORY HIST_IGNORE_DUPS HIST_REDUCE_BLANKS 

bindkey -e 
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward 
bindkey '^[w' kill-region

### Aliases
alias ls="eza"
alias ll="eza -l"
alias l="eza -l --git -a"
alias lt="eza --tree --level=2 --long --git"
alias ltree="eza --tree --level=2 --git"
alias fige="nvim ~/.zshrc"
alias ser="source ~/.zshrc"
alias glowp="glow -p"
alias cnvim="nvim --clean"
alias v="nvim"
alias cd="z"

# Completion styling 
zstyle ':zinit:*' use-gh-https 'yes'
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no 
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

#### --- Plugins --- ####
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab
zinit light zsh-users/zsh-history-substring-search

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down


autoload -Uz compinit && compinit

### The zoxide setup 
eval "$(zoxide init zsh)"
function zz() {
  local dir
  dir=$(zoxide query -ls | fzf --height 40% --reverse --inline-info | sed 's/^[0-9,.]* *//')
  [ -n "$dir" ] && cd "$dir"
}

#### The installs 

## Mise init 
eval "$(~/.local/bin/mise activate zsh)"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


. "$HOME/.atuin/bin/env"

eval "$(atuin init zsh)"
source "$HOME/.cargo/env"

# Carapace 
# ${UserConfigDir}/zsh/.zshrc
export CARAPACE_BRIDGES='zsh,fish,bash,inshellisense' # optional
zstyle ':completion:*' format $'\e[2;37mCompleting %d\e[m'
source <(carapace _carapace)

# echo 'eval "$(zellij setup --generate-auto-start zsh)"' >> ~/.zshrc
eval "$(starship init zsh)"
