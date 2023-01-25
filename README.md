# Provisionamento e Operação de Infraestrutura

## Objetivos do projeto
* Provisionar um cluster Kubernetes na AWS
* Rodar uma aplicação em Kubernetes no cluster
* Observar que, conforme o consumo de recursos varia, o control plane aumenta ou diminui o número de pods no cluster
* Monitorar essas métricas via Prometheus

## Pré-requisitos
* Uma conta na AWS com uma chave de acesso e a CLI [instalada](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-prereqs.html) e [configurada](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-configure.html)
* [Terraform](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)
* [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html)

## Arquitetura
* **Cluster Kubernetes:** 1 nó Control Plane e 2 nós Workers
* **Prometheus:** Presente no nó do Control Plane
* **Load Balancer:** Redireciona o tráfego para os nós Workers

![Imagem da arquitetura da infraestrutura](./assets//arquitetura.png)

## Provisionamento

Para provisionar e configurar basta executar:
```bash
$ bash provision.sh
```
### Terraform
Responsável por provisionar os seguintes recursos na AWS:
* 1 template de instância (Ubuntu 20.04, t2.medium)
* 3 instâncias EC2 a partir do template (1 CP e 2 Workers)
* 1 chave pública para conseguir acesso às instâncias
* 1 Network Load Balancer para redirecionar o tráfego para os Workers
* 1 VPC e 1 sub-rede pública
* 1 Elastic IP para ser anexado à sub-rede das instâncias
* 1 Security Group (Firewall) regulando o tráfego de entrada nas instâncias

### Ansible
Ferramenta de configuração remota responsável por:
* Instalar e configurar o Kubernetes em todos os nós do cluster
* Inicializar o cluster no _Control Plane_
* Conectar os _Workers_ ao _Control Plane_
* Instalar e configurar o Prometheus no _Control Plane_

## Deploy
TODO

## Uso
TODO
