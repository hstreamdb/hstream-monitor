#!/bin/bash

kubectl apply -f crd/
kubectl apply -f operator/

kubectl apply -k ./
