#!/bin/bash
#francois

#wget http://glpi.monkey-class.com/dossier.zip
#fonction qui englobe
taille {

#varriable dossier 
read -p "Lien ZIP : " dossier
#on recupere l extetion du fichier
ext=${dossier##*\.}
#on recupere la base du fichier
base=$(basename -s .zip $dossier)

#on verifie que le dossier est bien un dossier zip
if [ "$ext" = "zip" ]
then
	out=$(wegt -N $dossier 2>&1)

	if [[ $? -eq 0 && $out ]]
	then
		txt=$(unzip -l $base.zip *.txt | tail -n 1 | awk '{print $1}')

		echo "get size : $txt"
	else
		echo "aucun dossier"
	fi
else
	echo "etete"
fi

}
taille:x

#!/bin/bash

function getSize {

rouge='\e[1;31m'
vert='\e[1;32m'
neutre='\e[0;m'

message='Bonjour'

echo $message

read -p "Entrez le lien zip : " filename

ext=${filename##*\.}
base=$(basename -s .zip $filename)

if [ "$ext" = "zip" ]
then
        out=$(wget -N $filename 2>&1)

        if [[ $? -eq 0 && $out ]]
        then
                txt=$(unzip -l $base.zip *.txt | tail -n 1 | awk '{print $1}')
                jpg=$(unzip -l $base.zip *.jpg | tail -n 1 | awk '{print $1}')
                jpeg=$(unzip -l $base.zip *.jpeg | tail -n 1 | awk '{print $1}')

                echo -e "Get size of txt : ${vert}$txt${neutre}"
                echo -e "Get size of jpg : ${vert}$jpg${neutre}"
                echo -e "Get size of jpeg : ${vert}$jpeg${neutre}"
        else
                echo -e "${rouge}Aucuns fichiers ou dossiers dans ce zip${neutre}"
        fi
else
        echo -e "${rouge}Ceci n'est pas un lien zip!!!${neutre}"
fi
}
getSize:x