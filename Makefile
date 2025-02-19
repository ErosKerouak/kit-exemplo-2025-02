# Formato geral de um Makefile
#
#alvo: pre-requisitos1
#	comandos que usam os pre-requisitos para gerar o alvo

all: resultados/variacao_temperatura.csv resultados/numero_de_dados.txt figuras/variacao_temperatura.png

clean:
	rm -r -f resultados dados figuras
	
resultados/numero_de_dados.txt: dados/temperature-data.zip
	mkdir -p resultados 
	ls dados/temperatura/*.csv | wc -l > resultados/numero_de_dados.txt 

dados/temperatura-data.zip: code/baixa_dados.py
	python code/baixa_dados.py dados 
	
resultados/variacao_temperatura.csv: code/variacao_para_todos_os_paises.sh dados/temperatura-data.zip
	mkdir -p resultados
	bash code/variacao_para_todos_os_paises.sh > resultados/variacao_temperatura.csv

figuras/variacao_temperatura.png: code/plota_dados.py resultados/variacao_temperatura.csv
	mkdir -p figuras 
	python code/plota_dados.py resultados/variacao_temperatura.csv figuras/variacao_temperatura.png

 