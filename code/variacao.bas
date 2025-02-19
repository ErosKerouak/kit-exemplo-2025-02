# Calcula a variação de temperatura para todos os paises

echo "variacao_C_por_ano,pais"

for arquivos in dados/temperatura/a*.csv 
do
	python code/variacao_temperatura.py $arquivos
done 