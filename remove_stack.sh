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

# remove
rm -rf /srv/prometheus \
    /srv/alertmanager \
    /srv/grafana \
    /srv/blackbox_exporter

# remove docker-compose stack
docker-compose -f monitoring-demo-stack.yml rm -s --force
