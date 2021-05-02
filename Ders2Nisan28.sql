CREATE TABLE insanlar 
    (
        ssn CHAR(9),
        isim VARCHAR2(50), 
        adres VARCHAR2(50) 
    );

    INSERT INTO insanlar VALUES(123456789, 'Ali Can', 'Istanbul');
    INSERT INTO insanlar VALUES(234567890, 'Veli Cem', 'Ankara');
    INSERT INTO insanlar VALUES(345678901, 'Mine Bulut', 'Izmir');
    INSERT INTO insanlar (ssn, adres) VALUES(456789012, 'Bursa');
    INSERT INTO insanlar (ssn, adres) VALUES(567890123, 'Denizli');
    INSERT INTO insanlar (adres) VALUES('Sakarya');
    INSERT INTO insanlar (ssn) VALUES(999111222);
    
    /* null olanları listeleyiniz */
    
    SELECT * FROM insanlar
    WHERE isim IS null;
    
    /* null olmayanları listeleyiniz */
    
    SELECT * FROM insanlar
    WHERE isim IS NOT null;
    
    /* null olan isimleri NO name yazdırın*/
    
    UPDATE insanlar 
    SET isim = 'No Name'
    WHERE isim IS NULL;
    
    /* ----------------------------------------------------------------------------
  ORNEK4:   isim ’i NULL olanlara ‘Henuz isim girilmedi’
            adres ’i NULL olanlara ‘Henuz adres girilmedi’
            ssn ’i NULL olanlara ‘Henuz ssn girilmedi’ atayalım.
-----------------------------------------------------------------------------*/

--UPDATE insanlar
--SET isim = 'Henüz isim girilmedi'
--WHERE isim IS NULL

  UPDATE insanlar
   SET isim = COALESCE (isim, 'Henüz isim girilmedi'),
       adres = COALESCE (adres, 'Henüz adres girilmedi'),
       ssn= COALESCE (ssn, 'No SSN');
    
    
    /*================================ ORDER BY  ===================================
   ORDER BY cümleciği bir SORGU deyimi içerisinde belli bir SUTUN’a göre 
   SIRALAMA yapmak için kullanılır.
   
   Syntax
   -------
      ORDER BY sutun_adi ASC   -- ARTAN
      ORDER BY sutun_adi DESC  -- AZALAN
==============================================================================*/       
    CREATE TABLE kisiler 
    (
        ssn CHAR(9) PRIMARY KEY,
        isim VARCHAR2(50), 
        soyisim VARCHAR2(50), 
        maas NUMBER,
        adres VARCHAR2(50) 
    );

    INSERT INTO kisiler VALUES(123456789, 'Ali','Can', 3000,'Istanbul');
    INSERT INTO kisiler VALUES(234567890, 'Veli','Cem', 2890,'Ankara');
    INSERT INTO kisiler VALUES(345678901, 'Mine','Bulut',4200,'Ankara');
    INSERT INTO kisiler VALUES(256789012, 'Mahmut','Bulut',3150,'Istanbul');
    INSERT INTO kisiler VALUES (344678901, 'Mine','Yasa', 5000,'Ankara');
    INSERT INTO kisiler VALUES (345458901, 'Veli','Yilmaz',7000,'Istanbul');

    SELECT * FROM kisiler;

/* ----------------------------------------------------------------------------
  ORNEK1: kisiler tablosunu adres'e göre sıralayarak sorgulayınız.
 -----------------------------------------------------------------------------*/ 

    SELECT * FROM kisiler
    ORDER BY adres;   --- ASC gibi sıradı.

/* ----------------------------------------------------------------------------
  ORNEK2: kisiler tablosunu maas'a göre sıralayarak sorgulayınız.
 -----------------------------------------------------------------------------*/  
    SELECT * FROM kisiler
    ORDER BY maas;   

 /* ----------------------------------------------------------------------------
  ORNEK3: kisiler tablosunu maas'a göre AZALAN sırada sorgulayınız.
 -----------------------------------------------------------------------------*/ 
    SELECT * FROM kisiler
    ORDER BY maas DESC;  -- Azalan

