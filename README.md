
# :rocket: GitOps :rocket: 



------script two enviroment-----







-------canary--------

1.install 
kubectl create namespace argo-rollouts
kubectl apply -n argo-rollouts -f https://raw.githubusercontent.com/argoproj/argo-rollouts/stable/manifests/install.yaml

2.create rollout.yml