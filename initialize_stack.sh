#! /bin/bash
EXIST=$(command -v docker-compose >/dev/null; echo $?)
if [[ ${EXIST} -ne 0 ]]; then
    echo "docker-compose must be installed"
    exit 1
fi

# create environment
WORKDIR=${HOME}/monitoring

mkdir -p ${WORKDIR}
cp -r ./configs/prometheus        ${WORKDIR}/prometheus
cp -r ./configs/alertmanager      ${WORKDIR}/alertmanager
cp -r ./configs/blackbox_exporter ${WORKDIR}/blackbox_exporter
cp -r ./configs/grafana           ${WORKDIR}/grafana

# run docker-compose
docker-compose -f monitoring-demo-stack.yml up -d
