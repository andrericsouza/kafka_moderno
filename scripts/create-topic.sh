echo "Criando topico pedidos_restaurante..."

kafka-topics \
--bootstrap-server localhost:9092 \
--create \
--if-not-exists \
--topic pedidos_restaurante \
--partitions 3 \
--replication-factor 1

echo "Registrando schema..."

curl -X POST http://schema-registry:8081/subjects/pedidos_restaurante-value/versions \
-H "Content-Type: application/vnd.schemaregistry.v1+json" \
-d @schema_payload.json


echo "Ambiente configurado!"