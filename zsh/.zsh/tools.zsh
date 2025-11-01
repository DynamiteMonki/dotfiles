# Add deno completions to search path
if [[ ":$FPATH:" != *":/home/vivek/.zsh/completions:"* ]]; then
  export FPATH="/home/vivek/.zsh/completions:$FPATH";
fi

# ${UserConfigDir}/zsh/.zshrc
export CARAPACE_BRIDGES='zsh,fish,bash,inshellisense' # optional
zstyle ':completion:*' format $'\e[2;37mCompleting %d\e[m'
source <(carapace _carapace)

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# Shell integrations
eval "$(~/.local/bin/mise activate zsh)"
eval "$(zoxide init --cmd cd zsh)"
eval "$(fzf --zsh)"

[ -s "${HOME}/.g/env" ] && \. "${HOME}/.g/env"  # g shell setup


#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# bun completions
[ -s "/home/vivek/.bun/_bun" ] && source "/home/vivek/.bun/_bun"

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
