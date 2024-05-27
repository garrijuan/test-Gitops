
# :rocket: GitOps :rocket: 


# RAMA DEV

change 3 with token github



1.install 
kubectl create namespace argo-rollouts
kubectl apply -n argo-rollouts -f https://raw.githubusercontent.com/argoproj/argo-rollouts/stable/manifests/install.yaml

2.create rollout.yml