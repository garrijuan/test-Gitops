
# :rocket: GitOps :rocket: 



------script two enviroment-----
sudo apt-get install -y gettext

create values-dev.yml
create values-pro.yml

CRD_template.yml --script base con variables de entorno
--para desplegar utilizando values especidicos segun que entorno
./deploy.sh dev
./deploy.sh pro


Change1


-------canary--------

1.install 
kubectl create namespace argo-rollouts
kubectl apply -n argo-rollouts -f https://raw.githubusercontent.com/argoproj/argo-rollouts/stable/manifests/install.yaml

2.create rollout.yml