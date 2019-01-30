#!/bin/bash
X=~/dotfiles
cp -rf ~/.i3/workspace_1.json $X/.i3/
cp -rf ~/.zshrc $X/
cp -rf ~/.tmux.conf $X/
cp -rf ~/.Xresources $X/
cp -rf ~/.Xresources-dotres $X/
cp -rf ~/ldev.sh $X/

mkdir -p $X/.config/mpd
mkdir -p $X/.config/i3
mkdir -p $X/.config/polybar

cp -rf ~/.config/i3/config $X/.config/i3/
cp -rf ~/.config/polybar/config $X/.config/polybar/
cp -rf ~/.config/mpd/mpd.conf $X/.config/mpd/
echo Done!
