#!/bin/bash

#salva in una variabile la lista ordinata di classi, senza ripetizioni (uniq)
lista=$(cat aule.txt | sort | cut -d";" -f1 | uniq )

#per ogni classe stampa il suo nome e quante prenotazioni ci sono della stessa
for classe in $lista; do
	numero=$(cat aule.txt | cut -d";" -f1 | grep -w -c $classe)
	prenotazioni=$(echo -e "$classe:$numero\n$prenotazioni")
done

#ordino le prenotazioni in base al secondo campo (ricorrenze per ogni aula)
prenotazioni=$(echo -e "$prenotazioni" | sort -t":" -k 2 )
echo -e "\nPrenotazioni per aula:"
for arg in $prenotazioni; do
	echo $arg
done


#cut -d";" -f1
#	seleziona nella stringa il primo campo, ognuno diviso da ";"

#grep
# 	-w = trova stringa esatta
# 	-c = stampa il numero di righe trovate

#sort -t":" -k 2
#	-t= specifica il carattere da usare come separatore
#	-k= ordina in base al secondo campo
