HISTSIZE=2048
HISTTIMEFORMAT="%F %T "
PS1="[\u@\h \[\e[36m\]\w\[\e[0m\]]\\$ "

[ ! -d /tmp/history/$USER ] && { mkdir -p /tmp/history/$USER; chmod 700 /tmp/history/$USER; }
PROMPT_COMMAND='{ cmd=$(history 1 | { read a b c d; echo "$d"; });login_msg=$(who am i |awk "{print \$1,\$NF}");\
echo $(date +"%F %T") "$login_msg $USER $PWD # $cmd" >> /tmp/history/$USER/$(date +"%F").log; }'
