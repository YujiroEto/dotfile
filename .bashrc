
source ~/perl5/perlbrew/etc/bashrc

alias vi='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
alias vim='env_LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'

export PATH=$PATH:/usr/loacl/git/bin


# git settings
source /usr/local/git/contrib/completion/git-prompt.sh
source /usr/local/git/contrib/completion/git-completion.bash
GIT_PS1_SHOWDIRTYSTATE=true
export PS1='\[\033[1;32m\]\u@\h\[\033[00m\]:\[\033[1;34m\]\w\[\033[1;31m\]$(__git_ps1)\[\033[00m\]\$ '


alias ls='ls -G'
alias la='ls -a'
alias ll='ls -l'
alias rm='rm -r'
alias cp='cp -r'


#alias ls='ls --color = auto'

