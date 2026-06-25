#!/bin/bash

echo "Iniciando monitoramento (10 leituras):"
echo "====================================="

# Loop que vai rodar de 1 até 10
for i in {1..10}; do
    # Gera um número aleatório de 0 a 100
    bateria=$(( RANDOM % 101 ))
    
    # Mostra o número da leitura atual e o nível de bateria
    echo "Leitura #$i: Bateria em $bateria%"
    
    # Classificação do status
    if [ "$bateria" -gt 70 ]; then
        echo "Status: Alta"
    elif [ "$bateria" -ge 30 ] && [ "$bateria" -le 70 ]; then
        echo "Status: Média"
    else
        echo "Status: Baixa"
        echo "⚠️ Alerta: Retornando para estação de carga"
    fi
    
    echo "-------------------------------------"
    
    # Aguarda 1 segundo antes da próxima leitura
    sleep 1
done

echo "Monitoramento concluído!"
