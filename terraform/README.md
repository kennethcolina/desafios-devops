# Desafio 01: Infrastructure-as-code - Terraform

## Motivação

Recursos de infraestrutura em nubvem devem sempre ser criados utilizando gerenciadores de configuração, tais como [Cloudformation](https://aws.amazon.com/cloudformation/), [Terraform](https://www.terraform.io/) ou [Ansible](https://www.ansible.com/), garantindo que todo recurso possa ser versionado e recriado de forma facilitada.

## Objetivo

- Criar uma instância **n1-standard-1** (GCP) ou **t2.micro** (AWS) Linux utilizando **Terraform**.
- A instância deve ter aberta somente às portas **80** e **443** para todos os endereços
- A porta SSH (**22**) deve estar acessível somente para um _range_ IP definido.
- **Inputs:** A execução do projeto deve aceitar dois parâmetros:
  - O IP ou _range_ necessário para a liberação da porta SSH
  - A região da _cloud_ em que será provisionada a instância
- **Outputs:** A execução deve imprimir o IP público da instância


## Extras

- Pré-instalar o docker na instância que suba automáticamente a imagem do [Apache](https://hub.docker.com/_/httpd/), tornando a página padrão da ferramenta visualizável ao acessar o IP público da instância
- Utilização de módulos do Terraform

## Notas
- Pode se utilizar tanto AWS quanto GCP (Google Cloud), não é preciso executar o teste em ambas, somente uma.
- Todos os recursos devem ser criados utilizando os créditos gratuitos da AWS/GCP.
- Não esquecer de destruir os recursos após criação e testes do desafio para não haver cobranças ou esgotamento dos créditos.

## Solução

_Antes de executar o projeto, é necessário a criação de uma key pair na region desejada, com o nome de:_ `idwall-${AWS_REGION} (idwall-us-east-1)`  
_Essa abordagem foi escolhida com o intuito de atender o número máximo de entradas da solução._

1. Clone o projeto:
```
    $ git clone https://github.com/kennethcolina/desafios-devops.git
```
2. Vá até o diretório do terraform:
```
    $ cd desafio-devops/terraform/
```
3. Insira as suas credenciais da AWS no arquivo `terraform.tfvars/`:

4. Rode o seguinte comando para fazer download do plugin do provider selecionado:
```
    $ terraform init
```
5. Rode este comando para aplicar as alterações necessárias para criar o projeto:
```
  $ terraform apply
```
6. Preencha os inputs com valores adequados e confirme a criação dos recursos.

7. Por fim, cole o ip retornado como output em um browser a fim de acessar a página padrão do Apache.

Obs: Devido ao tamanho da aplicação, decidiu-se pela não utilização de módulos do Terraform. Analisando a solução, não foi possível encontrar vantagem em criar módulos, conforme explicado [aqui](https://www.terraform.io/docs/modules/index.html#when-to-write-a-module).