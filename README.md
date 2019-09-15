# Prometheus Stack

This project deploy a demo Prometheus stack with basic configuration ([Prometheus](https://prometheus.io/docs/introduction/overview/), [Alertmanager](https://prometheus.io/docs/alerting/alertmanager/), [Node Exporter](https://prometheus.io/docs/guides/node-exporter/), [Blackbox Exporter](https://github.com/prometheus/blackbox_exporter) and [Grafana](https://grafana.com/docs/)).

## Requirements

* User with privileges (`sudo`).
* `docker-compose` installed.
* `docker` version 18.06.0+ or above. 

## Quick start

### Initialize Stack

```bash
sudo ./initialize_stack.sh
```

### Remove stack

```bash
sudo ./remove_stack.sh
```

## Services

### Prometheus

* **Name Container**: prometheus
* **Image**: prom/prometheus:latest
* **Port**: 9090
* **Configuration**: `/srv/prometheus/prometheus.yml`
* **Rules**: `/srv/prometheus/rules.d/demo.yml`

### Alertmanager

* **Name Container**: alertmanager
* **Image**: prom/alertmanager:latest
* **Port**: 9093
* **Configuration**: `/srv/alertmanager/alertmanager.yml`

### Node Exporter

* **Name Container**: node_exporter
* **Image**: prom/node-exporter:latest
* **Port**: 9100

### Blackbox Exporter

* **Name Container**: blackbox_exporter
* **Image**: prom/blackbox-exporter
* **Port**: 9115
* **Configuration**: `/srv/blackbox_exporter/blackbox.yml`

### Grafana

* **Name Container**: grafana
* **Image**: grafana/grafana:latest
* **Port**: 3000
* **Provisioning**: `/srv/grafana/provisioning`
* **Dashboards**: `/srv/grafana/dashboards`
