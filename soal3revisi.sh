#!/bin/bash
file=/home/vagrant/genpass/password

while true
do
    ok=1
    password="$(dd if=/dev/urandom|tr -dc A-Za-z0-9|head -c 12)"
    #cek huruf besar dan kecil
    #echo "$password"
    kcl=0
    bsr=0
    angka=0
    for (( i=0; i<${#password}; i++)); do
        kata="${password:i:1}"
        #echo "$kata"
        if [[ $kata =~ ^[A-Z]+$ ]];
            then
            let "bsr += 1"
            fi
        if [[ $kata =~ ^[a-z]+$ ]];
            then
            let "kcl += 1"
            fi
        if [[ $kata =~ ^[0-9]+$ ]];
            then
            let "angka += 1"
            fi
    done
    #echo "$kcl $bsr $angka"

    #cek apakah password sudah ada
    for f in $file*; do
        read -r line < $f
        #echo $line
        if [[ $kata = $line ]]
        then
            let "ok = 0"
        fi
    done
    
    if [[ $ok -eq 1 ]]
    then
        break
    fi
done

#untuk save file
i=1
#file=/home/vagrant/genpass/password
while [ -f "$file$i.txt" ]
do
        let i++
done
echo "$password" >$file$i.txt
#echo "$password"