#!/bin/bash
blockiplist="blockiplist.txt"
echo "Listedeki ip adreslerini engellemek için 1'e basın kaynak = blocklist.txt
Kendi seçtiğiniz ip adresini engellemek için 2'ye basın
Listedeki ip adreslerinin engelini kaldırmak için 3'e basın kaynak = unblocklist.txt
Kendi seçtiğiniz ip adresinin engelini kaldırmak için 4'e basın
Yapılan işlemleri kaldırmak için 5'e basın"
read com
bipcount=$(wc -l blocklist.txt | cut -c 1-2 | xargs)
unipcount=$(wc -l unblocklist.txt | cut -c 1-2 | xargs)
if [ $com -eq 1 ];
then
 cat blocklist.txt>>blockiplist.txt
 date >> log.txt
 echo "Engellemeler yapılıyor..."
 for ((i=0; i<$bipcount; i++))
  do
   blockip=$(head -n 1 blocklist.txt)
   echo $blockip
   echo "$blockip adresi engellendi" >> log.txt
   iptables -A INPUT -j DROP -s $blockip
   sed -i '1d' blocklist.txt
  done
 echo "Engelleme işlemi tamamlandı engellenen ip adresleri blockiplist.txt dosyasına kaydedildi."
elif [ $com -eq 2 ];
then
 echo "Engellemek istediğiniz ip adresini giriniz:"
 read blockip
 iptables -A INPUT -j DROP -s $blockip
 echo "$blockip">>blockiplist.txt
 date >> log.txt
 echo "$blockip adresi engellendi" >> log.txt
 echo "$blockip ip adresi blockiplist.txt dosyasına eklendi."
elif [ $com -eq 3 ];
then
 cat unblocklist.txt>>unblockiplist.txt
 date >> log.txt
 echo "Engeller kaldırılıyor..."
 for ((i=0; i<$unipcount; i++))
  do
   unblockip=$(head -n 1 unblocklist.txt)
   echo $unblockip
   echo "$unblockip adresinin engeli kaldırıldı" >> log.txt
   iptables -D INPUT -s $unblockip -j DROP
   sed -i '1d' unblocklist.txt
  done
 echo "Engel kaldırılma işlemi tamamlandı engeli kaldırılan ip adresleri unblockiplist.txt dosyasına kaydedildi."
elif [ $com -eq 4 ];
then
 echo "Engelini kaldırmak istediğiniz ip adresini giriniz"
 read unblockip
 echo "$unblockip">>unblockiplist.txt
 date >> log.txt
 echo "$unblockip adresinin engeli kaldırıldı">> log.txt
 iptables -D INPUT -s $unblockip -j DROP
 echo "$unblockip ip adresi unblockiplist.txt dosyasına eklendi"
elif [ $com -eq 5 ];
then
 echo "Yapılan tüm işlemleri sil."
 date >> log.txt
 echo "Kurallar silindi">> log.txt
 iptables -F
else
 echo "Geçersiz bir giriş yaptınız."
fi
