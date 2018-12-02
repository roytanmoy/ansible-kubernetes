#!/bin/bash
cd ~/app-docker
kubectl create -f app-deployment.yaml --record
kubectl create -f app-service.yaml --record
