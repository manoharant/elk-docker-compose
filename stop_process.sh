ps -eaf | grep deployments/routeoffer-v11 | awk '{print $2}' | xargs kill
ps -eaf | grep deployments/routing-v1 | awk '{print $2}' | xargs kill
ps -eaf | grep deployments/loadability-v5 | awk '{print $2}' | xargs kill
ps -eaf | grep deployments/capacity-v7 | awk '{print $2}' | xargs kill
ps -eaf | grep deployments/flightcontrol-v6 | awk '{print $2}' | xargs kill
ps -eaf | grep deployments/pricing-v8 | awk '{print $2}' | xargs kill
ps -eaf | grep deployments/booking-v11 | awk '{print $2}' | xargs kill