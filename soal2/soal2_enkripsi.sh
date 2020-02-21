# ------ Mengambil nama file dari argumen ------------ #
namafile=$*

# ------ Memisahkan nama file txt dari ekstensi ------ #
IFS='.'		# Char yang ingin dipisah

read -ra nama_temp <<< "$namafile"	# Read namafile, kemudian 
	# r = backslash bukan sebagai escape
	# a = kata yang uda dipisah, dimasukkin ke array nama_temp
	# nama file yang kepisah, masuk ke element 1

IFS=' '

# ------ Mengambil jam file dibuat ------------------- #
read -ra nama_file <<< "${nama_temp[0]}"
declare -a jam
jam=$(date -r $nama_file.txt "+%H")
echo "Jam file dibuat: $jam"

# ------ Fungsi untuk encrypt ------------------------ #
declare -a _out

caesar_cipher() {
 
  # michaeltd 2019-11-30
  # https://en.wikipedia.org/wiki/Caesar_cipher
  # E n ( x ) = ( x + n ) mod 26.
  # D n ( x ) = ( x − n ) mod 26.
 
  local -a _ABC=( "A" "B" "C" "D" "E" "F" "G" "H" "I" "J" "K" "L" "M" "N" "O" "P" "Q" "R" "S" "T" "U" "V" "W" "X" "Y" "Z" )
  local -a _abc=( "a" "b" "c" "d" "e" "f" "g" "h" "i" "j" "k" "l" "m" "n" "o" "p" "q" "r" "s" "t" "u" "v" "w" "x" "y" "z" )
 
  if (( $# < 3 )) || [[ "$1" != "-e" && "$1" != "-d" ]] || (( $2 < 1 || $2 > 23 )); then
    echo "Usage: ${FUNCNAME[0]} -e|-d rotation (1-25) argument[(s)...]" >&2
    return 1
  fi
 
  _func="${1}"; shift
  _rotval="${1}"; shift
 
  while [[ -n "${1}" ]]; do
    for (( i = 0; i < ${#1}; i++ )); do
      for (( x = 0; x < ${#_abc[*]}; x++ )); do
        case "${_func}" in
          "-e")
            [[ "${1:$i:1}" == "${_ABC[$x]}" ]] && _out+="${_ABC[(( ( x + _rotval ) % 26 ))]}" && break
            [[ "${1:$i:1}" == "${_abc[$x]}" ]] && _out+="${_abc[(( ( x + _rotval ) % 26 ))]}" && break;;
          "-d")
            [[ "${1:$i:1}" == "${_ABC[$x]}" ]] && _out+="${_ABC[(( ( x - _rotval ) % 26 ))]}" && break
            [[ "${1:$i:1}" == "${_abc[$x]}" ]] && _out+="${_abc[(( ( x - _rotval ) % 26 ))]}" && break;;
        esac
        # If char has not been found by now lets add it as is.
        (( x == ${#_abc[*]} - 1 )) && _out+="${1:$i:1}"
      done
    done
    _out+=" "
    shift
  done
  echo "Hasil enkripsi: ${_out[*]}"
}

# ---------------------------------------------------#

caesar_cipher -e $jam "${nama_temp[0]}"

# Membuat array baru dari array temp dan out
read -ra output <<< "$_out"

# Rename file
mv "${nama_file}".txt "${output}".txt
