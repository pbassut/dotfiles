# Django alias commands
manage="python manage.py"
alias rds="$manage runserver"
alias migrate="$manage migrate"
alias mmigrations="$manage makemigrations"
alias va="source bin/activate"
alias sp="$manage shell_plus"
alias eshcelery='celery -A eshares.celery_config worker --loglevel=info --autoreload'

alias pyclean='find . -type f -name "*.py[co]" -delete'


# Activates the virtualenv wrapper for the cwd
function vaw {
    source ~/.virtualenvs/$(basename $(pwd))/bin/activate;
}

source ~/.bashrc

export PATH="$PATH:/usr/local/Cellar/rabbitmq/3.6.1/sbin/"

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
source /usr/local/bin/virtualenvwrapper.sh
export ESHARES_SKIP_GEVENT=1
export PATH="/Users/patrickbassut/Programming/eshares/bin:$PATH"
export PATH=":/Applications/Kaleidoscope.app/Contents/Resources/bin:$PATH"

source ~/git-completion.bash

# Show git branch
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/[\1]/'
  }

  # Show hg branch
  function parse_hg_branch {
    if [ "$(hg root 2> /dev/null)" ]; then
        printf "[$(hg branch)]"
      fi
  }

  # Setting up locale
  export LANG=en_US.UTF-8
  unset LC_ALL

  # Set the colored prompt.
  CODE_RED=$'\[\033[0;31m\]'
  CODE_GREEN=$'\[\033[0;32m\]'
  CODE_YELL=$'\[\033[0;33m\]'
  CODE_BLUE=$'\[\033[0;34m\]'
  CODE_NORM=$'\[\033[m\]'
  CODE_GRAY=$'\[\033[1;36m\]'
  PRUSER="\u"
  PRTERM=":\l "
  PREXIT="${CODE_YELL}\$EXITCODE${CODE_NORM}"
  PRPROMPT="$"
  if [ "$EUID" = "0" ]; then
        PRUSER="${CODE_RED}\u${CODE_NORM}"
          PRPROMPT="${CODE_RED}#${CODE_NORM}";
      fi
      
      TITLEBAR="\[\033]0;\w\007\]"
      PSTRING=$PREXIT$TITLEBAR${CODE_GREEN}$PRPROMPT${CODE_NORM}
      
      PS1="${CODE_GRAY}\w${CODE_YELL}\$(parse_git_branch)${CODE_RED}\$(parse_hg_branch) ${CODE_NORM}${TITLEBAR}${PSTRING} "
      
      export PS1;
