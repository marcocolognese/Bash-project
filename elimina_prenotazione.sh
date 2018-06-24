#!/bin/bash

echo -n "Inserisci aula: "
read aula
#Le aule sono salvate in maiuscolo nel file aule.txt
aula=$(echo $aula | tr a-z A-Z )
echo -n "Inserisci data: "
read data
echo -n "Inserisci ora: "
read ora
if [ "$ora" = "08" ]; then
            ora="8"
    elif [ "$ora" = "09" ]; then
            ora="9"
    fi
stringa=$aula";"$data";"$ora

#isolo la prenotazione (se esiste)
prenotazione=$(cat aule.txt | grep $stringa)

#stampo un errore se $prenotazione non contiene nulla (prenotazione non trovata)
if test -z $prenotazione; then
	echo -e "\nPrenotazione inesistente\n";
	exit
fi

#elimino la prenotazione sostituendola con uno spazio vuoto che verrà poi rimosso
sed -i /"$prenotazione"/d aule.txt

echo -e "\nEliminazione effettuata\n"

# sed -i (modifico direttamente il file invece di stampare solamente le modifiche a video)
#sed /d toglie righe vuote
