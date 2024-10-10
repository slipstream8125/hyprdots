#!/bin/bash
install_dependencies() {
	yay -S --noconfirm hyprland swaync swayosd-git waybar kitty asusctl supergfxctl
}

symlinks() {
	ln -sf "$HOME"/hyprdots/hypr "$HOME"/.config/hypr
	ln -sf "$HOME"/hyprdots/swaync "$HOME"/.config/swaync
	ln -sf "$HOME"/hyprdots/waybar "$HOME"/.config/waybar
	ln -sf "$HOME"/hyprdots/nvim "$HOME"/.config/nvim
	ln -sf "$HOME"/hyprdots/wlogout "$HOME"/.config/wlogout
	ln -sf "$HOME"/hyprdots/yazi "$HOME"/.config/yazi
	ln -sf "$HOME"/hyprdots/kitty "$HOME"/.config/kitty
}

main() {
	install_dependencies
	symlinks
}
main
