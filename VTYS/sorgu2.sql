/*- SQL sorgusu-*/

SELECT
    [Müşteri Tablosu].mtel
FROM
    [Müşteri Tablosu]
WHERE
    ((([Müşteri Tablosu].[mad]) = 'Elif'));

/*- ilişkisel cebir ifadesi
π mtel​(σ mad=′Elif′​ (Müşteri Tablosu))
-*/