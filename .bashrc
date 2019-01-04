#
source ~/git-completion.bash

umask 02

complete -r
unset -f $(compgen -A function)
unset $(compgen -A variable _)
shopt -s cmdhist lithist extglob globstar

export HISTFILE=~/.bash_history
export HISTFILESIZE=
export HISTSIZE=$HISTFILESIZE
export HISTTIMEFORMAT='%Y%m%d%H%M%S '
export MAILCHECK=
export PS1='\n \$ '

PATH=/usr/local/bin:/usr/local/sbin
PATH=$PATH:/bin:/sbin
PATH=$PATH:/usr/bin:/usr/sbin
PATH=$PATH:$HOME/bin
export PATH

parse_git_branch() { git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'; }
force_color_prompt=yes
if [ "$color_prompt" = yes ]; then
 PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[01;31m\]$(parse_git_branch)\[\033[00m\]\$ '
else
 #PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w$(parse_git_branch)\$ '
 PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[01;31m\]$(parse_git_branch)\[\033[00m\]\$ '

fi

alias s='sudo'
#r () { sudo -iu root bash -c "$*"; }
#z () { sudo -iu zimbio bash -c "$*"; }

alias l='/bin/ls -latrF'
lsa     () { ls -lAF "$@" | less -XEr; }

cdl     () { cd "${1}" && ls; }


procs   () { ps -N --ppid=2 -o comm= | sort -u | column; }
psf     () { ps -H --sid $(pgrep -d, $@) -F; }
psa     () { if pids=`pgrep -f "$*" -d,`; then
                 ps -Ho pid,pcpu,rss,vsz,tty,s,cmd -p $pids; fi; }

alias grp='grep -lnrw -e'
alias gdev='sudo -iu zimbio gcloud config set account readwrite@livinglydev.iam.gserviceaccount.com'
alias gprod='sudo -iu zimbio gcloud config set account readwrite@livinglymedia.iam.gserviceaccount.com'
alias cellog='tail -f /var/log/zimbio/celery.log'
alias celstart='sudo service celeryd start'
alias celrestart='sudo service celeryd restart'
alias devacct="sudo -Hu zimbio python bin/make_admin.py jourdan.lieblich@livingly.com"
alias markacct="sudo -Hu zimbio python marketing_tools/bin/make_marketer.py jourdan.lieblich@livingly.com"
alias ls="ls --color"
alias ll='ls -la'
alias liv='tmux a -t liv'
alias liv2='tmux a -t liv2'
alias webpack='z && cd js_components/tools && zwatch'
alias djang='tmux a -t djangoNode'
alias go='sudo -i /var/zimbio/START_DJANGO'
alias gi='go'
alias elog='tail -f /var/log/zimbio/error.log'
alias z='cd && cd zimbio'
alias j='cd && cd jourdan'
alias clog='c && elog'
alias shell='sudo -Hu zimbio python manage.py shell'
alias dbshell='sudo -Hu zimbio python manage.py dbshell'
alias lss='ls -a'
alias cdl='cdl'
alias v='vim'
alias jobs='jobs'
alias f='fg'
alias m='fg -'
alias c='clear'
alias g='cd && cd GoogleApps'
alias media104='sudo ssh media104'
alias cronsmedia='v bcfg2/Cfg/etc/cron.d/media/media'

test -e ~/.zbashrc && source ~/.zbashrc
