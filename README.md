Aqui está um exemplo de README organizado para o seu projeto:

---

# Projeto de Alta Disponibilidade com Patroni

Este repositório contém o projeto desenvolvido para a disciplina **CK0196 - BANCOS DE DADOS DISTRIBUÍDOS**, com foco na criação e execução de um cluster PostgreSQL altamente disponível utilizando **Patroni**, uma ferramenta de automação para a configuração de bancos de dados distribuídos e de alta disponibilidade. O projeto também integra o **NocoDB**, uma ferramenta que transforma bancos de dados relacionais em uma interface de planilha.

## Equipe

- **LUIZ GUSTAVO MARQUES COSTA**: 537585
- **SAID CAVALCANTE RODRIGUES**: 538349
- **VINICIUS SABARIZ PAZ**: 420728

## Descrição do Projeto

O objetivo deste projeto é configurar um cluster de banco de dados PostgreSQL utilizando o Patroni, uma solução para alta disponibilidade que gerencia a replicação e o failover automático do banco de dados. Além disso, integramos o **NocoDB** para permitir uma interface amigável de manipulação dos dados no cluster. 

Serão utilizados scripts de automação para provisionar e gerenciar a infraestrutura, implementando os manifests e controlando os estados do cluster com **Terraform**. Por fim, será demonstrado o funcionamento do cluster e da interface com **NocoDB**, garantindo que o sistema esteja disponível e replicado corretamente.

## Pré-requisitos

Certifique-se de que as seguintes ferramentas estão instaladas:

- [Devbox](https://www.jetpack.io/devbox/)
- [Task](https://taskfile.dev/)

## Estrutura do Projeto

- `/terraform`: Contém os arquivos de configuração do Terraform para deploy da infraestrutura.
- `Taskfile.yml`: Arquivo de automação de tarefas com Taskfile.

## Instruções de Execução

Siga os passos abaixo para executar o projeto:

### 1. Instalar Dependências

Este projeto utiliza o **Devbox** para gerenciar as dependências. Execute o comando abaixo para entrar no ambiente de desenvolvimento:

```bash
devbox shell
```

### 2. Criar o Cluster e Configurar o Patroni

Execute o comando para criar o cluster, clonar as imagens necessárias e inicializar o cluster Patroni:

```bash
task initial-setup
```

Esse comando cuidará da criação do cluster no Kubernetes e da configuração inicial dos nós do PostgreSQL.

### 3. Deploy dos Manifests com Terraform

Agora, vá até a pasta do **Terraform** e inicialize o ambiente com os comandos abaixo:

```bash
cd terraform
terraform init
```

Em seguida, aplique o Terraform para fazer o deploy dos manifests e provisionar a infraestrutura:

```bash
task apply-terraform
```

### 4. Port Forward para Acesso ao NocoDB

Para acessar o **NocoDB** e interagir com o cluster de forma gráfica, faça o port-forward com o comando:

```bash
task noco-port-forward
```

Esse comando abrirá o acesso ao **NocoDB** localmente via um túnel para o Kubernetes.

## Licença

Este projeto é licenciado sob os termos da [MIT License](LICENSE).