function randomcok(){
        array=()

        for i in {a..z} {A..Z} {0..9};
         do
                array[$RANDOM]=$i
        done

        printf %s ${array[@]::28} $'\n' > /home/bonisaz/Sisop/modul_1/Shift_1/$k.txt
}

for k in $*
do
	randomcok $k
done
