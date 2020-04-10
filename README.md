# Docker: Prometheus + Alertmanager + Grafana

Deploy a full monitoring stack with basic configuration ([Prometheus](https://prometheus.io/docs/introduction/overview/), [Alertmanager](https://prometheus.io/docs/alerting/alertmanager/), [Node Exporter](https://prometheus.io/docs/guides/node-exporter/), [Blackbox Exporter](https://github.com/prometheus/blackbox_exporter) and [Grafana](https://grafana.com/docs/)).

It's only for develop environments and **learn how-to use Prometheus monitoring**.


## Requirements

* User with privileges (`sudo`). Need create some folders on `/srv`.
* `docker-compose` installed.
* `docker` version 18.06.0+ or above. 

## Quick start

### Initialize Stack

* Deploy configs.
* Started containers.

```bash
$ sudo ./initialize_stack.sh
```

### Remove Stack

* Remove configs.
* Stop and remove containers.

```bash
$ sudo ./remove_stack.sh
```

## Services

### Prometheus

* **Name Container**: prometheus
* **Image**: prom/prometheus:latest
* **Port**: 9090
* **Configuration**: `/srv/prometheus/prometheus.yml`
* **Rules**: `/srv/prometheus/rules.d/*.yml`

### Alertmanager

* **Name Container**: alertmanager
* **Image**: prom/alertmanager:latest
* **Port**: 9093
* **Configuration**: `/srv/alertmanager/alertmanager.yml`

### Grafana

* **Name Container**: grafana
* **Image**: grafana/grafana:latest
* **Port**: 3000
* **Provisioning**: `/srv/grafana/provisioning`
* **Dashboards**: `/srv/grafana/dashboards`

#### Dashboards

**By default** exists the Node Exporter dashboard (id: [1860](https://grafana.com/grafana/dashboards/1860)). If you want added new dashboards, use Grafana **provisioning** function to save the dashboards. Only need create `.json` file on `configs/grafana/dashboards` folder.

Check the currently `configs/grafana/provisioning` folders to see the demo configuration.

#### Datasources

**By default** exists the Prometheus datasource. If the dashboard uses another **datasource** -- non-default Prometheus datasource--, please, added on `datasources` the new `.yml` file.

Check the currently `configs/grafana/provisioning` folders to see the demo configuration.

## Exporters

### Blackbox Exporter

* **Name Container**: blackbox_exporter
* **Image**: prom/blackbox-exporter
* **Port**: 9115
* **Configuration**: `/srv/blackbox_exporter/blackbox.yml`

### Node Exporter

* **Name Container**: node_exporter
* **Image**: prom/node-exporter:latest
* **Port**: 9100

## Contributing

Refer to [CONTRIBUTING.md](https://github.com/ialejandro/prometheus-stack/blob/master/CONTRIBUTING.md).

## License

Apache License 2.0. Refer to [LICENSE](https://github.com/ialejandro/prometheus-stack/blob/master/LICENSE).
