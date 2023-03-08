set -x LC_ALL en_US.UTF-8

set -x LANG en_US.UTF-8
set -x DISABLE_SPRING true

set GIT_CMD (which hub)

function g
    if [ (count $argv) -eq 0 ]
        eval $GIT_CMD status
    else
        eval $GIT_CMD \"$argv\"
    end
end

set -x NVM_DIR "$HOME/.nvm"
function nvm
    bass source $NVM_DIR/nvm.sh --no-use ';' nvm $argv
end

set -g fish_user_paths "/usr/local/opt/openssl/bin" $fish_user_paths
set -g fish_user_paths "/usr/local/opt/mysql-client/bin" $fish_user_paths

set -gx PATH ~/Library/Python/3.7/bin/ $PATH

set -x FZF_DEFAULT_COMMAND 'fd --type f'

if set -q VIRTUAL_ENV
    echo -n -s (set_color -b blue white) "(" (basename "$VIRTUAL_ENV") ")" (set_color normal) " "
end

set JAVA_HOME (/usr/libexec/java_home -v 1.8.0)

set ANDROID_HOME $HOME/Library/Android/sdk

set PATH $ANDROID_HOME/emulator $PATH
set PATH $ANDROID_HOME/tools $PATH
set PATH $ANDROID_HOME/tools/bin $PATH
set PATH $ANDROID_HOME/platform-tools $PATH
set PATH $HOME/.rbenv/bin $PATH

if test -f /Users/patrickbassut/.autojump/share/autojump/autojump.fish; . /Users/patrickbassut/.autojump/share/autojump/autojump.fish; end

#!/usr/bin/fish
function retry -d 'Retry a command up to a specified number of times, until it exits successfully'
  if test (count $argv) -lt 2; or string match -irqv '^[0-9]+$' $argv[1]
    printf 'Proper use: %s [number of attempts until giving up] [command to attempt]\n' (status function);
    return 23
  else
    set -l retries $argv[1]
    set -l command (string split -m 1 ' ' "$argv")[2];
      and printf 'eval %s\n' (printf '%s ' $command)
    for i in (seq $retries)
      eval $command
      set -l cmd_status $status
      if test $cmd_status -eq 1
        printf 'Try #%d of %d succeeded.\n' $i $retries
        return 0
      else if test $i -eq $retries
        set -l exit $status
        printf 'Final try #%d exited %d.\n' $i $cmd_status
        return $cmd_status
      else
        set -l wait 1
        printf 'Try #%d of %d exited %d, retrying in %s...\n\n' $i $retries $cmd_status (math "1000 * $wait")
        sleep $wait
      end
    end
  end
end
