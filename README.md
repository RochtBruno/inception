# Inception

Projeto voltado para o estudo e aplicação de Docker, com foco na criação e gerenciamento de ambientes isolados. Este repositório reúne exemplos práticos e configurações para facilitar o aprendizado sobre contêineres e boas práticas de desenvolvimento.

## Objetivo

Desenvolver ambientes automatizados utilizando Docker e Docker Compose, proporcionando uma compreensão prática sobre infraestrutura como código e DevOps.

## Funcionalidades

- Criação de ambientes isolados com Docker
- Orquestração de múltiplos serviços via Docker Compose
- Exemplos práticos para diferentes cenários de desenvolvimento

## Pré-requisitos

- [Docker](https://www.docker.com/)
- [Docker Compose](https://docs.docker.com/compose/)

## Como utilizar

1. Clone o repositório:
   ```bash
   git clone https://github.com/RochtBruno/inception.git
   cd inception
   ```
2. Edite os arquivos de configuração conforme necessário.
3. Inicie os serviços:
   ```bash
   docker-compose up -d
   ```
4. Para encerrar os serviços:
   ```bash
   docker-compose down
   ```

## Estrutura do repositório

```
inception/
├── docker-compose.yml
├── src/
│   └── ...
├── README.md
└── outros arquivos e diretórios
```
