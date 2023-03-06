# kube-prometheus

kube-prometheus is base on version
[0.12.0](!https://github.com/prometheus-operator/kube-prometheus).

## Requirements

kube-prometheus-0.12.0 requires the k8s version between 1.24 and 1.25, the
others mignt work.

## The configuration need to set before deploying

- **grafana-pvc.yaml** set `storageClassName` to a valid sc name
- **prometheus-prometheus.yaml** set `storageClassName` to a valid sc name
- **hstream_exporter.yaml**
  - set `-addr` to a valid dns name of hserver
  - set `replicas` to adapt to your actual needs
- **alertmanager-config-slack-notifty-url.txt** set slack channel url **the
  shell `startup.sh` will create a same name `secret` with the url. You need to
  recreate the secret manually if you change the url config**

## Expose service port

Modify the following service files to set the `nodePort` to expose service port

- alertmanager-service.yaml
- grafana-service.yaml
- prometheus-service.yaml

## Other modification files

### Grafana

- **grafana-dashboardDefinitions.yaml** add hstream dashboard
  config：hstream-overview.json
- **grafana-deployment.yaml** add dashboard configmap and pvc volume
- **grafana-service.yaml** change service type to NodePort

### Prometheus

- **prometheus-prometheusRule.yaml** add new rule for hstream cluster
- **prometheus-service.yaml** change service type to NodePort

### Alertmanager

- **alertmanager-config-slack-notifier.yaml** define slack alert notifier
  ，refer[user-guides](!https://github.com/prometheus-operator/prometheus-operator/blob/main/Documentation/user-guides/alerting.md)
- **alertmanager-alertmanager.yaml** add config
  `spec.alertmanagerConfigSelector.matchLabels` to select the slack alert
  notifier
- **alertmanager-service.yaml** change service type to NodePort
