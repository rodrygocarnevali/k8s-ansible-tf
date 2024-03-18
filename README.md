# Cluster Kubernetes para Implantação Rápida - Estudos DevOps

Este é um projeto pessoal simples, projetado para explorar e entender os conceitos relacionados.

## Ferramentas DevOps Utilizadas:

- Drone CI
- AWS
- Terraform
- Ansible
- Docker
- Kubernetes

## Descrição do Projeto:

O Drone CI inicia uma pipeline que utiliza o Terraform para criar 3 instâncias na AWS.

### Terraform:
- Cria 3 instâncias AWS com tags específicas para facilitar a localização.
- Configura um bucket S3 na AWS para armazenamento do `terraform.tfstate`.
- Define um grupo de segurança.
- Gera um par de chaves.

### Ansible:
- Instala e configura o Docker e o Kubernetes nas instâncias criadas.

Todos os recursos são coordenados em uma pipeline do Drone CI.

O Drone CI utiliza uma imagem Docker personalizada que inclui o Terraform e o Ansible.

## Objetivo:

Este projeto tem como objetivo fornecer um método simples para configurar um cluster Kubernetes composto por 3 instâncias AWS. Tudo isso é automatizado através de uma pipeline.

Para mais informações sobre como utilizar este projeto, consulte a documentação dentro de cada diretório correspondente.

---
**Nota:** Certifique-se de configurar corretamente suas credenciais AWS e as configurações do Drone CI antes de utilizar este projeto em seu próprio ambiente.
