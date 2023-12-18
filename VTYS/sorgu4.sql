/*- SQL sorgusu-*/

SELECT
    DISTINCT [Araç Tablosu].plaka
FROM
    (
        [Müşteri Tablosu]
        INNER JOIN [Kiralama Tablosu] ON [Müşteri Tablosu].mkod = [Kiralama Tablosu].mkod
    )
    INNER JOIN [Araç Tablosu] ON [Kiralama Tablosu].aracno = [Araç Tablosu].aracno
WHERE
    [Müşteri Tablosu].mad = 'Elif';

/*- ilişkisel cebir ifadesi
π plaka (σ mad=′Elif′(Müşteri Tablosu⋈ Kiralama Tablosu ⋈ Araç Tablosu))
-*/