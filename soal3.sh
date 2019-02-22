password="$(dd if=/dev/urandom|tr -dc A-Za-z0-9|head -c 12)"
kcl=0
bsr=0
angka=0
for kata in $(seq 1 ${#password}); do
    echo "$kata: ${password:kata-1:1}"
    if [[ $kata == [A-Z] ]];
        then
        let "bsr += 1"
        fi
    if [[ $kata == [a-z] ]];
        then
        let "kcl += 1"
        fi
    if [[ $kata == [0-9] ]];
        then
        let "angka += 1"
        fi
done
#echo "$kcl $bsr $angka"

#untuk save file
i=1
file=/home/vagrant/genpass/password
while [ -f "$file$i.txt" ]
do
        let i++
done
echo "$password" >$file$i.txt
