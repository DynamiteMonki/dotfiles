#########################################

#PROMPT
autoload -U colors && colors
setopt PROMPT_SUBST

# Truncate directory, show ~ for HOME, with a configurable max depth
truncate_path() {
  local max=2
  local path="${PWD/#$HOME/~}"
  IFS=/ read -r -A parts <<< "${path#~/}"
  if (( ${#parts[@]} > max )); then
    echo "~/${(j:/:)parts[-$max,-1]}"
  else
    echo "$path"
  fi
}

# Enhanced git status like robbyrussell with added info & colors
git_status() {
  local branch flags ahead behind stash

  branch=$(git symbolic-ref --short HEAD 2>/dev/null) || return
  flags=""

  # unstaged changes
  git diff --quiet 2>/dev/null || flags+="%F{red}*%f"
  # staged changes
  git diff --cached --quiet 2>/dev/null || flags+="%F{green}+%f"
  # untracked files
  [[ -n $(git ls-files --others --exclude-standard) ]] && flags+="%F{magenta}?%f"
  # stashed changes
  stash=$(git stash list 2>/dev/null | wc -l)
  (( stash > 0 )) && flags+="%F{magenta}\$%f"

  if git rev-parse --symbolic-full-name @{upstream} >/dev/null 2>&1; then
    local upstream=$(git rev-parse @{upstream})
    local local_branch=$(git rev-parse HEAD)
    ahead=$(git rev-list --count ${upstream}..${local_branch})
    behind=$(git rev-list --count ${local_branch}..${upstream})
    (( ahead > 0 )) && flags+="%F{blue}↑${ahead}%f"
    (( behind > 0 )) && flags+="%F{blue}↓${behind}%f"
  fi

  echo "%F{yellow}(${branch}${flags})%f"
}

# Right prompt shows last error code if non-zero
RPROMPT='%(?..%F{red}exit %?%f)'

# Add a blank line before each prompt for spacing
precmd() { echo }

# Prompt itself
PROMPT='%F{cyan}$(truncate_path)%f $(git_status)
%(?.%F{magenta}>%f.%F{red}>%f) '

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

eval "$(~/.local/bin/mise activate zsh)"
autoload -Uz compinit && compinit

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
