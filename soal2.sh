file="assets/WA_Sales_Products_2012-14.csv"

temp=`awk 'BEGIN { FS = ","; OFS= ";";ORS="|"} ; { if($7==2012) print $1,$4,$6,$10}' < $file | sort -t ';' -k 4 -V -r `

# 2.a
echo "Nomor 2A"
echo $temp | awk 'BEGIN { FS = ";" ; RS="|"} NR>1{print $1} NR==2{exit}'

# 2.b
echo ""
echo "Nomor 2B"
produk=`echo $temp | awk 'BEGIN {FS=";" ; RS="|" ; ORS="|" } ( NR>1 && !seen[$2]++ ){print $2}' | awk 'BEGIN{FS=";" ; RS="|" ; ORS="|"}{print $0} NR==3{exit}'`
echo $produk | awk 'BEGIN {FS=";" ; RS="|"} {print}'

# 2.c
echo "Nomor 2C"
IFS='|' read -r -a array <<< $produk

for element in "${array[@]}"
do
        echo $temp | awk -v cmpr="$element" 'BEGIN {FS=";" ; RS="|" } ( $2==cmpr ){print $3}' | head -1
done
