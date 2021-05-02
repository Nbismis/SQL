CREATE  TABLE ogrenciler(
id NUMBER(9),
isim VARCHAR2(50),
adres VARCHAR2(100),
sinav_notu NUMBER(3)

);
INSERT INTO ogrenciler VALUES(123, 'Ali Can', 'Ankara',75);
INSERT INTO ogrenciler VALUES(124, 'Merve Gul', 'Ankara',85);
INSERT INTO ogrenciler VALUES(125, 'Kemal Yasa', 'Istanbul',85);

SELECT * FROM ogrenciler;

--notu 80 den buyuk olan ogrenciyi goster
SELECT * FROM ogrenciler
WHERE sinav_notu>80; 

--sadece isim ve not gormek istiyoruz, 
SELECT isim, sinav_notu
FROM ogrenciler
where sinav_notu>80;

SELECT isim,adres
FROM ogrenciler
where adres='Ankara';

SELECT * FROM ogrenciler
WHERE id=128;

SELECT * FROM ogrenciler
WHERE upper (adres)='ANKARA';  --upper yazinca buyuk harfi kabul ediyor




CREATE TABLE personel
    (   
        id CHAR(5),
        isim VARCHAR2(50),
        maas NUMBER(5)
    );
​
    INSERT INTO personel VALUES('10001', 'Ahmet Aslan', 7000);
    INSERT INTO personel VALUES('10002', 'Mehmet Yılmaz' ,12000);
    INSERT INTO personel VALUES('10003', 'Meryem ', 7215); --meryemden sonra bosluk var 7 haneli
    INSERT INTO personel VALUES('10004', 'Veli Han', 5000);
    INSERT INTO personel VALUES('10005', 'Mustafa Ali', 5500);
    INSERT INTO personel VALUES('10005', 'Ayşe Can', 4000);
​
    SELECT * FROM personel;
    --DROP TABLE personel;
    --ARALIK VEREREK >=,<=,>,< 10002 ile 10005 dahil olacak sekilde goster
    SELECT * FROM personel
    WHERE id>='10002' AND id<='10005';
    
    --BETWEEN kullanarak goster, betweende alt ve ust sinirlar dahildir
    SELECT*FROM personel
    WHERE id BETWEEN '10002'AND '10005';
    
    --Mehmet Yilmaz ile Veli Han arasindaki isimleri goster
    --alfabetik sira yapiyor yani m ve v arasindaki
    SELECT*FROM personel
    WHERE isim BETWEEN 'Mehmet Yilmaz'and 'Veli Han';
    
    --NOT BETWEEN idsi 10002 ile 10004 arasinda olmayanlar
   SELECT*FROM personel
    WHERE id  NOT BETWEEN '10002' AND '10004';
    
    --IN birden fazla seye esit mi diye bakabiliyoruz,
    --eger aralik duzenli degilse IN kullanmak faydalidir. IN esit mi demek
    ---10001,10002 ve 10004 olanlari listele
    SELECT*FROM personel
    WHERE id  IN ('10001','10002','10004');
    
    --IN siz yapalim
     SELECT*FROM personel
     WHERE id='10001' OR id='10002' OR id='10004';
    
    --maasi Sadece 7000 ile sadece 12000 olanlari alalim
     SELECT*FROM personel
     WHERE maas IN (7000 ,12000);
     
     --=============LIKE and NOT LIKE=================
     --BELIRLI PATTERNLERI KULLANABILMEMIZE OLANAK SAGLAR
     --EX; WHERE isim LIKE 'A%'; ismi A ile baslayanlar
     --WHERE isim LIKE '%n'; ismi n ile bitenler,nasil baslarsa baslasin sonu n ile bitsin
     --WHERE isim LIKE '%an%'; isminde an harfi olanlar, arada an olanlari goster
     -- %neolursa olsun 'A%' aile baslasin sonu ne olursa olsun
     --" _" onemsiz demek
     --" _" kullanimi WHERE isim LIKE '_li%'; isminin 2. harfi l ve 3. harfi i
    -- WHERE isim LIKE '_li'; sadece 3 karakter alabilir yuzde yok:Ali
    --WHERE isim LIKE '_a%y%'; 2.kisim a gerikalan kisim y:Bahtiyar,Malatya
    --WHERE isim LIKE '_r_';  ismi 6 harfli olur 3. harfi r olan
    --WHERE maas LIKE '_____'; 5 haneli maaslar, character gostermek icin tirnak icinde olmasi gerek
    --WHERE maas NOT LIKE '_____';5 haneli olmayan maasler
   -- WHERE maas NOT LIKE 2000; maasi 2000 olmayanlar
   
   --m ile baslayanlari
   SELECT * FROM personel
   WHERE isim LIKE 'M%';
   
   --isim 7 haneli olanlari goster
   SELECT * FROM personel
   WHERE isim LIKE '_______';
   
   --2.harfi e
   SELECT * FROM personel
   WHERE isim LIKE '_e%';
   
   --maasin son 2 hanesi 0 olan kisiler
    SELECT * FROM personel
   WHERE maas LIKE '%00';
   
   --1. harfi a 7.harfi a
    SELECT * FROM personel
   WHERE isim LIKE 'A_____A%';
   
   --icinde an kelimesi gecen isimler
     SELECT * FROM personel
   WHERE isim LIKE '%an%';
   
   --maasi 4 basamakli olmayan
     SELECT * FROM personel
   WHERE maas NOT LIKE '____';
   
   