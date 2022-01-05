# Bilgisayar ve Ağ Güvenliği / Güvenlik Duvarı 

Güvenlik duvarı ağ bağlantılarının kurulması ya da kurulmaması gibi durumları kontrol etmemize yarayan bir ağ güvenliği birimidir.

Güvenlik duvarı dizininde yer alan firewall.sh isimli dosya linux ubuntu işletim sistemi üzerinde bash kabuğunda çalışan bir kabuk programdır.
Bu kabuk program iptables uygulaması ile kural ya da zincir kurallar yazmamızı sağlamaktadır. Bu proje kapsamında kullanılan ana kural gelen paketlerin engellenen ip adreslerinden
birisi ile eşleşmesi durumunda paketin yok edilmesi üzerinedir. Programda 5 ayrı seçenek bulunmaktadır. Bunlar sırası ile liste haline ip adresinin engellenmesi, kendi istediğimiz ip adresini engelleme, liste halinde ip adresinin engelinin kaldırılması, kendi seçtiğimiz ip adresinin engelini kaldırma ve yapılan tüm işlemlerin silinmesi seçeneklerinden oluşmaktadır.

Blocklist.txt dosyası içerisine engellemek istenen ip adreslerinin alt alta yazılması gereken metin belgesidir.
Unblocklist.txt dosyası içerisine engeli kaldırılmak istenen ip adreslerinin alt alta yazılması gereken metin belgesidir.
Blockiplist.txt dosyası içerisine daha önce engellenmiş olan ip adreslerinin yazıldığı metin belgesidir.
Unblockiplist.txt dosyası içerisine engeli kaldırılmış ip adreslerinin yazıldığı metin belgesidir.
Log.txt dosyası içerisine yapılan işlemlerin tarih ve saat ile yapılan işlemlerin sırası ile kaydedildiği metin belgesidir.
