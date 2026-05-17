# 🍽️ Laboratório Kafka Moderno - Sistema de Pedidos de Restaurante  

<img width="1313" height="876" alt="image" src="https://github.com/user-attachments/assets/65ddf609-7fcd-465f-8a6d-d8f032cc89a0" />

  
Laboratório prático utilizando Apache Kafka moderno (KRaft) para simular um sistema de pedidos de restaurante em tempo real.  
  
O projeto demonstra um cenário próximo do mundo real com múltiplos produtores e múltiplos consumidores utilizando arquitetura orientada a eventos.  
  
---  
  
# 🎯 Objetivo do Laboratório  
  
Simular o fluxo completo de pedidos de um restaurante:  
  
- Cliente faz pedido pelo aplicativo  
- Garçom registra pedidos das mesas  
- Kafka recebe e distribui eventos  
- Restaurante monitora os pedidos em tempo real  
- Cliente acompanha status do pedido  
- Garçom consulta pedidos das mesas  
- Dashboard exibe métricas em tempo real  
  
---  
  
# 🏗️ Arquitetura  
  
```
CLIENTE APP  
└── Producer  
  
GARÇOM TABLET  
└── Producer  
  
↓  
  
Kafka Topic  
pedidos_restaurante  
  
↓  
  
┌───────────────────────────────────┐  
│                                   │  
│ Consumer Restaurante              │  
│ Consumer Cliente                  │  
│ Consumer Garçom                   │  
│                                   │  
└───────────────────────────────────┘
```
----------

# 🚀 Tecnologias Utilizadas

-   Apache Kafka (KRaft)
-   Schema Registry
-   Kafka UI
-   Python
-   JupyterLab
-   Docker Compose
-   Pandas
-   Matplotlib
-   Faker
-   JSON

----------

# 📦 Estrutura do Projeto

```
impacta_kafka_restaurante/  
├── notebooks/  
│   ├── consumer_restaurante.ipynb  
│   ├── consumer_cliente.ipynb  
│   ├── consumer_garcom.ipynb  
│   ├── producer_restaurante.ipynb  
│   └── requirements.txt  
│   └── run_jupyterlab.sh  
├── schemas/  
│   └── pedido_schema.json  
├── scripts/  
│   └── create-topic.sh  
│   └── schema_payload.json  
├── docker-compose.yml  
└── README.md
```

----------

# ⚙️ Pré-requisitos

Antes de iniciar:

-   Docker Desktop instalado
-   Docker Compose habilitado
-   Windows, Linux ou MacOS
-   Portas livres:
    -   8080
    -   8081
    -   8888
    -   9092

----------

# 📁 IMPORTANTE - Windows

Evite executar o projeto dentro de:

-   Google Drive
-   OneDrive
-   Dropbox

Recomendado:

```
C:\labs\impacta_kafka_restaurante
```

ou

```
D:\docker\impacta_kafka_restaurante
```

----------

# ▶️ Passo a Passo Completo

# 1. Clonar repositório

```
git clone https://github.com/SEU_USUARIO/kafka-moderno-kraft.git
```

----------

# 2. Entrar no diretório

```
cd kafka-moderno-kraft
```

----------

# 3. Subir ambiente Docker

```
docker compose up -d
```

----------

# 4. Verificar containers

```
docker ps
```

Containers esperados:

-   kafka
-   schema-registry
-   kafka-ui
-   jupyter

----------

# 5. Criar tópico e registrar schema

Windows PowerShell ou Command Prompt:

```
docker exec -it kafka bash
cd /home/scripts/
./create-topic.sh
```

----------

# 6. Validar Kafka UI

Abrir navegador:

```
http://localhost:8080
```

Você verá:

-   tópicos
-   partições
-   brokers
-   mensagens
-   consumer groups

----------

# 7. Validar Schema Registry

Abrir:

```
http://localhost:8081/subjects
```

Resultado esperado:

```
[  "pedidos_restaurante-value"]
```

----------

# 8. Abrir JupyterLab

Abrir:

