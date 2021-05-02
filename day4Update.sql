
/* ============================== UPDATE SET ===================================    
    
   İlk olarak aşağıdaki gibi tedarikciler adında bir tablo oluşturunu ve 
   vergi_no sutununu primary key yapınız.Ayrıca aşağıdaki verileri tabloya giriniz.

    vergi_no NUMBER(3),
    firma_ismi VARCHAR2(50),
    irtibat_ismi VARCHAR2(50),
        
    INSERT INTO tedarikciler VALUES (101, 'IBM', 'Kim Yon');
	INSERT INTO tedarikciler VALUES (102, 'Huawei', 'Çin Li');
	INSERT INTO tedarikciler VALUES (103, 'Erikson', 'Maki Tammamen');
    INSERT INTO tedarikciler VALUES (104, 'Apple', 'Adam Eve');
        
    Sonrasında aşağıdaki gibi urunler adında bir başka tablo oluşturunuz ve bu
    tablonun ted_vergino sutunu ile tedarikciler tablosunun vergi_no sutunu
    ilişkilendiriniz. Verileri giriniz.

    ted_vergino NUMBER(3), 
    urun_id NUMBER(11), 
    urun_isim VARCHAR2(50), 
    musteri_isim VARCHAR2(50),
    
    INSERT INTO urunler VALUES(101, 1001,'Laptop', 'Ayşe Can');
    INSERT INTO urunler VALUES(102, 1002,'Phone', 'Fatma Aka');
    INSERT INTO urunler VALUES(102, 1003,'TV', 'Ramazan Öz');
    INSERT INTO urunler VALUES(102, 1004,'Laptop', 'Veli Han');
    INSERT INTO urunler VALUES(103, 1005,'Phone', 'Canan Ak');
    INSERT INTO urunler VALUES(104, 1006,'TV', 'Ali Bak');
    INSERT INTO urunler VALUES(104, 1007,'Phone', 'Aslan Yılmaz');
    
==============================================================================*/  
    CREATE TABLE tedarikciler
    (
        vergi_no NUMBER(3),
        firma_ismi VARCHAR2(50),
        irtibat_ismi VARCHAR2(50),
        CONSTRAINT pk_ted PRIMARY KEY (vergi_no)
    ); 
    
    INSERT INTO tedarikciler VALUES (101, 'IBM', 'Kim Yon');
    INSERT INTO tedarikciler VALUES (102, 'Huawei', 'Çin Li');
    INSERT INTO tedarikciler VALUES (103, 'Erikson', 'Maki Tammamen');
    INSERT INTO tedarikciler VALUES (104, 'Apple', 'Adam Eve');
    
    CREATE TABLE urunler
    (
        ted_vergino NUMBER(3), 
        urun_id NUMBER(11), 
        urun_isim VARCHAR2(50), 
        musteri_isim VARCHAR2(50),
        CONSTRAINT fk_urunler FOREIGN KEY(ted_vergino) REFERENCES tedarikciler(vergi_no) 
    );    
    
    INSERT INTO urunler VALUES(101, 1001,'Laptop', 'Ayşe Can');
    INSERT INTO urunler VALUES(102, 1002,'Phone', 'Fatma Aka');
    INSERT INTO urunler VALUES(102, 1003,'TV', 'Ramazan Öz');
    INSERT INTO urunler VALUES(102, 1004,'Laptop', 'Veli Han');
    INSERT INTO urunler VALUES(103, 1005,'Phone', 'Canan Ak');
    INSERT INTO urunler VALUES(104, 1006,'TV', 'Ali Bak');
    INSERT INTO urunler VALUES(104, 1007,'Phone', 'Aslan Yılmaz');
    
    SELECT * FROM tedarikciler;
    SELECT * FROM urunler;
    
    
    --- SYNTAX
    
   -- UPDATE tablo_adi
   -- SET sutun_adi = yeni_deger
   -- WHERE sutun_adi;
   
      -----------------------------------------------------------------------
-- ORNEK1: vergi_no’su 101 olan tedarikcinin ismini ‘LG’ ve irtibat_ismi’ni
  --‘Ali Veli’ olarak güncelleyeniz.
  ----------------------------------------------------------------------------
  
  UPDATE tedarikciler
  SET firma_ismi = 'LG'
  WHERE vergi_no = 101;
  
  SELECT * FROM tedarikciler;
    SELECT * FROM urunler;
    
-------
---ornek 2 Tedarikçi tablosundaki bütün firma isimlerini 'samsung' yaparak güncelleyiniz

 UPDATE tedarikciler
 SET firma_ismi = 'SAMSUNG';
 
 UPDATE tedarikciler
 SET firma_ismi = 'Samsung' , irtibat_ismi = 'Ali Veli'
 WHERE vergi_no = 102
 
 SELECT * FROM tedarikciler;
 SELECT * FROM urunler;
 
 UPDATE tedarikciler
 SET irtibat_ismi = 'Ayse YILMAZ'
 WHERE firma_ismi = 'Samsung';
 
 UPDATE tedarikciler
 SET urun_ismi = 'Telefon'
 WHERE urun_ismi = 'Phone';
 
 -----------------------------------------------------------------------------
  --ORNEK6: urunler tablosundaki urun_id değeri 
  --1004'ten büyük olanların urun_id
  ---değerlerini bir arttırınız
 -----------------------------------------------------------------------------*/
 UPDATE urunler
 SET urun_id = urun_id +1
 WHERE urun_id > 1004 ;
 
 /* -----------------------------------------------------------------------------
  ORNEK5: urunler tablosundaki tüm ürünlerin urun_id değerini ted_vergino
  sutun değerleri ile toplayarak güncelleyiniz.
-----------------------------------------------------------------------------*/

UPDATE urunler
SET urun_id = urun_id + ted_vergino;

/*============================================================================
   ORNEK6: urunler tablosundan Ali Bak’in aldigi urunun ismini, tedarikci
   tablosunda irtibat_ismi ‘Adam Eve’ olan firmanın ismi (firma_ismi) ile
   degistiriniz.
    
==============================================================================*/


UPDATE urunler
SET urun_isim = (SELECT firma_ismi FROM tedarikciler
                WHERE irtibat_ismi = 'Adam Eve')
WHERE musteri_isim = 'Ali Bak';




 
 

    
    
    
    