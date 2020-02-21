# Praktikum Modul 1 Sistem Operasi 2020
Oleh Kelompok B06
* _Clement Prolifel Priyatama (0511184000013)_
* _Aaron Astonvilla Rompis (05111840000131)_

----------------------------------------------------------------
## Soal
* [Nomor 1](#nomor1)
* [Nomor 2](#nomor2)
  * [Nomor 2.a. dan 2.b.](#nomor-2a-dan-2b)
* [Nomor 3](#nomor3)
----------------------------------------------------------------

### Nomor 1
_**Penjelasan:**_\


### Nomor 2
  _**Soal:**_\
  Pada suatu siang, laptop Randolf dan Afairuzr dibajak oleh seseorang dan kehilangan
  data-data penting. Untuk mencegah kejadian yang sama terulang kembali mereka
  meminta bantuan kepada Whits karena dia adalah seorang yang punya banyak ide.
  Whits memikirkan sebuah ide namun dia meminta bantuan kalian kembali agar ide
  tersebut cepat diselesaikan. Idenya adalah kalian
    
   #### Nomor 2.a. dan 2.b.
   > _**Note: Source Code untuk nomor 2.a. dan 2.b. digabung menjadi satu file script agar memudahkan assign nama file**_
   
   _**Soal 2.a.**:_\
   membuat sebuah script bash yang
   dapat menghasilkan password secara acak sebanyak 28 karakter yang terdapat huruf
   besar, huruf kecil, dan angka.
   
   > _Source Code:_ [Sumber](https://github.com/prolifel/SoalShiftSISOP20_modul1_B06/blob/master/soal2/soal2_randomizer.sh)
   
   _**Penjelasan**:_\
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
   
   _**Soal 2.b.:**_\
   Password acak tersebut disimpan pada file berekstensi .txt dengan nama berdasarkan argumen yang diinputkan dan ​ HANYA ​ berupa alphabet​ .
   
   _**Penjelasan:**_\
   Hasil pengulangan array random tadi kemudian di-_print & assign_ sebanyak 28 karakter (`${array[@]::28}`) sebagai _string_ (mengapa format `printf`nya `%s`) `/home/bonisaz/Sisop/modul_1/Shift_1/$k.txt`. `$k` disini adalah argumen yang didapat ketika menjalankan script `soal2_randomizer.sh`.
   
   Setelah fungsi `randomcok()` dibuat, script dijalankan dengan memasukkan sebuah argumen sebagai nama file text yang akan dibuat. Oleh karena itu, dilakukan _looping_ scan argumen dengan cara
   ```
   for k in $*
    do
	    randomcok $k
    done
```

#### Nomor 2.c.
_**Soal 2.c.:**_\
Kemudian supaya file .txt tersebut tidak mudah diketahui maka nama filenya akan di
enkripsi dengan menggunakan konversi huruf (string manipulation) yang disesuaikan
dengan jam(0-23) dibuatnya file tersebut dengan program terpisah dengan (misal:
password.txt dibuat pada jam 01.28 maka namanya berubah menjadi qbttxpse.txt
dengan perintah ‘​ bash soal2_enkripsi.sh password.txt’. Karena p adalah huruf ke 16 dan
file dibuat pada jam 1 maka 16+1=17 dan huruf ke 17 adalah q dan begitu pula
seterusnya. Apabila melebihi ​ z ​ , akan kembali ke ​ a ​ , contoh: huruf ​ w dengan jam 5.28,
maka akan menjadi huruf ​ b.​ )

> _Source Code:_ [Sumber](https://github.com/prolifel/SoalShiftSISOP20_modul1_B06/blob/master/soal2/soal2_enkripsi.sh)

_Penjelasan:_\
Kemudian script `soal2_randomizer.sh`dijalankan dengan syntax:
``` bash soal2_randomizer.sh password.txt ```
Argumen `password.txt` diambil dengan menggunakan syntax `namafile=$*`.
Setelah nama file diambil, kemudian nama file tersebut dipisahkan sehingga hanya mendapatkan _string_ nama file kemudian _string_ tersebut di-_assign_ ke sebuah array temp (`nama_temp`) tanpa ekstensinya. Hal ini dapat dilakukan dengan cara:
```
# ------ Memisahkan nama file txt dari ekstensi ------ #
IFS='.'		# Char yang ingin dipisah

read -ra nama_temp <<< "$namafile"	# Read namafile, kemudian 
	# r = backslash bukan sebagai escape
	# a = kata yang uda dipisah, dimasukkin ke array nama_temp
	# nama file yang kepisah, masuk ke element 1

IFS=' '
```

### Nomor 3
