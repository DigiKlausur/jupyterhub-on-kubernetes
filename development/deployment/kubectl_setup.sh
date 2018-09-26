# Setup zone
gcloud components install kubectl
ZONE=europe-west1-b
gcloud config set compute/zone $ZONE

# Create cluster
CLUSTERNAME=e2-datahub
gcloud beta container clusters create $CLUSTERNAME --machine-type n1-standard-2 --num-nodes 2 --disk-size 100 --cluster-version latest --node-labels hub.jupyter.org/node-purpose=core
kubectl get node

EMAIL=mhm.wasil@gmail.com
kubectl create clusterrolebinding cluster-admin-binding --clusterrole=cluster-admin --user=$EMAIL

# Insrall helm
#curl https://raw.githubusercontent.com/kubernetes/helm/master/scripts/get | bash
#kubectl --namespace kube-system create serviceaccount tiller
#kubectl create clusterrolebinding tiller --clusterrole cluster-admin --serviceaccount=kube-system:tiller
#helm init --service-account tiller
#helm version

# Add jupyterhub
#openssl rand -hex 32 (edit config.yaml)
#helm repo add jupyterhub https://jupyterhub.github.io/helm-chart/
#helm repo update
#RELEASE=e2-jhub
#NAMESPACE=e2-jhub
#helm upgrade --install $RELEASE jupyterhub/jupyterhub --namespace $NAMESPACE --version 0.7.0 --values config.yaml
