/*- SQL sorgusu-*/

SELECT
    [Araç Tablosu].aracno,
    COUNT([Kiralama Tablosu].mkod) AS kiralama_sayisi
FROM
    [Araç Tablosu]
    INNER JOIN [Kiralama Tablosu] ON [Araç Tablosu].aracno = [Kiralama Tablosu].aracno
GROUP BY
    [Araç Tablosu].aracno;
/*- ilişkisel cebir ifadesi
π aracno,COUNT(mkod) ​ (σ mkod is not null ​ (Kira) ⋈ aracno ​ Arac)
-*/