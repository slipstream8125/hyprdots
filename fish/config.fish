status is-interactive; and begin
    # set fish_tmux_autostart true
end
source ~/.local/share/cachyos-fish-config/cachyos-config.fish
source $HOME/.config/fish/aliases.fish
source $HOME/.config/fish/profile.fish
set -x GOPATH $HOME/go
set -x PATH $PATH $GOPATH/bin
export LC_ALL="en_US.UTF-8"
pyenv init - fish | source
