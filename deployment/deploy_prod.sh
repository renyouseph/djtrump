#!/bin/sh

ssh root@35.153.175.34 <<EOF
  cd djtrump
  git pull
  source /opt/envs/djtrump/bin/activate
  pip3 install -r requirements.txt
  pip3 install psycopg2 --upgrade
  pip3 install http://initd.org/psycopg/upload/psycopg2-2.7.3.1.dev0/psycopg2-2.7.3.1.dev0-cp36-cp36m-manylinux1_x86_64.whl
  ./manage.py migrate
  sudo supervisorctl restart djtrump
  exit
EOF
