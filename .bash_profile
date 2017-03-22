# Django alias commands
manage="python manage.py"
alias rds="$manage runserver"
alias migrate="$manage migrate"
alias mmigrations="$manage makemigrations"
alias va="source bin/activate"
alias sp="$manage shell_plus"

alias ctags="`brew --prefix`/bin/ctags"

alias pyclean='find . -type f -name "*.py[co]" -delete'

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Activates the virtualenv wrapper for the cwd
function vaw {
    source ~/.virtualenvs/$(basename $(pwd))/bin/activate;
}


export PATH="$PATH:/usr/local/Cellar/rabbitmq/3.6.1/sbin/"

export ANDROID_HOME="/usr/local/Cellar/android-sdk/24.4.1_1/"
test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
export PATH="/Applications/Postgres.app/Contents/Versions/latest/bin:$PATH"
export PATH="$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$PATH"


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

# Setting PATH for Python 3.5
# The orginal version is saved in .bash_profile.pysave
export PATH="/Library/Frameworks/Python.framework/Versions/3.5/bin:${PATH}"

GIT_CMD=`which git`

function g {
    if [[ "$#" -eq 0 ]]; then
        $GIT_CMD status
    else
        $GIT_CMD "$@"
    fi
}

source ~/.bashrc
source ~/.git-completion.bash
