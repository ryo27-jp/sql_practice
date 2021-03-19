-- select  shohin_id, SUM(shohun_mei)
-- FROM shohin
-- GROUP BY torokubi;
-- WHERE torokubi > '2009-09-01';

-- SUM関数に文字型を適用している。
-- WHERE句がGROUP BY句の後に来ている。
-- GROUP BY句の集約キーがSELECTにない X →　SELECTキーにGROUP BYで使わない集約キーがある


-- SELECT shohin_bunrui, SUM(hanbai_tanka), SUM(shiire_tanka) *1.5
-- FROM Shohin
-- GROUP BY shohin_bunrui
-- HAVING SUM(hanbai_tanka) > SUM(shiire_tanka) * 1.5;

SELECT *
FROM shohin
ORDER BY torokubi DESC , hanbai_tanka;
