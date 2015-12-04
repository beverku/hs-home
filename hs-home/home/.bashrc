# ~/.bashrc: executed by bash(1) for interactive shells.

# If not running interactively, don't do anything
[[ "$-" != *i* ]] && return



if [ -f ~/.bashrc.thismachine.first.bash ]; then
	source ~/.bashrc.thismachine.first.bash
fi


# Export
export PATH=$PATH:${HOME}/bin

#JAVA_HOME set in ~/.launchd.conf
#export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Home

# Aliases
#
# Some example alias instructions
# If these are enabled they will be used instead of any instructions
# they may mask.  For example, alias rm='rm -i' will mask the rm
# application.  To override the alias instruction use a \ before, ie
# \rm will call the real rm not the alias.
#
# Interactive operation...
# alias rm='rm -i'
# alias cp='cp -i'
# alias mv='mv -i'
#
# Default to human readable figures
# alias df='df -h'
# alias du='du -h'
#
# Misc :)
# alias less='less -r'                          # raw control characters
# alias whence='type -a'                        # where, of a sort
alias grep='grep --color'                     # show differences in colour
alias egrep='egrep --color=auto'              # show differences in colour
alias fgrep='fgrep --color=auto'              # show differences in colour
#
# Some shortcuts for different directory listings
alias ls='ls -FGh'                 # classify files in colour
alias ll='ls -l'                              # long list
alias la='ls -A'                              # all but . and ..
alias lla='ls -lA'                              # all but . and ..
alias llah='ls -lAh'                              # all but . and ..

#alias vim='gvim'
#alias vi='vim'


#Set vi editing mode
set -o vi


#Source in bash completion
. ~/.git-completion.bash

# If an interactive shell set the prompt to add my-git-prompt
if [ -n "$PS1" ]; then
    . ~/.my-git-prompt.bash
    PS1='\n\[\033[38;5;64m\]\u@\h \[\033[38;5;24m\]\w\033[00m $(git_prompt) \n\$ '
fi


if [ -f ~/.homesick/repos/homeshick/homeshick.sh ]; then
	source ~/.homesick/repos/homeshick/homeshick.sh
fi

if [ -f ~/.bashrc.thismachine.bash ]; then
	source ~/.bashrc.thismachine.bash
fi

