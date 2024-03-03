SELECT * FROM M�steriler

--SORU 1-) Toplam sat��lara g�re �irketin en iyi m��terisi kimdir?

SELECT TOP 1 Musteri,SUM(ToplamTutar) Total

FROM M�steriler
GROUP BY Musteri
ORDER BY Total DESC

--SORU 2-) Toplam sat��lara g�re �irketin en k�t� m��terisi kimdir?
SELECT TOP 1 Musteri,SUM(ToplamTutar) Total

FROM M�steriler
GROUP BY Musteri
ORDER BY Total ASC

--SORU 3-) Toplam kara g�re �irketin en iyi m��terisi kimdir?
SELECT TOP 1 Musteri,SUM(Kar) Total

FROM M�steriler
GROUP BY Musteri
ORDER BY Total DESC

--SORU 4-) Toplam kara g�re �irketin en k�t� m��terisi kimdir?
SELECT TOP 1 Musteri,SUM(Kar) Total

FROM M�steriler
GROUP BY Musteri
ORDER BY Total ASC

--SORU 5-) Toplam sat��lara g�re �irketin en �ok satan �r�n� hangisidir?
SELECT TOP 1 �r�nAdi,SUM(ToplamTutar) Total

FROM M�steriler
GROUP BY �r�nAdi
ORDER BY Total DESC

--SORU 6-) Toplam sat��lara g�re �irketin en az satan �r�n� hangisidir?
SELECT TOP 1 �r�nAdi,SUM(ToplamTutar) Total

FROM M�steriler
GROUP BY �r�nAdi
ORDER BY Total ASC

--Soru 7-) Toplam k�ra g�re �irketin en �ok satan �r�n� hangisidir?
SELECT TOP 1 �r�nAdi,SUM(Kar) Total

FROM M�steriler
GROUP BY �r�nAdi
ORDER BY Total DESC

--Soru 8-) Toplam k�ra g�re �irketin en az satan �r�n� hangisidir?
SELECT TOP 1 �r�nAdi,SUM(Kar) Total

FROM M�steriler
GROUP BY �r�nAdi
ORDER BY Total ASC

--Soru 9-) Toplam k�ra g�re �irketin en iyi sat�� temsilcisi kimdir?
SELECT TOP 1 SatisTemsilcisi,SUM(Kar) Total

FROM M�steriler
GROUP BY SatisTemsilcisi
ORDER BY Total DESC

--Soru 10-) Toplam k�ra g�re �irketin en k�t� sat�� temsilcisi kimdir?
SELECT TOP 1 SatisTemsilcisi,SUM(Kar) Total

FROM M�steriler
GROUP BY SatisTemsilcisi
ORDER BY Total ASC

--Soru 11-) En iyi sat�� temsilcisinin en �ok satan �r�n� (toplam k�ra g�re) hangisidir?

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

--Soru 12-)En iyi sat�� temsilcisinin en iyi m��terisi (toplam k�ra g�re) kimdir?

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

--Soru 13-) En iyi sat�� temsilcisinin en �ok satan �r�n� (toplam sat��lara g�re) hangisidir?

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

--Soru 14-)En iyi sat�� temsilcisinin en k�t� m��terisi kimdir (toplam k�ra g�re)
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