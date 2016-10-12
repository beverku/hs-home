# hs-home2
Homesick dofiles

See: https://github.com/technicalpickles/homesick#readme


set the following line in .bashrc (before I did this when running vim from command line I would see two powerlines when exiting insert mode)
export TERM=xterm-256color

You will probabaly need to install the meslo_lg_m_regular_for_powerline.otf font file
This file comes from here: 
https://github.com/powerline/fonts
https://github.com/powerline/fonts/tree/master/Meslo

- Just double click the meslo_lg_m_regular_for_powerline.otf font file and click the install button

Also you may need to set the set the system font
OSX: -System->Preferences->Appearance->Fonts->Fixed Width Fonts
RHEL: System->Preferences->Appearance->Fonts->Fixed Width Fonts
UBUNTU 14.04 with gnome3: gnome-tweak-tool -> Fonts -> Monospace
https://github.com/vim-airline/vim-airline/wiki/FAQ

NOTE: I actually have this set to inconsolata and it seems to work fine, but if you have trouble switch to meslo


Adding a symlinked git submodule
See: https://github.com/andsens/homeshick/wiki/Symlinking#shallow-symlinking

To Setup this repo of my dotfiles
```
git clone git://github.com/andsens/homeshick.git $HOME/.homesick/repos/homeshick
.homesick/repos/homeshick/bin/homeshick link hs-home2
```

#Install Oh-my-zsh
```
cd
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```
#Install PowerLevel9k
```
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
```
#Install tmux
```
brew install tmux
#or
sudo apt install tmux
```
#Link
```
homeshick link hs-home2
```

