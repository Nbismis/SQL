--============= REGEXP_LIKE =============== 
   
   
    CREATE TABLE kelimeler
    (
        id NUMBER(10) UNIQUE,
        kelime VARCHAR2(50) NOT NULL,
        harf_sayisi NUMBER(6)
    );
    
    INSERT INTO KELİMELER VALUES (1001, 'hot', 3);
    INSERT INTO KELİMELER VALUES (1002, 'hat', 3);
    INSERT INTO KELİMELER VALUES (1003, 'hit', 3);
    INSERT INTO KELİMELER VALUES (1004, 'hbt', 3);
    INSERT INTO KELİMELER VALUES (1008, 'hct', 3);
    INSERT INTO KELİMELER VALUES (1005, 'adem', 4);
    INSERT INTO KELİMELER VALUES (1006, 'selim', 5);
    INSERT INTO KELİMELER VALUES (1007, 'yusuf', 5);
    
    /*
    ÖRNEK: İlk harfi h, son harfi t olup 2.harfi a veya i olan 
    3 harfli kelimelerin tüm bilgilerini sorgulayalım.
    */
    
    SELECT *
    FROM kelimeler
    WHERE REGEXP_LIKE (kelime, 'h[ai]t');
 -------------------------------------------------------------------   
    /*
    ÖRNEK: İlk harfi h, son harfi t olup 2.harfi a ile k arasında 
    olan 3 harfli kelimelerin tüm bilgilerini sorgulayalım.
    */
    
    SELECT *
    FROM kelimeler
    WHERE REGEXP_LIKE (kelime, 'h[a-k]t');
    
 ---------------------------------------------------------------------   
    /*ÖRNEK: İçinde m veya i veya e olan kelimelerin tüm bilgilerini sorgulatalım.
    */
    
    SELECT *
    FROM kelimeler
    WHERE REGEXP_LIKE (kelime, '[mie](*)');
 --------------------------------------------------------------------------   
    /*ÖRNEK: a ile veya s ile başlayan kelimeler
    */
    
    SELECT *
    FROM kelimeler
    WHERE REGEXP_LIKE (kelime, '^[as]');
  -----------------------------------------------------------------------------  
    /*ÖRNEK: m ile veya f ile biten kelimeler
    */
    SELECT *
    FROM kelimeler
    WHERE REGEXP_LIKE (kelime, '[mf]$');
    
    
    
    
    
    
    
    
    
    