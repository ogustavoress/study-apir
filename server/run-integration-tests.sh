#!/usr/bin/env bash

set -e

HTTP_STATUS=$(
    curl -X 'POST' \
    'http://localhost:9000/api/v3/produtos' \
    -H 'accept: */*' \
    -H 'Content-Type: application/json' \
    -w "%{http_code}" \
    -o product_create.json \
    -d '{
    "nome": "Uva"
    }'
)

echo "Status HTTP: $HTTP_STATUS"

HTTP_STATUS=$(curl -X GET 'http://localhost:9000/api/v3/produtos' -o product_list.json -w "%{http_code}" -H 'accept: */*')
echo "Status HTTP: $HTTP_STATUS"
if [ "$HTTP_STATUS" -ne 200 ]; then
    echo "Erro ao acessar a API de produtos"
    exit 1
fi