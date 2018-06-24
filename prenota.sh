#!/bin/bash

function getData {
correct="0"

while(($correct=="0"))
do
    echo -n "Inserisci anno: "
    read anno
    if(( $((anno)) < 2016 )); then
		echo -e "\nAnno non valido.\n"
    else
        correct="1"
    fi
done

correct="0"
while(($correct=="0"))
do
    echo -n "Inserisci mese: "
    read mese
    #problema della lettura in ottale
    if [ "$mese" = "08" ]; then
        mese="8"
    elif [ "$mese" = "09" ]; then
        mese="9"
    fi
    if(( $((mese)) < 1 || $((mese)) > 12 )); then
	    echo -e "\nMese non valido.\n"
    else
        correct="1"
    fi
done

#se il mese e' un numero ad una cifra, aggiungo lo zero davanti attraverso una variabile che verra' usata dopo
if(( ${#mese} == 1 )); then
	zero_mese="0"
fi

correct="0"
while(($correct=="0"))
do
    echo -n "Inserisci giorno: "
    read giorno
    if [ "$giorno" = "08" ]; then
            giorno="8"
    elif [ "$giorno" = "09" ]; then
            giorno="9"
    fi
    if(( $((giorno)) < 1 )); then
	    echo -e "\nGiorno non valido.\n"
    else
        correct="1"
        #se il giorno e' un numero ad una cifra, aggiungo lo zero davanti attraverso una variabile che verra' usata dopo
        if(( ${#giorno} == 1 )); then
	        zero_giorno="0"
        fi
        #controllo se è bisestile
        a="0"
        if(( ($((anno))%4 == 0) && ($((anno)) % 100 != 0) || ($((anno)) % 400 == 0) )); then
	        a="1"
        fi
        case $((mese)) in
	        1|3|5|7|8|10|12) if(( $((giorno)) > 31)); then
				               echo -e "\nGiorno non valido.\n"
                                		correct="0"
				             	fi;;
	        2) if(( $((giorno)) > $((28+a)) )); then
						echo -e "\nGiorno non valido.\n"
                    				correct="0"
			    			fi;;
	        4|6|9|11) if(( $((giorno)) > 30)); then
					    	echo -e "\nGiorno non valido.\n"
                        			correct="0"
					  	fi;;
	        *) echo -e "\nGiorno non valido.\n"
                				correct="0";;
        esac
    fi
done

#se mese/giorno sono composti da 2 cifre, zero_mese/zero_giorno non conterranno nulla
res=$anno$zero_mese$mese$zero_giorno$giorno
return 0
}


#MAIN
echo -n "Inserisci aula: "
read aula
#Le aule vengono salvate in maiuscolo nel file aule.txt
aula=$(echo $aula | tr a-z A-Z )
getData

correct="0"
while(($correct=="0"))
do
    echo -n "Inserisci ora: "
	read ora
    if [ "$ora" = "08" ]; then
            ora="8"
    elif [ "$ora" = "09" ]; then
            ora="9"
    fi
	if(( $((ora)) < 8 || $((ora)) > 17 )); then
        echo -e "\nOra non valida.\n"
    else
        correct="1"
    fi
done

echo -n "Inserisci nome: "
read nome
#I nomi vengono salvati in maiuscolo nel file aule.txt
nome=$(echo $nome | tr a-z A-Z )

stringa=$aula";"$res";"$ora";"

prenotazione=$(cat aule.txt | grep $stringa)

#effettuo la prenotazione solo se non è già presente (altrimenti errore)
if test -z $prenotazione; then
    #salvo la prenotazione in coda al file aule.txt
	echo $stringa$nome >> aule.txt
	echo -e "\nPrenotazione effettuata\n"
	exit
fi

echo -e "\nAula già prenotata in questo orario\nPrenotazione non effettuata\n"
