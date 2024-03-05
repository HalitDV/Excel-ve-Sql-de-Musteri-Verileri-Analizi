SELECT * FROM Müsteriler

--SORU 1-) Toplam satislara gore sirketin en iyi musterisi kimdir?

SELECT TOP 1 Musteri,SUM(ToplamTutar) Total

FROM Müsteriler
GROUP BY Musteri
ORDER BY Total DESC

--SORU 2-) Toplam satislara gore sirketin en kotü musterisi kimdir?
SELECT TOP 1 Musteri,SUM(ToplamTutar) Total

FROM Müsteriler
GROUP BY Musteri
ORDER BY Total ASC

--SORU 3-) Toplam kara gore sirketin en iyi musterisi kimdir?
SELECT TOP 1 Musteri,SUM(Kar) Total

FROM Müsteriler
GROUP BY Musteri
ORDER BY Total DESC

--SORU 4-) Toplam kara göre sirketin en kotü musterisi kimdir?
SELECT TOP 1 Musteri,SUM(Kar) Total

FROM Müsteriler
GROUP BY Musteri
ORDER BY Total ASC

--SORU 5-) Toplam satislara gore sirketin en cok satan urunu hangisidir?
SELECT TOP 1 ÜrünAdi,SUM(ToplamTutar) Total

FROM Müsteriler
GROUP BY ÜrünAdi
ORDER BY Total DESC

--SORU 6-) Toplam satislara gore sirketin en az satan urunu hangisidir?
SELECT TOP 1 ÜrünAdi,SUM(ToplamTutar) Total

FROM Müsteriler
GROUP BY ÜrünAdi
ORDER BY Total ASC

--Soru 7-) Toplam kâra gore sirketin en cok satan urunu hangisidir?
SELECT TOP 1 ÜrünAdi,SUM(Kar) Total

FROM Müsteriler
GROUP BY ÜrünAdi
ORDER BY Total DESC

--Soru 8-) Toplam kâra gore sirketin en az satan urunu hangisidir?
SELECT TOP 1 ÜrünAdi,SUM(Kar) Total

FROM Müsteriler
GROUP BY ÜrünAdi
ORDER BY Total ASC

--Soru 9-) Toplam kâra gore sirketin en iyi satis temsilcisi kimdir?
SELECT TOP 1 SatisTemsilcisi,SUM(Kar) Total

FROM Müsteriler
GROUP BY SatisTemsilcisi
ORDER BY Total DESC


--Soru 10-) Toplam kâra gore sirketin en kotu satis temsilcisi kimdir?
SELECT TOP 1 SatisTemsilcisi,SUM(Kar) Total

FROM Müsteriler
GROUP BY SatisTemsilcisi
ORDER BY Total ASC

--Soru 11-) En iyi satis temsilcisinin en cok satan urunu (toplam kâra gore) hangisidir?

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

--Soru 12-)En iyi satis temsilcisinin en iyi musterisi (toplam kâra gore) kimdir?

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

--Soru 13-) En iyi satis temsilcisinin en cok satan urunu (toplam satislara gore) hangisidir?

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

--Soru 14-)En iyi satis temsilcisinin en kotu musterisi kimdir (toplam kâra gore)
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