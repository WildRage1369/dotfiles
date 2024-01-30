if status is-interactive
    # Commands to run in interactive sessions can go here
end

starship init fish | source
set -U fish_greeting "🐟"

thefuck --alias fuck | source
# alias cat_orig="cat"
alias bcat="batcat"
alias neorgd="nvim -c 'Neorg workspace documents'"
alias neorgs="nvim -c 'Neorg workspace school'"

alias nvim="/home/maxine/.local/share/bob/nvim-bin/nvim"

set NVM_DIR "([ -z "$XDG_CONFIG_HOME-" ] && printf %s "$HOME/.nvm" ||
 printf %s "$XDG_CONFIG_HOME/nvm")"
              [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"


# >>> mamba initialize >>>
# !! Contents within this block are managed by 'mamba init' !!
set -gx MAMBA_EXE "/home/maxine/.micromamba/bin/micromamba"
set -gx MAMBA_ROOT_PREFIX "/home/maxine/micromamba"
$MAMBA_EXE shell hook --shell fish --root-prefix $MAMBA_ROOT_PREFIX | source
# <<< mamba initialize <<<

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /home/maxine/micromamba/bin/conda
    eval /home/maxine/micromamba/bin/conda "shell.fish" "hook" $argv | source
else
    if test -f "/home/maxine/micromamba/etc/fish/conf.d/conda.fish"
        . "/home/maxine/micromamba/etc/fish/conf.d/conda.fish"
    else
        set -x PATH "/home/maxine/micromamba/bin" $PATH
    end
end
# <<< conda initialize <<<
