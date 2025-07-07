# API de Gestão Escolar: Pipeline de CI/CD com Testes e Deploy na Nuvem

[![Python](https://img.shields.io/badge/Python-3.11%2B-blue.svg)](https://www.python.org/)
[![Framework](https://img.shields.io/badge/Framework-FastAPI-green.svg)](https://fastapi.tiangolo.com/)
[![Container](https://img.shields.io/badge/Container-Docker-blue.svg)](https://www.docker.com/)
[![CI/CD](https://img.shields.io/badge/CI%2FCD-GitHub%20Actions-lightgrey.svg)](https://github.com/features/actions)
[![Deploy](https://img.shields.io/badge/Deploy-Google%20Cloud%20Run-lightgrey.svg)](https://cloud.google.com/run)
<!-- Substitua SEU_USUARIO/SEU_REPOSITORIO pelo seu usuário e nome do repositório -->
[![Status do Pipeline](https://github.com/HaackDEV/imersao-devops/actions/workflows/docker-image.yml/badge.svg)](https://github.com/HaackDEV/imersao-devops/actions/workflows/docker-image.yml)

---

## 🚀 Visão Geral

Este repositório é um **fork** do projeto da [Imersão DevOps da Alura](https://www.alura.com.br/imersao-devops). Meu objetivo foi aplicar e demonstrar um fluxo de trabalho de DevOps completo, transformando a aplicação em uma solução **cloud-native** com **deploy totalmente automatizado e seguro**.

O foco do meu trabalho foi na infraestrutura como código e na automação, mostrando como levar uma aplicação do desenvolvimento à produção de forma eficiente, confiável e com garantia de qualidade.

**Demonstração ao Vivo:** https://api-736263380777.southamerica-east1.run.app/docs

---

## 🛠️ Minha Contribuição (DevOps & CI/CD)

As principais atividades que realizei neste projeto foram:

- **Containerização com Docker**:
  - Criei um `Dockerfile` para empacotar a aplicação FastAPI, garantindo um ambiente de execução consistente e isolado.

- **Orquestração Local com Docker Compose**:
  - Desenvolvi um arquivo `docker-compose.yml` para simplificar a configuração e execução do ambiente de desenvolvimento local com um único comando.

- **Automação de CI/CD com GitHub Actions**:
  - Implementei um pipeline de Integração e Entrega Contínua (CI/CD) que automatiza todo o processo de deploy. A cada `push` para a branch `main`, o workflow é acionado para:
    1.  Autenticar de forma segura no Google Cloud usando uma Service Account.
    2.  Fazer o **build** da imagem Docker e enviá-la para o **Google Artifact Registry**.
    3.  Realizar o **deploy** da nova versão no **Google Cloud Run** sem qualquer intervenção manual.

---

## 💻 Stack de Tecnologia

| Categoria            | Tecnologia                                                              |
| -------------------- | ----------------------------------------------------------------------- |
| **Aplicação Base**   | Python, FastAPI, SQLAlchemy                                             |
| **DevOps & Cloud**   | **Docker**, **Docker Compose**, **GitHub Actions (CI/CD)**, **Google Cloud Run**, **Google Artifact Registry** |

---

## 🏁 Como Executar Localmente (com Docker Compose)

Graças ao Docker Compose, você só precisa ter o Docker instalado para rodar o projeto.

1.  **Clone este repositório:**
    ```sh
    git clone https://github.com/HaackDEV/imersao-devops
    cd ellis
    ```

2.  **Suba o ambiente com Docker Compose:**
    Este comando irá construir a imagem (se necessário) e iniciar o container.
    ```sh
    docker-compose up
    ```

3.  **Acesse a documentação da API:**
    Abra seu navegador em http://localhost:8000/docs para interagir com a API.

---

## ☁️ Pipeline de CI/CD Automatizado

O processo de deploy desta aplicação é **100% automatizado** através de um pipeline de CI/CD no GitHub Actions.

O workflow, definido em `.github/workflows/docker-image.yml`, é disparado a cada novo commit na branch `main` e executa as seguintes etapas:

1.  **Autenticação Segura**: O pipeline se autentica no Google Cloud de forma segura, utilizando secrets do GitHub.

2.  **Build & Push**: A imagem Docker é construída e enviada para o Google Artifact Registry. A imagem é tagueada com o hash do commit para total rastreabilidade.

3.  **Deploy no Cloud Run**: A nova imagem é implantada como a versão mais recente do serviço no Google Cloud Run, que cuida de todo o resto (escalabilidade, HTTPS, etc.).

Este fluxo garante que qualquer alteração no código seja integrada e entregue à produção de forma rápida e confiável.

---

## 📄 Sobre o Projeto Original

Este projeto foi originalmente desenvolvido para a **Imersão DevOps** da Alura. Todo o crédito pela criação da API base, incluindo rotas, modelos e lógica de negócio, vai para a equipe da Alura.

- **Repositório Original:** `guilhermeonrails/imersao-devops`

---
