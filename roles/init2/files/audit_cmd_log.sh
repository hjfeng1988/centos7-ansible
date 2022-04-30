readonly PROMPT_COMMAND='{ cmd=$(history 1 | { read a b c d; echo "$d"; });login_msg=$(who am i |awk "{print \$2,\$5}");logger -i -p local1.notice "$login_msg $USER $PWD # $cmd"; }'
