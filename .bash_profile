# Django alias commands
manage="python manage.py"
alias rds="$manage runserver"
alias migrate="$manage migrate"
alias mmigrations="$manage makemigrations"
alias va="source bin/activate"

export PATH="$PATH:/usr/local/Cellar/rabbitmq/3.6.1/sbin/"

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
