SELECT * FROM Müsteriler

--SORU 1-) Toplam satýþlara göre þirketin en iyi müþterisi kimdir?

SELECT TOP 1 Musteri,SUM(ToplamTutar) Total

FROM Müsteriler
GROUP BY Musteri
ORDER BY Total DESC

--SORU 2-) Toplam satýþlara göre þirketin en kötü müþterisi kimdir?
SELECT TOP 1 Musteri,SUM(ToplamTutar) Total

FROM Müsteriler
GROUP BY Musteri
ORDER BY Total ASC

--SORU 3-) Toplam kara göre þirketin en iyi müþterisi kimdir?
SELECT TOP 1 Musteri,SUM(Kar) Total

FROM Müsteriler
GROUP BY Musteri
ORDER BY Total DESC

--SORU 4-) Toplam kara göre þirketin en kötü müþterisi kimdir?
SELECT TOP 1 Musteri,SUM(Kar) Total

FROM Müsteriler
GROUP BY Musteri
ORDER BY Total ASC

--SORU 5-) Toplam satýþlara göre þirketin en çok satan ürünü hangisidir?
SELECT TOP 1 ÜrünAdi,SUM(ToplamTutar) Total

FROM Müsteriler
GROUP BY ÜrünAdi
ORDER BY Total DESC

--SORU 6-) Toplam satýþlara göre þirketin en az satan ürünü hangisidir?
SELECT TOP 1 ÜrünAdi,SUM(ToplamTutar) Total

FROM Müsteriler
GROUP BY ÜrünAdi
ORDER BY Total ASC

--Soru 7-) Toplam kâra göre þirketin en çok satan ürünü hangisidir?
SELECT TOP 1 ÜrünAdi,SUM(Kar) Total

FROM Müsteriler
GROUP BY ÜrünAdi
ORDER BY Total DESC

--Soru 8-) Toplam kâra göre þirketin en az satan ürünü hangisidir?
SELECT TOP 1 ÜrünAdi,SUM(Kar) Total

FROM Müsteriler
GROUP BY ÜrünAdi
ORDER BY Total ASC

--Soru 9-) Toplam kâra göre þirketin en iyi satýþ temsilcisi kimdir?
SELECT TOP 1 SatisTemsilcisi,SUM(Kar) Total

FROM Müsteriler
GROUP BY SatisTemsilcisi
ORDER BY Total DESC

--Soru 10-) Toplam kâra göre þirketin en kötü satýþ temsilcisi kimdir?
SELECT TOP 1 SatisTemsilcisi,SUM(Kar) Total

FROM Müsteriler
GROUP BY SatisTemsilcisi
ORDER BY Total ASC

--Soru 11-) En iyi satýþ temsilcisinin en çok satan ürünü (toplam kâra göre) hangisidir?

SELECT TOP 1 ÜrünAdi, SUM(Kar) Total

FROM Müsteriler
WHERE SatisTemsilcisi IN
(SELECT SatisTemsilcisi 
FROM
(SELECT TOP 1 SatisTemsilcisi,SUM(Kar) TOT1 FROM Müsteriler
GROUP BY SatisTemsilcisi ORDER BY TOT1 DESC
)a
)
GROUP BY ÜrünAdi ORDER BY Total DESC

--Soru 12-)En iyi satýþ temsilcisinin en iyi müþterisi (toplam kâra göre) kimdir?

SELECT TOP 1 Musteri,SUM(Kar) TOT2
FROM Müsteriler
WHERE SatisTemsilcisi IN
(SELECT SatisTemsilcisi  FROM
( SELECT TOP 1 SatisTemsilcisi,SUM(Kar) TOT1 FROM Müsteriler 
GROUP BY SatisTemsilcisi 
ORDER BY TOT1 DESC
)t
)
GROUP BY Musteri
ORDER BY TOT2 DESC

--Soru 13-) En iyi satýþ temsilcisinin en çok satan ürünü (toplam satýþlara göre) hangisidir?

SELECT TOP 1 ÜrünAdi, SUM(ToplamTutar) TOT2
FROM Müsteriler
WHERE SatisTemsilcisi IN
(SELECT SatisTemsilcisi 
FROM
( SELECT TOP 1 SatisTemsilcisi,SUM(ToplamTutar) TOT1
FROM Müsteriler
GROUP BY SatisTemsilcisi
ORDER BY TOT1 DESC
)t
)
GROUP BY ÜrünAdi
ORDER BY TOT2 DESC

--Soru 14-)En iyi satýþ temsilcisinin en kötü müþterisi kimdir (toplam kâra göre)
SELECT TOP 1 Musteri,SUM(Kar)TOT2
FROM Müsteriler
WHERE SatisTemsilcisi IN
(SELECT SatisTemsilcisi FROM
(SELECT TOP 1 SatisTemsilcisi,SUM(Kar)TOT1 FROM Müsteriler
GROUP BY SatisTemsilcisi 
ORDER BY TOT1 DESC
)t
)
GROUP BY Musteri
ORDER BY TOT2 ASC