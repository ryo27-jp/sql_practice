-- ウィンドウ関数
-- -- RANK
-- SELECT shohin_mei, shohin_bunrui, hanbai_tanka, 
-- RANK() OVER (PARTITION BY shohin_bunrui ORDER BY hanbai_tanka) AS ranking
-- FROM Shohin;

-- SELECT shohin_mei, shohin_bunrui, hanbai_tanka, 
-- RANK() OVER (ORDER BY hanbai_tanka) AS ranking
-- FROM Shohin;

-- -- 集約関数を使う
-- SELECT shohin_id, shohin_mei, hanbai_tanka,
--       SUM(hanbai_tanka) OVER (ORDER BY shohin_id) AS current_sum
--   FROM Shohin;

-- SELECT shohin_id, shohin_mei, hanbai_tanka,
--       MAX(hanbai_tanka) OVER (ORDER BY shohin_id) AS current_sum
--   FROM Shohin;

-- shohin_idの上から順番に最大値を返していく。

-- SELECT *, 
--       SUM(hanbai_tanka) OVER (ORDER BY COALESCE(torokubi, CAST('0001-01-01' AS DATE))) AS current_sum
--   FROM Shohin;
