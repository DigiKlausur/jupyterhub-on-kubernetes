# Setup zone
gcloud components install kubectl
ZONE=europe-west1-b
gcloud config set compute/zone $ZONE

# Create cluster
CLUSTERNAME=e2-x-am-cluster
gcloud beta container clusters create $CLUSTERNAME --machine-type n1-standard-2 --num-nodes 4 --disk-size 400 --cluster-version latest --node-labels hub.jupyter.org/node-purpose=core
kubectl get node

EMAIL=mhm.wasil@gmail.com
kubectl create clusterrolebinding cluster-admin-binding --clusterrole=cluster-admin --user=$EMAIL

