# 🤖 SenacAI - Chat Inteligente com Spring AI, Angular e Groq

<p align="center">

<img src="https://img.shields.io/badge/Java-23-orange">
<img src="https://img.shields.io/badge/Spring%20Boot-3.5.14-green">
<img src="https://img.shields.io/badge/Spring%20AI-1.1.7-blue">
<img src="https://img.shields.io/badge/Angular-Frontend-red">
<img src="https://img.shields.io/badge/PostgreSQL-Database-blue">
<img src="https://img.shields.io/badge/Docker-Container-blue">
<img src="https://img.shields.io/badge/Groq-AI-purple">

</p>


# 📌 Sobre o projeto

O **SenacAI** é uma aplicação de inteligência artificial desenvolvida utilizando **Spring Boot + Spring AI + Angular**, permitindo interação com modelos de linguagem através de uma interface web moderna.

O projeto demonstra a construção de uma aplicação completa utilizando conceitos atuais de desenvolvimento:

- Backend com arquitetura REST;
- Integração com Inteligência Artificial Generativa;
- Gerenciamento de memória conversacional;
- Persistência de histórico utilizando PostgreSQL;
- Frontend Angular;
- Containerização com Docker;
- Documentação de APIs utilizando Postman.


---

# 🎯 Objetivo do projeto

O objetivo principal do SenacAI é demonstrar na prática como construir uma aplicação baseada em Inteligência Artificial utilizando tecnologias utilizadas no mercado.

A aplicação permite:

- Criar conversas com IA;
- Manter memória das interações;
- Gerenciar sessões de usuários;
- Consumir modelos de linguagem;
- Integrar frontend e backend;
- Executar utilizando containers Docker.


---

# 🚀 Funcionalidades implementadas

✅ Chat com Inteligência Artificial  
✅ Histórico de conversas  
✅ Memória persistente no PostgreSQL  
✅ API REST desenvolvida com Spring Boot  
✅ Interface Angular  
✅ Integração com Groq API  
✅ Gerenciamento através de variáveis de ambiente  
✅ Container Docker do backend  
✅ Banco PostgreSQL preparado para execução local  
✅ Collection Postman documentada  


---

# 🏗️ Arquitetura da solução

A[Usuário]

B[Angular Frontend]

C[Spring Boot API]

D[Spring AI]

E[Groq API]

F[PostgreSQL]

G[Docker Container]

A --> B
B --> C
C --> D
D --> E
C --> F
C --> G

Fluxo da aplicação
Usuário acessa a aplicação Angular.
Angular envia uma requisição HTTP para o backend Spring Boot.
Spring Boot recebe a mensagem através de um Controller REST.
Spring AI processa a solicitação.
A requisição é enviada para o modelo de IA através da Groq API.
A resposta retorna para o backend.
O histórico da conversa é armazenado no PostgreSQL.
Angular apresenta a resposta ao usuário.

🛠️ Tecnologias utilizadas
Backend
Tecnologia	          Utilização
Java 23	              Linguagem principal
Spring Boot 3.5.14	  Framework backend
Spring AI 1.1.7	      Integração com IA
Maven	                Gerenciamento de dependências
Eclipse IDE	          Desenvolvimento backend
REST API	            Comunicação entre sistemas

Inteligência Artificial
Spring AI

Framework utilizado para integrar aplicações Java com modelos de Inteligência Artificial.
Responsável por:

Comunicação com modelos LLM;
Gerenciamento de mensagens;
Memória conversacional;
Abstração dos provedores de IA.

Groq
A aplicação utiliza a API da Groq como provedor de modelos de linguagem.

Modelo utilizado:
llama-3.3-70b-versatile
Responsável pelo processamento das respostas inteligentes.

Frontend
Tecnologias:

Angular
TypeScript
HTML5
CSS3
Node.js
VS Code

Responsável por:
Interface do usuário;
Envio das mensagens;
Apresentação das respostas;
Comunicação com API REST.

Banco de dados
PostgreSQL

O PostgreSQL é utilizado para armazenar:
Histórico das conversas;
Memória do chatbot;
Dados persistentes da aplicação.

