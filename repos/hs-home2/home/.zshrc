# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
export TERM=xterm-256color

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="powerlevel9k/powerlevel9k"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Settings for virtualenvwrapper - need to be before plugins
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/git
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
case `uname` in
    Darwin)
        export VIRTUALENVWRAPPER_VIRTUALENV=/Library/Frameworks/Python.framework/Versions/3.5/bin/virtualenv
        ;;
    *)
        export VIRTUALENVWRAPPER_VIRTUALENV=/usr/local/bin/virtualenv
        ;;
esac
export VIRTUALENVWRAPPER_VIRTUALENV_ARGS='--no-site-packages'
#source /usr/local/bin/virtualenvwrapper.sh


plugins=(git git-flow virtualenv virtualenvwrapper)





# User configuration
# export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/Users/rbever/bin:/Users/rbever/bin"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh
unsetopt share_history

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"




#Always execute this configuration regardless of interactivity
if [ -f ~/.zshrc.thismachine.first.bash ]; then
	source ~/.zshrc.thismachine.first.bash
fi


# If not running interactively, don't do anything - below here
[[ "$-" != *i* ]] && return


# Export
export PATH=${HOME}/bin:$PATH:

# Python startup file
# See: http://brandon.invergo.net/news/2014-03-21-Enhancing-the-Python-interpreter-with-a-start-up-script.html
export PYTHONSTARTUP=$HOME/.config/python/python-startup.py

# Some shortcuts for different directory listings
alias ls='ls -FGh'                 # classify files in colour
alias ll='ls -l'                              # long list
alias la='ls -A'                              # all but . and ..
alias lla='ls -lA'                              # all but . and ..
alias llah='ls -lAh'                              # all but . and ..

#cd to git project root
alias cdr='cd "$(git rev-parse --show-toplevel)"'

#alias vim='gvim'
#alias vi='vim'
#alias vim='nvim'
#alias vi='nvim'
#alias oldvim='/usr/bin/vim'
alias egrep='egrep --color'
alias grep='egrep'

alias pbcopy='xclip -selection primary'
alias pbpaste='xclip -selection primary -o'


#Set vi editing mode
set -o vi



#Powerlevel9k
#POWERLEVEL9K_MODE='awesome-fontconfig'
#POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon context dir vcs)
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status virtualenv battery time)

POWERLEVEL9K_PROMPT_ON_NEWLINE=false
POWERLEVEL9K_RPROMPT_ON_NEWLINE=false

#POWERLEVEL9K_COLOR_SCHEME='light'

POWERLEVEL9K_VCS_CLEAN_FOREGROUND='black'
POWERLEVEL9K_VCS_CLEAN_BACKGROUND='green'
POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND='black'
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND='red'
POWERLEVEL9K_VCS_MODIFIED_FOREGROUND='black'
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='red'

# Tell zsh not to trust it's autocomplete cache
# https://unix.stackexchange.com/questions/2179/rebuild-auto-complete-index-or-whatever-its-called-and-binaries-in-path-cach
zstyle ":completion:*:commands" rehash 1

if [ -f ~/.homesick/repos/homeshick/homeshick.sh ]; then
    source ~/.homesick/repos/homeshick/homeshick.sh
fi

if [ -f ~/.zshrc.thismachine.bash ]; then
    source ~/.zshrc.thismachine.bash
fi

