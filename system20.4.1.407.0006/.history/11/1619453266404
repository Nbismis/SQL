  CREATE TABLE ogrenciler
    (
        id CHAR(3),
        isim VARCHAR2(50),
        veli_isim VARCHAR2(50),
        yazili_notu NUMBER(3)       
    );
    
    DROP TABLE ogrenciler;
    
    INSERT INTO ogrenciler VALUES(123, 'Ali Can', 'Hasan',75);
    INSERT INTO ogrenciler VALUES(124, 'Merve Gul', 'Ayse',85);
	INSERT INTO ogrenciler VALUES(125, 'Kemal Yasa', 'Hasan',85);
    INSERT INTO ogrenciler VALUES(126, 'Nesibe Yilmaz', 'Ayse',95);
	INSERT INTO ogrenciler VALUES(127, 'Mustafa Bak', 'Can',99);

    SELECT * FROM ogrenciler;
    
    DROP TABLE ogrenciler;
    
    /*    seçerek silmek için */
    
    DELETE FROM ogrenciler
    WHERE id = 124;
    
    DELETE FROM ogrenciler
    WHERE isim = 'Kemal Yasa';
    
    DELETE FROM ogrenciler
    WHERE isim = 'Nesibe Yilmaz' OR isim= 'Mustafa Bak';
    
    DELETE FROM ogrenciler
    WHERE isim = 'Ali Can' OR id =123;
    
    DELETE FROM ogrenciler
    WHERE id > 126;
    
    DELETE FROM ogrenciler
    WHERE id IN(123,124,126);
    
    DELETE FROM ogrenciler;
    
    ROLLBACK;
    
    