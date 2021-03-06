#!/bin/bash

#i3-msg "workspace 1"
i3-msg "append_layout ~/.i3/workspace_1.json"
#i3-msg "rename workspace 1 to \"1: main\""

(uxterm -xrm 'UXTerm.vt100.allowTitleOps: false' -T matrix -e "cmatrix -C yellow; zsh" &)
(uxterm -xrm 'UXTerm.vt100.allowTitleOps: false' -T stats -e "tmux new-session \"htop; zsh\"; zsh" &)
(uxterm -xrm 'UXTerm.vt100.allowTitleOps: false' -T music -e "tmux new-session \"mpd; ncmpcpp; zsh\"; zsh" &)
(uxterm -xrm 'UXTerm.vt100.allowTitleOps: false' -T main -e "tmux new-session \"neofetch; zsh\" && neofetch; zsh" &)
(uxterm -xrm 'UXTerm.vt100.allowTitleOps: false' -T main -e "tmux new-session \"neofetch; zsh\" && neofetch; zsh" &)
(conky &)
