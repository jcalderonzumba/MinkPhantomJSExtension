#!/bin/sh
set -e

start_browser_api(){
  CURRENT_DIR=$(pwd)
  LOCAL_PHANTOMJS="${CURRENT_DIR}/bin/phantomjs"
  if [ -f ${LOCAL_PHANTOMJS} ]; then
    ${LOCAL_PHANTOMJS} --ssl-protocol=any --ignore-ssl-errors=true vendor/jcalderonzumba/gastonjs/src/Client/main.js 8510 1024 768 2>&1 &
  else
    phantomjs --ssl-protocol=any --ignore-ssl-errors=true vendor/jcalderonzumba/gastonjs/src/Client/main.js 8510 1024 768 2>&1 >> /dev/null &
  fi
  sleep 2
}

stop_services(){
  ps axo pid,command | grep phantomjs | grep -v grep | awk '{print $1}' | xargs -I {} kill {}
  ps axo pid,command | grep php | grep -v grep | grep -v phpstorm | awk '{print $1}' | xargs -I {} kill {}
  sleep 2
}

mkdir -p /tmp/jcalderonzumba/phantomjs
stop_services
start_browser_api
cd ${CURRENT_DIR}
${CURRENT_DIR}/bin/behat
stop_services
