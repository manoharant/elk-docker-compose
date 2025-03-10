#!/bin/bash

NAMESPACE="be-booking-sprint-int"
LOG_DIR="logs"

mkdir -p "$LOG_DIR"

#for POD in $(kubectl get pods -n "$NAMESPACE" --output=jsonpath='{.items[*].metadata.name}'); do
#  echo "Collecting logs from pod $POD"
#  kubectl logs "$POD" -n "$NAMESPACE" > "$LOG_DIR/$POD.log"
#done

ps -eaf | grep deployments/routeoffer-v11 | awk '{print $2}' | xargs kill
ps -eaf | grep deployments/routing-v1 | awk '{print $2}' | xargs kill
ps -eaf | grep deployments/loadability-v5 | awk '{print $2}' | xargs kill
ps -eaf | grep deployments/capacity-v7 | awk '{print $2}' | xargs kill
ps -eaf | grep deployments/flightcontrol-v6 | awk '{print $2}' | xargs kill
ps -eaf | grep deployments/pricing-v8 | awk '{print $2}' | xargs kill
ps -eaf | grep deployments/booking-v11 | awk '{print $2}' | xargs kill

kubens "$NAMESPACE"
kubectl logs deployments/routeoffer-v11 -f > "$LOG_DIR/routeoffer-service.log" &
kubectl logs deployments/routing-v1 -f > "$LOG_DIR/routing-service.log" &
kubectl logs deployments/loadability-v5 -f > "$LOG_DIR/loadability-service.log" &
kubectl logs deployments/capacity-v7 -f > "$LOG_DIR/capacity-service.log" &
kubectl logs deployments/flightcontrol-v6 -f > "$LOG_DIR/flightcontrol-service.log" &
kubectl logs deployments/pricing-v8 -f > "$LOG_DIR/pricing-service.log" &
kubectl logs deployments/booking-v11 -f > "$LOG_DIR/booking-service.log" &