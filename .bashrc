alias ssh_amon2_app='ssh yujiro@ec2-54-186-234-86.us-west-2.compute.amazonaws.com'

export PATH=$PATH:/usr/loacl/git/bin


source /usr/local/etc/bash_completion.d/git-prompt.sh
source /usr/local/etc/bash_completion.d/git-completion.bash

# if [ -f ~/.git-completion.bash ]; then
# 	source ~/.git-completion.bash
# fi
# 
# if [ -f ~/.git-prompt.sh ]; then
# 	source ~/.git-prompt.sh
# fi

# git settings
GIT_PS1_SHOWDIRTYSTATE=true
export PS1='\[\033[1;32m\]\u@\h\[\033[00m\]:\[\033[1;34m\]\w\[\033[1;31m\]$(__git_ps1)\[\033[00m\]\$\n '
export LSCOLORS=gxfxcxdxbxegedabagacad


alias ls='ls -G'
alias la='ls -a'
alias ll='ls -l'
alias rm='rm -r'
alias cp='cp -r'
alias v='vim'
alias ga='git add .'
alias gpull='git pull'
alias gpush='git push origin master'

#alias ls='ls --color = auto'


### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
