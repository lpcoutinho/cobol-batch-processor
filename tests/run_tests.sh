#!/bin/bash

# Cores para o output
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m'

echo "Iniciando testes automatizados..."

# 1. Compilar
make build-free > /dev/null

# 2. Executar e capturar saída
./bin/processa-free > tests/saida_teste.txt

# 3. Comparar com o esperado
if diff tests/saida_teste.txt tests/expected/relatorio_esperado.txt > /dev/null; then
    echo -e "${GREEN}SUCCESS: Saída corresponde ao esperado.${NC}"
    rm tests/saida_teste.txt
    exit 0
else
    echo -e "${RED}FAILURE: Saída diferente do esperado!${NC}"
    diff tests/saida_teste.txt tests/expected/relatorio_esperado.txt
    rm tests/saida_teste.txt
    exit 1
fi
