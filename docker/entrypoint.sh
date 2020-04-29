#!/usr/bin/env zsh

VOLUMES=(
  /opt/node
  /opt/rbenv
  /home/epavlica/projects
)

if [[ "$UID" == 0 ]]; then
  foreach dir in $VOLUMES
  do
    mkdir -p $dir
    chmod -R 775 $dir
    chgrp -R devs $dir
  done
fi

exec "$@"
