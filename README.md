### 1:
> devbox shell

### 2:
- Cria o Cluster, Clone das imagens e Inicializa o Cluster
> devbox run task initial-setup


### 3:

- Instalar Grafana, Prometheus e Sensei
- Acessar o devbox:
> devbox run
> terraform init

- Dispoinibilizar o Grafana (em outro terminal)
> devbox run task grafana-port-forward

- Executar o terraform
> terraform apply

OBS: talvez precise executar isso fora do devbox
> cd terraform/ && devbox run terraform apply
