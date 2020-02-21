# Mengambil gambar "cat"
# Me-rename file gambar menjadi "pdkt_kusuma_NO"
# Membuat log file

lokasi=`pwd`
filter=`ls $lokasi | grep "pdkt_kusuma" | cut -d "_" -f 3 | sort -n | tail -1`

if [[ $filter =~ [^0-9] ]]
then
	filter=0
fi

awal=`expr $filter + 1`
akhir=`expr $filter + 28`

for ((i=awal; i<=akhir; i++));
do
		wget -O pdkt_kusuma_$i https://loremflickr.com/320/240/cat -a $lokasi/wget.log
done
