
# Testes Automatizados - Desafio Coco Bambu

Desafio técnico – Este repositório contém testes automatizados utilizando o **Robot Framework**.

## Configurações para Clonar e Rodar o Projeto

### 1. Clonar o Repositório
```bash
# Clone o repositório para sua máquina
git clone https://github.com/HugoSMonteiro/desafio_coco_bambu.git
```

### 2. Instalar o Robot Framework e Bibliotecas Necessárias
```bash
pip install -r requirements.txt
```

### 3. Verificar a Instalação
```bash
# Confirma se o Robot Framework e o Python foram instalados corretamente
robot --version
python --version
```

## Executar os Testes

O arquivo de testes está localizado em `delivery_tests.robot`. Para executar os testes, utilize o comando abaixo:
```bash
robot delivery_tests.robot
```

## Configurações de Execução

Os testes podem ser executados em modo **headless** (sem abrir o navegador) ou com o navegador aberto.

A definição do modo de execução é feita no `Test Setup` do arquivo `delivery_tests.robot`, utilizando uma das duas keywords abaixo:

- Para rodar os testes em **modo headless**, utilize a keyword:
```
Configurar Navegador Headless e Acessar Delivery
```

- Para rodar os testes **com o navegador aberto**, utilize a keyword:
```
Abrir Navegador Para Página de Delivery
```

Basta alterar a keyword no `Test Setup` conforme sua necessidade.

## Pipeline CI/CD

O projeto conta com uma configuração de **Pipeline CI/CD**, que executa os testes automaticamente a cada atualização no repositório. Isso garante maior controle de qualidade e confiabilidade nas execuções.
