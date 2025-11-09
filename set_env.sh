#!/bin/bash

# Start Cluster without CNI
minikube start --nodes 3 --cpus='4' --memory='15617' --disk-size='50000' --cni=false

minikube ssh "sudo sysctl fs.inotify.max_user_watches=524288"
minikube ssh "sudo sysctl fs.inotify.max_user_instances=512"

minikube ssh --node="minikube-m02" "sudo sysctl fs.inotify.max_user_watches=524288"
minikube ssh --node="minikube-m02" "sudo sysctl fs.inotify.max_user_instances=512"

minikube ssh --node="minikube-m03" "sudo sysctl fs.inotify.max_user_watches=524288"
minikube ssh --node="minikube-m03" "sudo sysctl fs.inotify.max_user_instances=512"
