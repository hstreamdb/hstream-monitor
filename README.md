# HStream Monitor

**hstream-monitor** repo is used for hstream cluster ops in kubenetes include
ECK and kube-prometheus

## kube-prometheus

### Quickstart

```sh
kubectl apply --server-side -f kube-prometheus/manifests/setup
kubectl wait --for condition=Established --all CustomResourceDefinition --namespace=monitoring

cp deploy/prometheus/kustomization.yaml.example deploy/prometheus/kustomization.yaml
cp deploy/prometheus/slack-notifty-url.txt.example deploy/prometheus/slack-notifty-url.txt

# edit kustomization.yaml & slack-notifty-url.txt
# ...

# add slack_url secret
kubectl create secret \
  --namespace=monitoring generic alertmanager-config-slack-notifty-url \
  --from-file=./deploy/prometheus/slack-notifty-url.txt

kubectl apply -k deploy/prometheus
```

For details, see [kube-prometheus](./kube-prometheus/README.md)

## elastic

ECK is base on version [2.6.1](!https://github.com/elastic/cloud-on-k8s).
