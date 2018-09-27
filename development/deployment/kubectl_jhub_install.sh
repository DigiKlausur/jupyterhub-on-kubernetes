#openssl rand -hex 64
helm repo add jupyterhub https://jupyterhub.github.io/helm-chart/
helm repo update
RELEASE=dev-datahub
NAMESPACE=dev-datahub
helm upgrade --install $RELEASE jupyterhub/jupyterhub --namespace $NAMESPACE --version 0.7.0 --values config/config.yaml
