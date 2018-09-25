openssl rand -hex 32
helm repo add jupyterhub https://jupyterhub.github.io/helm-chart/
helm repo update
RELEASE=e2-jhub
NAMESPACE=e2-jhub
helm upgrade --install $RELEASE jupyterhub/jupyterhub --namespace $NAMESPACE --version 0.7.0 --values config/config_update.yaml
