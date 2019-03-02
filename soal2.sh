file="assets/WA_Sales_Products_2012-14.csv"

IFS=
temp=$(awk 'BEGIN { FS = "," ; OFS = ";" } ; $7 ~ /2012/ { print $1,$4,$6,$10,$7}' < $file | sort -t ';' -k 4 -V -r)
country=$(echo $temp | awk 'BEGIN { FS = ";" } ; {print $1} NR>0{exit}')

echo ""
echo "Nomor 2A"
echo "$country"

produk=$(echo $temp | awk -v negara="$country" 'BEGIN { FS= ";" } ;  $1 ~ negara && !seen[$2]++  {print $2}' | awk '{print $0} NR>2{exit}')
echo ""
echo "Nomor 2B"
echo "$produk"

echo ""
echo "Nomor 2C"
echo $temp | awk -v negara="$country" 'BEGIN { FS= ";" } ;  $1 ~ negara && ($2 ~ /Personal Accessories/ || $2 ~ /Camping Equipment/ || $2 ~ /Outdoor Protection/) && !seen[$3]++  {print $3}' | awk '{print} NR>2{exit}' 