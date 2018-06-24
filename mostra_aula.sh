#!/bin/bash

echo -n "Inserire il nome dell'aula: "
read classe
classe=$(echo $classe | tr a-z A-Z )
#Le aule sono salvate in maiuscolo nel file aule.txt

lista=$(cat aule.txt | cut -d";" -f1,2,3 | grep -w $classe | sort -t";" -k 2,3)

#stampo un errore se $lista non contiene nulla (prenotazioni per l'aula non trovate)
if [[ $lista = "" ]] ; then
	echo -e "\nNon ci sono prenotazioni per l'aula scelta\n"
	exit
fi

echo -e "\nPRENOTAZIONI AULA $classe:\nGiorno Ora Utente"

for arg in $lista; do
	echo $(cat aule.txt | grep $arg | cut -d";" -f2,3,4 | sed s/";"/" "/g)
done


#cut -d";" -f1,2,3
#	seleziona nella stringa i campi 1,2 e 3 divisi da “;”

#grep -w -i $classe
#	-w = cerca la parola intera all'interno di tutti i campi di una stringa

#sort -t";" -k 2,3
#	-t= specifica il carattere da usare come separatore
#	-k= ordina in base ai campi 2 e 3

#sed s/";"/" "/g
#	s=sostituisce “;” con “ “, con il g finale sostituisce tutte le occorrenze altrimenti sostituirebbe solo la prima