/* ----------------------------------------------------------------------------
  ORNEK4: ismi Mine olanları, SSN'e göre AZALAN sırada sorgulayınız.
-----------------------------------------------------------------------------*/
    SELECT * FROM kisiler
    WHERE isim = 'Mine'
    ORDER BY ssn DESC;
/* ----------------------------------------------------------------------------
  ORNEK5: soyismi 'i Bulut olanları isim sıralı olarak sorgulayınız.
-----------------------------------------------------------------------------*/ 
    SELECT * FROM kisiler
    WHERE soyisim = 'Bulut'
    ORDER BY 2; --(  ORDER BY isim de aynı sonucu veriri              
    -- isim'e göre sıralanmış


/*====================== FETCH NEXT, OFFSET (12C VE ÜSTÜ) ======================
   FETCH cümleciği ile listelenecek kayıtları sınırlandırabiliriz. İstersek 
   satır sayısına göre istersek de toplam satır sayısının belli bir yüzdesine 
   göre sınırlandırma koymak mümkündür. 
   
   Syntax
   ---------
   FETCH NEXT satir_sayisi ROWS ONLY;
   FETCH NEXT satir_yuzdesi PERCENT ROWS ONLY;
   
   
   OFFSET Cümleciği ile de listenecek olan satırlardan sırasıyla istediğimiz 
   kadarını atlayabiliriz.  
   
   Syntax
   ----------
   OFFSET satır_sayisi ROWS;
  
==============================================================================*/ 
/* ----------------------------------------------------------------------------
  ORNEK1: MAAŞ'ı en yüksek 3 kişinin bilgilerini listeleyen sorguyu yazınız.
-----------------------------------------------------------------------------*/
    SELECT * FROM kisiler
    ORDER BY maas DESC
    FETCH NEXT 3 ROWS ONLY;

/* ----------------------------------------------------------------------------
  ORNEK2: MAAŞ'ı en DÜŞÜK 2 kişinin bilgilerini listeleyen sorguyu yazınız.
-----------------------------------------------------------------------------*/
    SELECT * FROM kisiler
    ORDER BY maas ASC
    FETCH NEXT 2 ROWS ONLY;

/* ----------------------------------------------------------------------------
  ORNEK3: MAAŞ'a göre sıralamada 4. ile 6. kişilerin bilgilerini listeleyen 
  sorguyu yazınız.
-----------------------------------------------------------------------------*/     
    SELECT * FROM kisiler
    ORDER BY maas DESC
    OFFSET 3 ROWS           -- ilk 3 kaydı atladık
    FETCH NEXT 3 ROWS ONLY; -- sonraki 3 kaydı seçtik.
    
    
 /*============================= GROUP BY =====================================
    
    GROUP BY cümleciği bir SELECT ifadesinde satırları, sutunların değerlerine 
    göre özet olarak gruplamak için kullanılır. 
   
    GROUP BY cümleceği her grup başına bir satır döndürür. 
    
    GROUP BY genelde, AVG(),COUNT(),MAX(),MIN() ve SUM() gibi aggregate 
    fonksiyonları ile birlikte kullanılır.
    
==============================================================================*/ 
      
    CREATE TABLE manav 
    (
        isim varchar2(50), 
        urun_adi varchar2(50), 
        urun_miktari number(9) 
    );
    
    INSERT INTO manav VALUES( 'Ali', 'Elma', 5);
    INSERT INTO manav VALUES( 'Ayse', 'Armut', 3);
    INSERT INTO manav VALUES( 'Veli', 'Elma', 2);
    INSERT INTO manav VALUES( 'Hasan', 'Uzum', 4);
    INSERT INTO manav VALUES( 'Ali', 'Armut', 2);
    INSERT INTO manav VALUES( 'Ayse', 'Elma', 3);
    INSERT INTO manav VALUES( 'Veli', 'Uzum', 4);
    INSERT INTO manav VALUES( 'Ali', 'Armut', 2);
    INSERT INTO manav VALUES( 'Veli', 'Elma', 3);
    INSERT INTO manav VALUES( 'Ayse', 'Uzum', 4);
    INSERT INTO manav VALUES( 'Ali', '', 2);
    
/* -----------------------------------------------------------------------------
  ORNEK1: kisi ismine göre satılan toplam meyve miktarlarını gösteren sorguyu 
  yazınız.
------------------------------------------------------------------------------*/  
    SELECT isim, SUM(urun_miktari) AS toplam_urun 
    FROM manav
    GROUP BY isim;
   
/* ----------------------------------------------------------------------------
  ORNEK2: satılan meyve türüne (urun_adi) göre urun alan kişi sayısını gösteren
  sorguyu yazınız. NULL olarak girilen meyveyi listelemesin.
-----------------------------------------------------------------------------*/ 
    -- GROUP by ile birlikte WHERE cümleciği kullanılabilir.
        
    SELECT urun_adi, COUNT(isim) AS kisi_sayisi
    FROM manav
    WHERE urun_adi IS NOT NULL
    GROUP BY urun_adi;
    
    SELECT * FROM manav;
    
   
/* ----------------------------------------------------------------------------
  ORNEK3: satılan meyve türüne (urun_adi) göre satılan (urun_miktari )MIN ve 
  MAX urun miktarlarini, MAX urun miktarina göre sıralayarak listeyen sorguyu 
  yazınız.
-----------------------------------------------------------------------------*/ 
    SELECT urun_adi,MIN(urun_miktari) min_miktar, MAX(urun_miktari) maks_miktar
    FROM manav
    WHERE urun_adi IS NOT NULL
    GROUP BY urun_adi
    ORDER BY MAX(urun_miktari) DESC;
    
/* ----------------------------------------------------------------------------
  ORNEK4: kisi ismine ve urun adına göre satılan ürünlerin toplamını 
  gruplandıran ve isime göre ters sırasıda listeyen sorguyu yazınız.
 -----------------------------------------------------------------------------*/ 
     SELECT isim, urun_adi, SUM(urun_miktari) as toplam_miktar
     FROM manav
     WHERE urun_adi IS NOT NULL
     GROUP BY isim, urun_adi
     ORDER BY isim DESC;
     
/* ----------------------------------------------------------------------------
  ORNEK5: kisi ismine ve urun adına göre satılan ürünlerin toplamını bulan ve
  ve bu toplam değeri 3 ve fazlası olan kayıtları toplam urun miktarlarina göre
  ters siralayarak listeyen sorguyu yazınız.
 -----------------------------------------------------------------------------*/  
     SELECT isim, urun_adi, SUM(urun_miktari) as toplam_miktar
     FROM manav
     GROUP BY isim, urun_adi
     HAVING SUM(urun_miktari) >= 3
     ORDER BY SUM(urun_miktari) DESC;
     
    -- AGGREGATE fonksiyonları ile ilgili bir koşul koymak için GROUP BY'dan 
    -- sonra HAVING cümleciği kullanılır.
 
 /* ----------------------------------------------------------------------------
  ORNEK6: satılan urun_adi'na göre MAX urun sayılarını sıralayarak listeyen 
  sorguyu yazınız. NOT: Sorgu, sadece MAKS urun_miktari MIN urun_miktarına 
  eşit olmayan kayıtları listelemelidir.
 -----------------------------------------------------------------------------*/    
     SELECT urun_adi, MAX(urun_miktari)
     FROM manav
     GROUP BY urun_adi
     HAVING MAX(urun_miktari) <> MIN(urun_miktari)
     ORDER BY MAX(urun_miktari);


 /*============================= DISTINCT =====================================
    
    DISTINCT cümleciği bir SORGU ifadesinde benzer olan satırları flitrelemek
    için kullanılır. Dolayısıyla seçilen sutun yada sutunlar için benzersiz veri
    içeren satırlar oluşturmaya yarar.
   
    SYNTAX
    -------
    SELECT DISTINCT sutun_adi1, sutun_adi2, satin_adi3
    FROM  tablo_adı;
==============================================================================*/
    
     
/* ----------------------------------------------------------------------------
  ORNEK1: satılan farklı meyve türlerinin sayısını listeyen sorguyu yazınız.
-----------------------------------------------------------------------------*/   
    
    SELECT COUNT(DISTINCT urun_adi) AS urun_sayisi 
    FROM manav;

/* -----------------------------------------------------------------------------
  ORNEK2: satılan meyve ve isimlerin farklı olanlarını listeyen sorguyu yazınız.
------------------------------------------------------------------------------*/
     SELECT DISTINCT urun_adi,isim   -- 2 sutun icin beraber degerlendirirek
                                     -- benzerli olanları cikariyor.
     FROM manav; 
     
/* ----------------------------------------------------------------------------
  ORNEK3: satılan meyvelerin urun_mikarlarinin benzersiz  olanlarının 
  toplamlarini listeyen sorguyu yazınız.
-----------------------------------------------------------------------------*/     
     SELECT SUM(DISTINCT urun_miktari) AS urun_sayisi 
     FROM manav;
      
     
     /*==================== SET OPERATORLERI: UNION, UNION ALL======================
    
    UNION, UNION ALL, INTERSECT, ve MINUS gibi SET operatorleri yardimiyla  
    Çoklu Sorgular birlestirilebilirler.
    UNION :  Bir SET operatorudur. 2 veya daha fazla Sorgu ifadesinin sonuc 
    kumelerini birlesitirerek tek bir sonuc kumesi olusturur.    
   
    NOT:  Birleşik olan olan Sorgu ifadesinin veri türü diğer sorgulardaki 
    ifadelerin veri türü ile uyumlu olmalıdır.
    
    Syntax:
    ----------
    SELECT sutun_adi,sutun_adi2, .. FROM tablo_adi1
    UNION
    SELECT sutun_adi1, sutun_adi2, .. FROM tablo_adi2;
    
    NOT: UNION operatoru SADECE benzersi degerleri alır. Benzerli verileri almak
    için UNION ALL kullanılır.
==============================================================================*/ 
  
    CREATE TABLE personel 
    (
        id NUMBER(9), 
        isim VARCHAR2(50), 
        sehir VARCHAR2(50), 
        maas NUMBER(20), 
        sirket VARCHAR2(20),
        CONSTRAINT personel_pk PRIMARY KEY(id)
    );
    
    INSERT INTO personel VALUES(123456789, 'Ali Yilmaz', 'Istanbul', 5500, 'Honda');
    INSERT INTO personel VALUES(234567890, 'Veli Sahin', 'Istanbul', 4500, 'Toyota');
    INSERT INTO personel VALUES(345678901, 'Mehmet Ozturk', 'Ankara', 3500, 'Honda'); 
    INSERT INTO personel VALUES(456789012, 'Mehmet Ozturk', 'Izmir', 6000, 'Ford');
    INSERT INTO personel VALUES(567890123, 'Mehmet Ozturk', 'Ankara', 7000, 'Tofas');
    INSERT INTO personel VALUES(453445611, 'Veli Sahin', 'Ankara', 4500, 'Ford');
    INSERT INTO personel VALUES(123456710, 'Hatice Sahin','Bursa', 4200, 'Honda');
    
    SELECT * FROM personel;
    
/* -----------------------------------------------------------------------------
  ORNEK2: Maasi 4000’den cok olan isci isimlerini ve 5000 liradan fazla maas 
  alinan sehirleri gosteren sorguyu yaziniz
------------------------------------------------------------------------------*/
    
    SELECT isim AS isim_veya_sehir, maas
    FROM personel
    WHERE maas > 4000
    UNION ALL
    SELECT sehir, maas 
    FROM personel
    WHERE maas > 5000;
    
    
/* -----------------------------------------------------------------------------
  ORNEK3: Mehmet Ozturk ismindeki kisilerin aldigi maaslari ve Istanbul’daki
  personelin maaslarini yüksekten alçağa doğru sıralayarak bir tabloda gosteren
  sorguyu yaziniz.   
------------------------------------------------------------------------------*/
SELECT isim AS isim_veya_sehir ,maas FROM personel WHERE isim='Mehmet Ozturk'
UNION
SELECT sehir,maas FROM personel WHERE sehir='Istanbul' ORDER BY maas DESC;
    

    

