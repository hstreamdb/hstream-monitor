#!/bin/bash

kubectl apply --server-side -f setup
kubectl wait --for condition=Established --all CustomResourceDefinition --namespace=monitoring

#根据slack url配置生成secret
kubectl create secret --namespace=monitoring generic alertmanager-config-slack-notifty-url --from-file=./alertmanager-config-slack-notifty-url.txt

kubectl apply -f ./
