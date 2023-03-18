- https://argo-cd.readthedocs.io/en/stable/operator-manual/declarative-setup/
- https://docs.aws.amazon.com/AmazonECR/latest/userguide/push-oci-artifact.html







kubectl label node node-00 service=myapp
kubectl label node node-01 service=myapp

kubectl taint nodes node-00 fluentd=true:NoSchedule
kubectl taint nodes node-01 fluentbit=true:NoSchedule

kubectl taint nodes node-02 elk=true:NoSchedule
kubectl taint nodes node-03 elk=true:NoSchedule
kubectl taint nodes node-04 kibana=true:NoSchedule
