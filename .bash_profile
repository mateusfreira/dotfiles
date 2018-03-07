if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi
export GOPATH=$HOME
source ~/.git-prompt.sh

# The next line updates PATH for the Google Cloud SDK.
if [ -f /Users/user/Downloads/google-cloud-sdk/path.bash.inc ]; then
  source '/Users/user/Downloads/google-cloud-sdk/path.bash.inc'
fi

# The next line enables shell command completion for gcloud.
if [ -f /Users/user/Downloads/google-cloud-sdk/completion.bash.inc ]; then
  source '/Users/user/Downloads/google-cloud-sdk/completion.bash.inc'
fi
export GOOGLE_APPLICATION_CREDENTIALS=/Users/user/git/callinize/tenfold-backend-services.json
source ~/git-completion.bash
GIT_PS1_SHOWDIRTYSTATE=true
#export PS1='[\u@mbp \w$(__git_ps1)]\$ '
YELLOW="\[$(tput setaf 3)\]"
RESET="\[$(tput sgr0)\]"
PS1="\h:\W \u\$(__git_ps1 \" ${YELLOW}(%s)${RESET} \")\$ "

# added by Anaconda3 4.4.0 installer

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export TERM=xterm-256color
alias gpb='git push origin `git rev-parse --abbrev-ref HEAD`'
alias gst='git status'
alias gbr='git branch'
alias gca='git commit -am'
alias gc='git commit -m'
alias gco='git checkout'

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

export PATH="$HOME/.cargo/bin:$PATH"
