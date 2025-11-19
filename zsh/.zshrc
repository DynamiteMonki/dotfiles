ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

source "${ZINIT_HOME}/zinit.zsh"

#PROMPT 
autoload -U colors && colors
setopt PROMPT_SUBST

git_status() {
  local branch flags ahead behind stash merge rebase

  branch=$(git symbolic-ref --short HEAD 2>/dev/null) || return

  flags=""
  # Check unstaged changes
  git diff --quiet 2>/dev/null || flags+="%F{red}*%f"
  # Check staged changes
  git diff --cached --quiet 2>/dev/null || flags+="%F{green}+%f"
  # Untracked files
  [[ -n $(git ls-files --others --exclude-standard) ]] && flags+="%F{magenta}?%f"
  # Stash count
  stash=$(git stash list 2>/dev/null | wc -l) && [[ $stash -gt 0 ]] && flags+="%F{magenta}\$%f"
  # Merge or rebase detection
  [[ -d .git/MERGE_HEAD ]] && flags+="%F{cyan}!%f"
  [[ -d .git/rebase-apply || -d .git/rebase-merge ]] && flags+="%F{cyan}|%f"
  # Ahead/behind tracking
  if git rev-parse --symbolic-full-name @{upstream} >/dev/null 2>&1; then
    local upstream=$(git rev-parse @{upstream})
    local local_branch=$(git rev-parse HEAD)
    ahead=$(git rev-list --count ${upstream}..${local_branch})
    behind=$(git rev-list --count ${local_branch}..${upstream})
    [[ $ahead -gt 0 ]] && flags+="%F{blue}↑${ahead}%f"
    [[ $behind -gt 0 ]] && flags+="%F{blue}↓${behind}%f"
  fi

  echo "%F{yellow}[$branch$flags]%f"
}

truncate_path() {
  local max=3
  local path="${PWD/#$HOME/~}"
  IFS=/ read -r -A parts <<< "${path#~/}"
  if (( ${#parts[@]} > max )); then
    echo "~/${(j:/:)parts[-$max,-1]}"
  else
    echo "$path"
  fi
}

RPROMPT='%(?..%F{red}exit %?%f)'

precmd() { echo }

PROMPT="%B%F{cyan}\$(truncate_path)%f%b \$(git_status)
%(?.%F{magenta}➜%f.%F{red}➜%f) "

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab
zinit light zdharma-continuum/fast-syntax-highlighting

eval "$(~/.local/bin/mise activate zsh)"
autoload -Uz compinit && compinit
zinit cdreplay -q

# Keybindings
bindkey -v

# Aliases
alias ls='eza'
alias vim='nvim'
alias c='clear'
alias ll="ls -l"
alias l="ls -la"
alias fige="nvim ~/.zshrc"
alias cnvim="nvim --clean"
alias la="ls -a"

eval "$(zoxide init --cmd cd zsh)"
eval "$(fzf --zsh)"

# ${UserConfigDir}/zsh/.zshrc
export CARAPACE_BRIDGES='zsh,fish,bash,inshellisense' # optional
zstyle ':completion:*' format $'\e[2;37mCompleting %d\e[m'
source <(carapace _carapace)
export PATH="/home/vivek/.gdvm/bin/current_godot:/home/vivek/.gdvm/bin:$PATH"

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# Better preview with exa/eza or ls
zz() {
    local dir
    dir=$(zoxide query -l | fzf \
        --height 60% \
        --reverse \
        --preview 'eza -la --color=always {} 2>/dev/null || ls -la {}' \
        --preview-window right:60% \
        --bind 'ctrl-/:toggle-preview') && cd "$dir"
}

. "$HOME/.atuin/bin/env"
eval "$(atuin init zsh)"

export GOPATH="$HOME/go"; export GOROOT="$HOME/.g/go"; export PATH="$GOPATH/bin:$PATH"; # g-install: do NOT edit, see https://github.com/stefanmaric/g

# BEGIN opam configuration
# This is useful if you're using opam as it adds:
#   - the correct directories to the PATH
#   - auto-completion for the opam binary
# This section can be safely removed at any time if needed.
[[ ! -r '/home/vivek/.opam/opam-init/init.zsh' ]] || source '/home/vivek/.opam/opam-init/init.zsh' > /dev/null 2> /dev/null
# END opam configuration

export PATH="$PATH:$HOME/.local/share/bob/nvim-bin"
