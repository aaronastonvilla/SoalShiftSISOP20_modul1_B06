lokasi=`pwd`
filter=`ls $lokasi | grep "pdkt_kusuma" | cut -d "_" -f 3 | sort -n | tail -1`


