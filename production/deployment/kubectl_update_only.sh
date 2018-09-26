helm repo update
RELEASE=prod
NAMESPACE=prod
helm upgrade $RELEASE jupyterhub/jupyterhub --namespace $NAMESPACE --version 0.7.0 --values config/config.yaml
