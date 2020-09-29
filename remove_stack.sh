#! /bin/bash
EXIST=$(command -v docker-compose >/dev/null; echo $?)
if [[ ${EXIST} -ne 0 ]]; then
    echo "docker-compose must be installed"
    exit 1
fi

# remove environment
WORKDIR=${HOME}/monitoring
rm -rf ${WORKDIR}

# remove docker-compose stack
docker-compose -f monitoring-demo-stack.yml rm -s --force
