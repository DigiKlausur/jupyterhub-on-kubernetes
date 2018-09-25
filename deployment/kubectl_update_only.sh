helm repo update
RELEASE=e2-jhub
NAMESPACE=e2-jhub
helm upgrade $RELEASE jupyterhub/jupyterhub --namespace $NAMESPACE --version 0.7.0 --values config/config_update.yaml
