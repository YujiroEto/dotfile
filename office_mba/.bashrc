export PATH=/usr/local/bin:/usr/local/sbin:~/bin:$PATH

# git settings
source /usr/local/git/contrib/completion/git-prompt.sh
source /usr/local/git/contrib/completion/git-completion.bash
GIT_PS1_SHOWDIRTYSTATE=true
export PS1='\[\033[1;34m\]\w\[\033[1;31m\]$(__git_ps1)\[\033[00m\]\$'
#export PS1='\[\033[1;32m\]\u@\h\[\033[00m\]:\[\033[1;34m\]\w\[\033[1;31m\]$(__git_ps1)\[\033[00m\]\$'


#directory color
alias ls='ls -G'
export LSCOLORS=gxfxcxdxbxegedabagacad

alias ls='ls -G'
alias la='ls -a'
alias ll='ls -l'
alias rm='rm -r'
alias cp='cp -r'
alias v='vim'

#export PS1="$"
