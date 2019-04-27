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

# Activates the virtualenv wrapper for the cwd
function vaw
    source ~/.virtualenvs/(basename (pwd))/bin/activate
end

set GIT_CMD (which hub)

function g
    if [ (count $argv) -eq 0 ]
        eval $GIT_CMD status
    else
        eval $GIT_CMD \"$argv\"
    end
end

function nvm
  bass source ~/.nvm/nvm.sh --no-use ';' nvm $argv
end

bass source $HOME/.rvm/scripts/rvm
set -g fish_user_paths "/usr/local/opt/openssl/bin" $fish_user_paths
set -g fish_user_paths "/usr/local/opt/mysql-client/bin" $fish_user_paths

set -gx PATH ~/Library/Python/3.7/bin/ $PATH
set -x LC_ALL en_US.UTF-8
set -x LANG en_US.UTF-8

set -x FZF_DEFAULT_COMMAND 'fd --type f'

set -x NVM_DIR "$HOME/.nvm"
bass source "$NVM_DIR/nvm.sh"

eval (python -m virtualfish)

if set -q VIRTUAL_ENV
    echo -n -s (set_color -b blue white) "(" (basename "$VIRTUAL_ENV") ")" (set_color normal) " "
end
