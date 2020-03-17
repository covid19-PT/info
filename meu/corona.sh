#!/bin/bash



wget -O data.cvs -q  https://raw.githubusercontent.com/dssg-pt/covid19pt-data/master/data.csv

tail -n +2 data.cvs > data

input=data


if [[ -f *.jpg ]] ; then
    rm *.jpg
fi

if [[ -f conf ]] ; then
    rm conf
fi

if [[ -f recu ]] ; then
    rm recu
fi

if [[ -f susp ]] ; then
    rm susp
fi

while IFS= read -r line; do 
    conf=$( echo "$line" | cut -d ","  -f 2 )  ; echo $conf >> conf
    recu=$( echo "$line" | cut -d ","  -f 12 ) ; echo $recu >> recu
    susp=$( echo "$line" | cut -d ","  -f 17 ) ; echo $susp >> susp
done < "$input"



/usr/local/MATLAB/R2018a/bin/matlab -nodisplay -nosplash -nodesktop -r "run('corona_matlab.m');exit;"

echo "# Stats " >> ../README.md

printf "\n" >> ../README.md

echo "| Casos | Suspeitos | Recuperados | Obitos |" >> ../README.md

echo "| ----- |: ------:| :--------: | ------: |" >> ../README.md


echo "Tempo para duplicar o número de casos $(cat tempo_para_duplicar.txt) dias." >> ../README.md

printf "\n" >> ../README.md

echo "# Charts" >> ../README.md

echo "![alt text](https://github.com/covid19-PT/stats/blob/master/meu/CasosCorona_$(date +"%d-%b-%Y").jpg \"Logo Title Text 1\")" >> ../README.md
printf "\n" >> ../README.md
echo "![alt text](https://github.com/covid19-PT/stats/blob/master/meu/CasosCorona_RecuperadosInfectados$(date +"%d-%b-%Y").jpg \"Logo Title Text 1\")" >> ../README.md
printf "\n" >> ../README.md
echo "![alt text](https://github.com/covid19-PT/stats/blob/master/meu/InfoCasosCoronaConfirmados_$(date +"%d-%b-%Y").jpg \"Logo Title Text 1\")">> ../README.md
printf "\n" >> ../README.md
echo "![alt text](https://github.com/covid19-PT/stats/blob/master/meu/InfoCasosCoronaEfectivos_$(date +"%d-%b-%Y").jpg \"Logo Title Text 1\")">> ../README.md
printf "\n" >> ../README.md
echo "![alt text](https://github.com/covid19-PT/stats/blob/master/meu/LTSim_ExponentialModel$(date +"%d-%b-%Y").jpg \"Logo Title Text 1\")">> ../README.md
printf "\n" >> ../README.md
echo "![alt text](https://github.com/covid19-PT/stats/blob/master/meu/Poly$(date +"%d-%b-%Y").jpg \"Logo Title Text 1\")" >> ../README.md

printf "\n" >> ../README.md

echo "# Links" >> ../README.md

echo "https://github.com/dssg-pt/covid19pt-data"  >> ../README.md
printf "\n" >> ../README.md
echo "https://t.me/coronavirus_pt"  >> ../README.md
printf "\n" >> ../README.md
echo "https://t.me/covid19_infos"  >> ../README.md
printf "\n" >> ../README.md
echo "[Dr John Campbell](https://www.youtube.com/watch?v=dr0Cqlf5xK4)"  >> ../README.md
printf "\n" >> ../README.md
echo "[Dr Bruno Arroja na RTP2, 15 Março 2020](https://streamable.com/chqim)"  >> ../README.md