Tecnologias:
PostgreSQL 16
JDBC
Spring AI JDBC Chat Memory Repository

🐳 Docker
O backend foi containerizado utilizando Docker.

Imagem Docker Hub
Imagem disponível:
docker pull felipemaximuss/api-ai:1.0

Executar container
docker run \
-p 8080:8080 \
-e GROQ_API_KEY=SUA_CHAVE \
-e DB_URL=SUA_URL_POSTGRES \
-e DB_USERNAME=SEU_USUARIO \
-e DB_PASSWORD=SUA_SENHA \
-e MODEL_NAME=llama-3.3-70b-versatile \
felipemaximuss/api-ai:1.0

📂 Estrutura do projeto
Spring_AI_Senac_Chat

│
├── backend
│   │
│   ├── src
│   ├── pom.xml
│   ├── Dockerfile
│   └── application-prod.properties
│
├── front-end
│   │
│   ├── src
│   ├── package.json
│   └── angular.json
│
├── database
│   │
│   └── backup.sql
│
├── postman
│   │
│   └── SenacAI.postman_collection.json
│
├── docker
│
└── README.md

⚙️ Como executar localmente
Pré-requisitos

Instalar:
Java 23
Maven
Node.js
Angular CLI
PostgreSQL
Docker


Backend

Entrar na pasta:
cd backend

Executar:
mvn clean package

Executar aplicação:
java -jar target/api-ai-0.0.1-SNAPSHOT.jar

Backend disponível:
http://localhost:8080


Frontend Angular

Entrar:
cd front-end

Instalar dependências:
npm install

Executar:
ng serve

Aplicação:
http://localhost:4200


🔐 Variáveis de ambiente
A aplicação utiliza variáveis para proteger informações sensíveis.

Exemplo:
GROQ_API_KEY=sua-chave
DB_URL=jdbc:postgresql://localhost:5433/mydatabase
DB_USERNAME=myuser
DB_PASSWORD=secret
MODEL_NAME=llama-3.3-70b-versatile

Perfis Spring
A aplicação utiliza:


Desenvolvimento
Arquivo:
application-dev.properties
Utilizado para ambiente local.


Produção

Arquivo:
application-prod.properties
Utilizado para ambientes hospedados.

Ativação:
spring.profiles.active=prod


🗄️ Restaurar banco PostgreSQL

Criar banco:
CREATE DATABASE mydatabase;

Restaurar:
psql -U usuario -d mydatabase < backup.sql


📮 Importar Postman

Abrir Postman:
Import
 ↓
Upload Files
 ↓
SenacAI.postman_collection.json


🔗 Endpoints
Criar novo chat
POST /api/chat-memory

Enviar mensagem
POST /api/chat-memory/message

Teste da API
GET /api/chat-memory/teste


☁️ Deploy
O projeto está preparado para deploy utilizando:
Docker
Render
Docker Hub

Fluxo:

GitHub
   |
   |
Docker Build
   |
   |
Docker Hub
   |
   |
Render
   |
   |
Aplicação Online



📸 Screenshots
Adicionar imagens da aplicação:
/docs/images


Sugestões:
Tela inicial;
Tela do chat;
Respostas da IA;
Arquitetura.



🔮 Futuras melhorias

Segurança
Autenticação com JWT;
Controle de usuários;
Criptografia de dados.

Inteligência Artificial
Implementação de RAG;
Integração com documentos;
Upload de arquivos;
Embeddings.

Backend
Testes automatizados;
Docker Compose;
CI/CD.

Frontend
Design responsivo;
Dark mode;
Streaming de respostas.


📚 Conhecimentos aplicados

Este projeto envolve:
Desenvolvimento Full Stack;
APIs REST;
Inteligência Artificial Generativa;
Cloud Computing;
Banco de Dados;
DevOps;
Containers;
Arquitetura de Software.


👨‍💻 Autor
Desenvolvido por:
Filypy Maycon

Projeto desenvolvido para estudo, demonstração técnica e aplicação prática de Inteligência Artificial no desenvolvimento de software.

📄 Licença
Este projeto está disponível para fins educacionais e demonstração técnica.
