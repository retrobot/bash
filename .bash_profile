# source the users bashrc if it exists
if [ -f "${HOME}/.bashrc" ]; then
  source "${HOME}/.bashrc"
fi

# Set PATH so it includes user's private bin if it exists
if [ -d "${HOME}/bin" ]; then
  PATH="${HOME}/bin:${PATH}"
fi

# Set MANPATH so it includes users' private man if it exists
# if [ -d "${HOME}/man" ]; then
#   MANPATH="${HOME}/man:${MANPATH}"
# fi

# Set INFOPATH so it includes users' private info if it exists
# if [ -d "${HOME}/info" ]; then
#   INFOPATH="${HOME}/info:${INFOPATH}"
# fi

# basic commands aliases #
alias ls="ls -aFG"
alias cd2="cd ../../"
alias cd3="cd ../../../"
alias cd4="cd ../../../../"
alias cd5="cd ../../../../../"
alias cd5="cd ../../../../../../"
alias cd6="cd ../../../../../../../"
alias cd7="cd ../../../../../../../../"
alias cd8="cd ../../../../../../../../../"
alias reload=". ~/.bash_profile"

# path
export PATH=${PATH}:/usr/local/share/npm/bin:/usr/local/lib/node_modules

# ssh connection commands
alias sshinfo='ssh -p 3784 infashi1@infashiononline.com -t "cd public_html ; bash"'
alias sshinfo2="ssh -p 3784 infashi1@infashiononline.com; cd public_html"
alias sshinfo3="ssh -p 3784 infashi1@infashiononline.com:public_html"

# platform dependant function/aliases

platform=`uname`
os='unknown'

if [ "$platform" == 'Darwin' ]; then
  os='mac'
fi

if [ $os == 'mac' ]; then
  export PATH=${PATH}:/Applications/MAMP/Library/bin
fi

# my lap variables
alias goto_web="cd /Users/Kamil/Websites"
alias goto_bones="goto_web; cd wpbones"
alias godownloads="cd ~/Downloads/"  
