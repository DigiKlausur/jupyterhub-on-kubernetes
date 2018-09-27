helm repo update
RELEASE=dev-datahub
NAMESPACE=dev-datahub
helm upgrade $RELEASE jupyterhub/jupyterhub --namespace $NAMESPACE --version 0.7.0 --values config/config.yaml
