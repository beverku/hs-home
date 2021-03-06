# ~/.bashrc: executed by bash(1) for interactive shells.


#Always execute this configuration regardless of interactivity
if [ -f ~/.bashrc.thismachine.first.bash ]; then
	source ~/.bashrc.thismachine.first.bash
fi


# If not running interactively, don't do anything - below here
[[ "$-" != *i* ]] && return


# Export
export PATH=${HOME}/bin:$PATH
export TERM=xterm-256color

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

#cd to git project root
alias cdr='cd "$(git rev-parse --show-toplevel)"'

#alias vim='gvim'
#alias vi='vim'


#Set vi editing mode
set -o vi


#Source in git-bash completion
. ~/.git-completion.bash

#Create completion aware git <alias> aliases
function_exists() {
    declare -f -F $1 > /dev/null
    return $?
}

#for al in `__git_aliases`; do
for al in `git config -l | grep ^alias | sed "s/alias\.//" | sed "s/=.*$//"`; do
    alias g$al="git $al"

    complete_func=_git_$(__git_aliased_command $al)
    function_exists $complete_fnc && __git_complete g$al $complete_func
done




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

shopt -s extglob
