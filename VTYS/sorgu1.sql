/*- SQL sorgusu-*/

SELECT
    [Müşteri Tablosu].mad,
    [Müşteri Tablosu].msoyad,
    [Müşteri Tablosu].madres,
    [Müşteri Tablosu].mtel
FROM
    [Müşteri Tablosu]
WHERE
    ((([Müşteri Tablosu].[madres]) = 'Turhal/Tokat'));

/*- ilişkisel cebir ifadesi
 π mad,msoyad,madres,mtel (σ madres=′Turhal/Tokat′(Müşteri Tablosu))
-*/