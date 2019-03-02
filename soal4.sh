lw=( {a..z} )
hi=( {A..Z} )

waktu=$(date +"%H")
fname=$(date +"%H:%M %d-%m-%Y")

a=$((waktu%26))
b=$((a-1))

while read -r line ; do
        if [ $a -ne 0 ]; then
                echo "$line" | tr [a-zA-Z] ["${lw[a]}"-za-"${lw[b]}""${hi[a]}"-ZA-"${hi[b]}"] >> encryptedsyslog/"$fname"
        else
                echo "$line" >> encryptedsyslog/"$fname"
        fi
done < '/var/log/syslog'