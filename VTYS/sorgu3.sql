/*- SQL sorgusu-*/

SELECT
    DISTINCT [Araç Tablosu].model
FROM
    (
        [Müşteri Tablosu]
        INNER JOIN [Kiralama Tablosu] ON [Müşteri Tablosu].mkod = [Kiralama Tablosu].mkod
    )
    INNER JOIN [Araç Tablosu] ON [Kiralama Tablosu].aracno = [Araç Tablosu].aracno
WHERE
    mad = 'Murat'
    AND msoyad = 'Beyaz';

/*- ilişkisel cebir ifadesi
π model ​(σ mad= ′Murat′ ve msoyad= ′Beyaz′ (Müşteri Tablosu ⋈ Kiralama Tablosu))
-*/