```
http://localhost:8888/lab
```

----------

# 📤 Producer - Simulação de Pedidos

Notebook:

```
producer_restaurante.ipynb
```

O producer simula:

## Cliente App

-   pedidos online
-   delivery
-   app mobile

## Garçom Tablet

-   pedidos da mesa
-   atendimento interno

As mensagens são publicadas no tópico:

```
pedidos_restaurante
```

Formato JSON:

```
{  "pedido_id": "uuid",  "origem": "cliente_app",  "cliente": "Andre",  "garcom": "Carlos",  "mesa": 10,  "item": "Pizza",  "valor": 59.90,  "status": "recebido",  "data_evento": "2026-05-17 15:30:00"}
```

----------

# 📥 Consumers

O laboratório possui 3 consumidores independentes.

----------

# 🍳 Consumer Restaurante

Notebook:

```
consumer_restaurante.ipynb
```

Responsável por:

-   dashboard da cozinha
-   monitoramento dos pedidos
-   gráfico em tempo real
-   status dos pedidos

Exemplo:

-   recebido
-   em_preparo
-   pronto
-   entregue

----------

# 📱 Consumer Cliente

Notebook:

```
consumer_cliente.ipynb
```

Responsável por:

-   acompanhar status do pedido
-   simular aplicativo do cliente

Exemplo:

```
Cliente Andre | Pedido Pizza | Status: em_preparo
```

----------

# 🧾 Consumer Garçom

Notebook:

```
consumer_garcom.ipynb
```

Responsável por:

-   acompanhar pedidos das mesas
-   visualizar andamento dos pedidos

Exemplo:

```
Mesa 10 | Garçom Carlos | Pizza | em_preparo
```

----------

# 🔎 Como Verificar os Resultados

# Kafka UI

Abrir:

```
http://localhost:8080
```

Verificar:

-   tópico pedidos_restaurante
-   mensagens chegando
-   partições
-   offsets
-   consumer groups

----------

# Dashboard Restaurante

Executar:

```
consumer_restaurante.ipynb
```

Você verá:

-   gráfico em tempo real
-   quantidade de pedidos
-   status dos pedidos

----------

# Cliente

Executar:

```
consumer_cliente.ipynb
```

Você verá:

-   atualização do pedido
-   acompanhamento do status

----------

# Garçom

Executar:

```
consumer_garcom.ipynb
```

Você verá:

-   pedidos das mesas
-   status dos pedidos

----------

# 🧠 Conceitos Demonstrados

Este laboratório demonstra:

-   Apache Kafka
-   Streaming
-   Event Driven
-   Producer
-   Consumer
-   Consumer Groups
-   Topics
-   Partitions
-   Offsets
-   Schema Registry
-   JSON
-   Dashboard em tempo real
-   Arquitetura distribuída
-   Microsserviços orientados a eventos

----------

# 🔥 Fluxo do Projeto

```
Cliente faz pedido
        ↓
Garçom registra pedido
        ↓
Producer envia evento
        ↓
Kafka recebe mensagem
        ↓
Mensagem distribuída nas partições
        ↓
Consumers recebem eventos
        ↓
Dashboard atualiza em tempo real
```

----------

# 🛑 Encerrar Ambiente

```
docker compose down -v
```

----------

# 🧹 Limpeza Completa Docker

```
docker system prune -a
```

----------

# 🚀 Melhorias Futuras

Possíveis evoluções:

-   Spark Streaming
-   PostgreSQL Sink
-   Kafka Connect
-   Elasticsearch
-   Dead Letter Queue
-   Retry Topics
-   Grafana
-   Prometheus
-   Avro Serializer
-   Autenticação SASL
-   Observabilidade

----------

# 📚 Objetivo Educacional

Este laboratório foi criado para:

-   aulas práticas
-   demonstrações técnicas
-   estudos de streaming
-   arquitetura de dados
-   Data Engineering
-   Event Driven Architecture
-   MLOps
-   observabilidade de eventos

----------

# 👨‍💻 Autor

André Ricardo
