# Membuat backup crontab
crontab -l > soal3_cron
echo "5 6-23/8 * * SUN-FRI /home/bonisaz/Sisop/modul_1/Soal_3/soal3.sh" >> soal3_cron
crontab soal3_cron
