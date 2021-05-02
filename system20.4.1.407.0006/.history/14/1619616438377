
CREATE TABLE calisanlar1
(
id CHAR(4),
isim VARCHAR2(50),
maas NUMBER(5),
CONSTRAINT id_pk PRIMARY KEY (id)
);

INSERT INTO calisanlar1 VALUES('1001', 'Ahmet Aslan', 7000); 
INSERT INTO calisanlar1 VALUES( '1002', 'Mehmet Yılmaz' ,12000); 
INSERT INTO calisanlar1 VALUES('1003', 'Meryem ', 7215);
INSERT INTO calisanlar1 VALUES('1004', 'Veli Han', 5000);

 DROP TABLE aileler;
 
CREATE TABLE aileler
(
id CHAR(4),
cocuk_sayisi VARCHAR2(50),
ek_gelir NUMBER(5),
CONSTRAINT idm_fk FOREIGN KEY (id) REFERENCES calisanlar1(id)
);

INSERT INTO aileler VALUES('1001', 4, 2000);
INSERT INTO aileler VALUES('1002', 2, 1500); 
INSERT INTO aileler VALUES('1003', 1, 2200); 
INSERT INTO aileler VALUES('1004', 3, 2400);

SELECT * FROM aileler;


/*Veli Han'ın maaşına %20 zam yapacak update komutunu yazınız.
Güncellemeden sonra calisanlar tablosu aşağıda görüldüğü gibi olmalıdır.*/

UPDATE calisanlar1 SET maas = maas*1.2
WHERE isim = 'Veli Han';

--Maaşı ortalamanın altında olan çalışanların maaşına %20 zam yapınız.
--Komut sonrası görünüm aşağıdaki gibidir.---

UPDATE calisanlar1 SET maas = maas*1.2
WHERE maas < (SELECT ROUND (AVG(maas)) FROM calisanlar1);

--Çalışanların isim ve cocuk_sayisi'ni listeleyen bir sorgu yazınız.
--Komut sonrası görünüm aşağıdaki gibidir.

SELECT isim,(SElECT cocuk_sayisi FROM aileler
             WHERE calisanlar1.id = aileler.id) AS cocukSayisi

FROM calisanlar1


--calisanlar' ın id, isim ve toplam_gelir'lerini gösteren bir sorgu yazınız.
--toplam_gelir = calisanlar.maas + aileler.ek_gelir

SELECT id, isim, (( SELECT ek_gelir FROM aileler
                    WHERE calisanlar1.id = aileler.id) + calisanlar1.maas ) AS ToplamGelir
FROM calisanlar1









