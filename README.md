# Praktikum Modul 1 Sistem Operasi 2020
Oleh Kelompok B06
* _Clement Prolifel Priyatama (0511184000013)_
* _Aaron Astonvilla Rompis (05111840000131)_

----------------------------------------------------------------
## Soal
* [Nomor 1](#nomor1)
* [Nomor 2](#nomor2)
  * [Nomor 2.a.](#nomor-2a)
* [Nomor 3](#nomor3)
----------------------------------------------------------------

### Nomor 1
_Penjelasan:_\


### Nomor 2
  _Soal:_\
  Pada suatu siang, laptop Randolf dan Afairuzr dibajak oleh seseorang dan kehilangan
  data-data penting. Untuk mencegah kejadian yang sama terulang kembali mereka
  meminta bantuan kepada Whits karena dia adalah seorang yang punya banyak ide.
  Whits memikirkan sebuah ide namun dia meminta bantuan kalian kembali agar ide
  tersebut cepat diselesaikan. Idenya adalah kalian
    
   #### Nomor 2.a.
   _Soal:_\
   membuat sebuah script bash yang
   dapat menghasilkan password secara acak sebanyak 28 karakter yang terdapat huruf
   besar, huruf kecil, dan angka.
   
   _Source Code:_ [Sumber](https://github.com/prolifel/SoalShiftSISOP20_modul1_B06/blob/master/soal2/soal2_randomizer.sh)
   
   _Penjelasan:_\
   Script Bash yang dibuat adalah script randomizer sebanyak 28 karakter dengan karakteristik
   huruf besar, huruf kecil, dan angka.
   Karena randomizer akan menghasilkan sebuah sequence, maka dari itu, digunakan fungsi `randomcok()`
   yang membuat sebuah array kosong. Kemudian script membuat random huruf besar, huruf kecil, dan angka dengan cara
   perulangan sepanjang `RANDOM`
   ``` 
   for i in {a..z} {A..Z} {0..9};
    do
     array[$RANDOM]=$i
    done
   ```
   yang kemudian di-_print & assign_ sebanyak 28 karakter (`${array[@]::28}`) sebagai _string_ (mengapa format `printf`nya `%s`) `/home/bonisaz/Sisop/modul_1/Shift_1/$k.txt`. `$k` disini adalah argumen yang didapat ketika menjalankan script `soal2_randomizer.sh`.
   
   Setelah fungsi `randomcok()` dibuat, script dijalankan dengan memasukkan sebuah argumen sebagai nama file text yang akan dibuat. Oleh karena itu, dilakukan _looping_ scan argumen dengan cara
   ```
   for k in $*
    do
	    randomcok $k
    done
```
### Nomor 3
