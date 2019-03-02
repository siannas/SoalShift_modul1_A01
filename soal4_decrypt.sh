read fname
file="/home/vagrant/encryptedsyslog/$fname"

lw=( {a..z} )
hi=( {A..Z} )

waktu="${fname:0:2}"

a="$waktu"
b=$((waktu-1))

while read -r line ; do
        if [ $a -ne 0 ]; then
                echo "$line" | tr ["${lw[a]}"-za-"${lw[b]}""${hi[a]}"-ZA-"${hi[b]}"] [a-zA-Z] >> decryptedsyslog/"$fname"
        else
                echo "$line" >> decryptedsyslog/"$fname"
        fi
done < "$file"