# Django alias commands
set manage "python manage.py"
alias rds "$manage runserver"
alias migrate "$manage migrate"
alias mmigrations "$manage makemigrations"
alias sp "$manage shell_plus"
alias va "source bin/activate"

alias ctags="`brew --prefix`/bin/ctags"

alias pyclean='find . -type f -name "*.py[co]" -delete'

set LC_ALL en_US.UTF-8
set LANG en_US.UTF-8
#set ANDROID_HOME /usr/local/share/android-sdk

#set PATH $PATH /usr/local/Cellar/rabbitmq/3.6.1/sbin/
#set PATH $PATH /Applications/Postgres.app/Contents/Versions/latest/bin
#set PATH $PATH $ANDROID_HOME/tools:$ANDROID_HOME/platform-tools
#set PATH $PATH $HOME/.fastlane/bin
#set PATH $PATH /Library/Frameworks/Python.framework/Versions/3.5/bin

# Activates the virtualenv wrapper for the cwd
function vaw
    source ~/.virtualenvs/(basename (pwd))/bin/activate
end

set GIT_CMD (which hub)

function g
    if [ (count $argv) -eq 0 ]
        eval $GIT_CMD status
    else
        eval $GIT_CMD $argv
    end
end
