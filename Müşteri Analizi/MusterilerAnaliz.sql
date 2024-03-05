SELECT * FROM M�steriler

--SORU 1-) Toplam satislara gore sirketin en iyi musterisi kimdir?

SELECT TOP 1 Musteri,SUM(ToplamTutar) Total

FROM M�steriler
GROUP BY Musteri
ORDER BY Total DESC

--SORU 2-) Toplam satislara gore sirketin en kot� musterisi kimdir?
SELECT TOP 1 Musteri,SUM(ToplamTutar) Total

FROM M�steriler
GROUP BY Musteri
ORDER BY Total ASC

--SORU 3-) Toplam kara gore sirketin en iyi musterisi kimdir?
SELECT TOP 1 Musteri,SUM(Kar) Total

FROM M�steriler
GROUP BY Musteri
ORDER BY Total DESC

--SORU 4-) Toplam kara g�re sirketin en kot� musterisi kimdir?
SELECT TOP 1 Musteri,SUM(Kar) Total

FROM M�steriler
GROUP BY Musteri
ORDER BY Total ASC

--SORU 5-) Toplam satislara gore sirketin en cok satan urunu hangisidir?
SELECT TOP 1 �r�nAdi,SUM(ToplamTutar) Total

FROM M�steriler
GROUP BY �r�nAdi
ORDER BY Total DESC

--SORU 6-) Toplam satislara gore sirketin en az satan urunu hangisidir?
SELECT TOP 1 �r�nAdi,SUM(ToplamTutar) Total

FROM M�steriler
GROUP BY �r�nAdi
ORDER BY Total ASC

--Soru 7-) Toplam k�ra gore sirketin en cok satan urunu hangisidir?
SELECT TOP 1 �r�nAdi,SUM(Kar) Total

FROM M�steriler
GROUP BY �r�nAdi
ORDER BY Total DESC

--Soru 8-) Toplam k�ra gore sirketin en az satan urunu hangisidir?
SELECT TOP 1 �r�nAdi,SUM(Kar) Total

FROM M�steriler
GROUP BY �r�nAdi
ORDER BY Total ASC

--Soru 9-) Toplam k�ra gore sirketin en iyi satis temsilcisi kimdir?
SELECT TOP 1 SatisTemsilcisi,SUM(Kar) Total

FROM M�steriler
GROUP BY SatisTemsilcisi
ORDER BY Total DESC


--Soru 10-) Toplam k�ra gore sirketin en kotu satis temsilcisi kimdir?
SELECT TOP 1 SatisTemsilcisi,SUM(Kar) Total

FROM M�steriler
GROUP BY SatisTemsilcisi
ORDER BY Total ASC

--Soru 11-) En iyi satis temsilcisinin en cok satan urunu (toplam k�ra gore) hangisidir?

SELECT TOP 1 �r�nAdi, SUM(Kar) Total

FROM M�steriler
WHERE SatisTemsilcisi IN
(SELECT SatisTemsilcisi 
FROM
(SELECT TOP 1 SatisTemsilcisi,SUM(Kar) TOT1 FROM M�steriler
GROUP BY SatisTemsilcisi ORDER BY TOT1 DESC
)a
)
GROUP BY �r�nAdi ORDER BY Total DESC

--Soru 12-)En iyi satis temsilcisinin en iyi musterisi (toplam k�ra gore) kimdir?

SELECT TOP 1 Musteri,SUM(Kar) TOT2
FROM M�steriler
WHERE SatisTemsilcisi IN
(SELECT SatisTemsilcisi  FROM
( SELECT TOP 1 SatisTemsilcisi,SUM(Kar) TOT1 FROM M�steriler 
GROUP BY SatisTemsilcisi 
ORDER BY TOT1 DESC
)t
)
GROUP BY Musteri
ORDER BY TOT2 DESC

--Soru 13-) En iyi satis temsilcisinin en cok satan urunu (toplam satislara gore) hangisidir?

SELECT TOP 1 �r�nAdi, SUM(ToplamTutar) TOT2
FROM M�steriler
WHERE SatisTemsilcisi IN
(SELECT SatisTemsilcisi 
FROM
( SELECT TOP 1 SatisTemsilcisi,SUM(ToplamTutar) TOT1
FROM M�steriler
GROUP BY SatisTemsilcisi
ORDER BY TOT1 DESC
)t
)
GROUP BY �r�nAdi
ORDER BY TOT2 DESC

--Soru 14-)En iyi satis temsilcisinin en kotu musterisi kimdir (toplam k�ra gore)
SELECT TOP 1 Musteri,SUM(Kar)TOT2
FROM M�steriler
WHERE SatisTemsilcisi IN
(SELECT SatisTemsilcisi FROM
(SELECT TOP 1 SatisTemsilcisi,SUM(Kar)TOT1 FROM M�steriler
GROUP BY SatisTemsilcisi 
ORDER BY TOT1 DESC
)t
)
GROUP BY Musteri
ORDER BY TOT2 ASC