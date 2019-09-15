#! /bin/bash

if [[ ${EUID} -ne 0 ]]; then
    echo "must be root"
    exit 1
fi

EXIST=$(command -v docker-compose >/dev/null; echo $?)
if [[ ${EXIST} -ne 0 ]]; then
    echo "docker-compose must be installed"
    exit 1
fi

# create dirs
rm -rf /srv/prometheus \
    /srv/alertmanager \
    /srv/grafana \
    /srv/blackbox_exporter

# run docker-compose
docker-compose -f prometheus-demo-stack.yml rm -s --force
