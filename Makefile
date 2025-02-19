# Formato geral de um Makefile
#
#alvo: pre-requisitos1
#	comandos que usam os pre-requisitos para gerar o alvo

all: resultados/variacao_temperatura.csv resultados/numero_de_dados.txt

clean:
	rm -r -f resultados dados 
	
resultados/numero_de_dados.txt: dados/temperature-data.zip
	mkdir -p resultados 
	ls dados/temperatura/*.csv | wc -l > resultados/numero_de_dados.txt 

dados/temperatura-data.zip: code/baixa_dados.py
	python code/baixa_dados.py dados 
	
resultados/variacao_temperatura.csv: code/variacao.bas dados/temperatura-data.zip
	mkdir -p resultados
	bash code/variacao.bas > resultados/variacao_temperatura.csv

figuras/variacao_temperatura.png: code/plota_dados.py dados/temperatura-data.zip
	python code/plota_dados.py resultados/variacao_temperatura.csv 	

 