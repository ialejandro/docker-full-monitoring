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

# copy configs
cp -r ./configs/prometheus        /srv/prometheus
cp -r ./configs/alertmanager      /srv/alertmanager
cp -r ./configs/blackbox_exporter /srv/blackbox_exporter
cp -r ./configs/grafana           /srv/grafana

# run docker-compose
docker-compose -f prometheus-demo-stack.yml up -d
