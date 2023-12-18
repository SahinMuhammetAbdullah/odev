/*- SQL sorgusu-*/

SELECT
    aracno,
    tarih
FROM
    [Müşteri Tablosu]
    INNER JOIN [Kiralama Tablosu] ON [Müşteri Tablosu].mkod = [Kiralama Tablosu].mkod
WHERE
    mad = 'Murat';

/*- ilişkisel cebir ifadesi
π aracno, tarih ​ (σ mad = ′ Murat ′ ​ (Müşteri Tablosu ⋈ Kiralama Tablosu))
-*/