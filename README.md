# querydnsbl
Skrip ini membantu untuk menanyakan ke DNSBL apakah IP atau subnet masuk dalam daftar blacklist.

Mohon diedit terlebih dahulu berkas skrip dibagian SUB1,SUB2,XX dan YY.

Hasil akhir akan ada file listed.XX/YY.SUB2.SUB1.txt 

Cara pakai:

$ BLLIST=zen.spamhaus.org SUB1=203 SUB2=114 XX=224 YY=225 ./querydnsbl.sh

