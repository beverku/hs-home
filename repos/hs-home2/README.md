# hs-home
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

```
cd ~/.homesick/repos/hs-home2
git submodule add ...
cd home
ln -s ../oh-my-zsh/ .oh-my-zsh
# lrwxr-xr-x  1 rbever  staff    13B Jun 11 10:27 .oh-my-zsh@ -> ../oh-my-zsh/
```

#PowerLevel9k
```
cd ~/.homesick/repos/hs-home2
git submodule add https://github.com/bhilburn/powerlevel9k.git
cd ~/.homesick/repos/hs-home2/oh-my-zsh/custom (master) 
mkdir themes
cd themes
ln -s ../../../powerlevel9k/
```

