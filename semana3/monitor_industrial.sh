#!/bin/bash

# ==================================================
# Programa de Leitura e Classificação de Temperatura
# ==================================================

# Limpar a tela
clear

echo "============================================="
echo "   Sistema de Monitoramento de Temperatura   "
echo "============================================="
echo ""

#1. Solicitar o nome do operador
read -p "Digite o nome do operador: " nome_operador
echo ""
echo "Olá, $nome_operador! Iniciando as 10 leituras..."
echo "------------------------------------------------"

# Inicializar contadores
cont_fria=0
cont_normal=0
cont_critica=0

# 2. Realizar 10 leituras com for
for i in $(seq 1 10); do
	# 3. Gerar temperatura aleatória (entre 20 e 50)
	temperatura=$(( (RANDOM % 31) + 20 ))

	# 4. Classificar temperatura usando if/elif
	if [ $temperatura -lt 30 ]; then
		estado="FRIA"
		cont_fria=$((cont_fria + 1))
	elif [ $temperatura -ge 30 ] && [ $temperatura -le 40 ]; then
		estado="NORMAL"
		cont_normal=$((cont_normal + 1))
	else
		estado="CRÍTICA"
		cont_critica=$((cont_critica + 1))
	fi

	#Exibir leitura atual
	echo "Leitura $i: ${temperatura}ºC - Estado: $estado"
done

echo "-----------------------------------------------------"
echo ""

# 5. Exibir relatório final
echo "============================================================"
echo "                      Relatório Final                       "
echo "============================================================"
echo "Operador:            	$nome_operador"
echo "Data/Hora:		$(date '+%d%m%Y %H:%M%S')"
echo "Total de leituras: 10"
echo "-----------------------------------------------------------"
echo "Temperaturas FRIAS (< 30ºC): 	$cont_fria"
echo "Temperaturas NORMAIS (30-40ºC):	$cont_normal"
echo "Temperaturas CRÍTICAS (> 40ºC):	$cont_critica"
echo "==========================================================="

# Alerta se houver temperatura crítica
if [ $cont_critica -gt 0]; then
	echo " ATENÇÃO: $cont_critica leitura(s) em estado CRÍTICO!"
fi

echo ""
echo "Relatório concluído. Obrigado, $nome_operador!"
