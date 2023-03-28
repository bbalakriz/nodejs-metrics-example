## Node.js with metrics on Kubernetes

This is a slightly modified version of this tutorial: https://developers.redhat.com/blog/2018/12/21/monitoring-node-js-applications-on-openshift-with-prometheus/

### Build and deploy

Just do `oc new-app https://github.com/bbalakriz/nodejs-metrics-example`

### Enable metrics

1. Edit the package.json and copy/paste the contents package.prom
2. Edit the myapp.js to include the prom-client by uncommenting the lines with has ****** in the comments 
 
### Rebuild and deploy

Retrigger build on the openshift buildconfig to auto rollout the updated version. 
New `metrics` endpoint should be available

### Scrape from prometheus

Include a `ServiceMonitor` to auto scrape the `metrics` endpoint

```
apiVersion: monitoring.coreos.com/v1
kind: ServiceMonitor
metadata:
  name: nodejsapp-prometheus-service-monitor
spec:
  endpoints:
  - path: /prometheus
    port: 8080-tcp
  selector:
    matchLabels:
      app: nodejs-metrics-app
```
