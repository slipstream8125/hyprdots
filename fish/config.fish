# status is-interactive; and begin
    # set fish_tmux_autostart true
# end
source ~/.local/share/cachyos-fish-config/cachyos-config.fish
source $HOME/.config/fish/aliases.fish
source $HOME/.config/fish/profile.fish
set -x GOPATH $HOME/go
set -x PATH $PATH $GOPATH/bin
export LC_ALL="en_US.UTF-8"
# oh-my-posh init fish --config 'https://github.com/JanDeDobbeleer/oh-my-posh/blob/main/themes/space.omp.json' | source
# pyenv init - fish | source

# pnpm
set -gx PNPM_HOME "/home/slipstream/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end
