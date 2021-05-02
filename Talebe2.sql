CREATE TABLE talebeler2
    (
        id CHAR(3),
        isim VARCHAR2(50),
        veli_isim VARCHAR2(50),
        yazili_notu NUMBER(3),
        CONSTRAINT talebe2_pk PRIMARY KEY (id)
    );
    
    DROP TABLE talebeler2
    
    INSERT INTO talebeler2 VALUES(123, 'Ali Can', 'Hasan',75);
    INSERT INTO talebeler2 VALUES(124, 'Merve Gul', 'Ayse',85);
	INSERT INTO talebeler2 VALUES(125, 'Kemal Yasa', 'Hasan',85);
    INSERT INTO talebeler2 VALUES(126, 'Nesibe Yilmaz', 'Ayse',95);
	INSERT INTO talebeler2 VALUES(127, 'Mustafa Bak', 'Can',99);

     CREATE TABLE notlar 
    ( 
        talebe2_id char(3), 
        ders_adi varchar2(30), 
        yazili_notu number (3), 
        CONSTRAINT notlar_fk FOREIGN KEY (talebe2_id) 
        REFERENCES talebeler2(id) ON DELETE CASCADE
    );

    INSERT INTO notlar VALUES ('123','kimya',75);
    INSERT INTO notlar VALUES ('124', 'fizik',65);
    INSERT INTO notlar VALUES ('124', 'fizik',75);
    INSERT INTO notlar VALUES ('125', 'tarih',90);
	INSERT INTO notlar VALUES ('126', 'Matematik',90);
    
    DELETE FROM talebeler2;
    
    
         
/*============================== ON DELETE CASCADE =============================

  Her defasında önce child tablodaki verileri silmek yerine ON DELETE CASCADE
  silme özelliğini aktif hale getirebiliriz.
  
  Bunun için FK olan satırın en sonuna ON DELETE CASCADE komutunu yazmak yeterli
  
==============================================================================*/ 
    
    
    
    