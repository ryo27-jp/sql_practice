-- SELECT shohin_mei, torokubi FROM Shohin WHERE torokubi > '2009-4-28'

-- SELECT shohin_mei, hanbai_tanka, shiire_tanka FROM Shohin 
-- WHERE NOT hanbai_tanka - shiire_tanka < 500; 


-- SELECT shohin_mei, hanbai_tanka, shiire_tanka
--   FROM Shohin
--  WHERE hanbai_tanka - 500 >= shiire_tanka;

SELECT shohin_mei, hanbai_tanka, shohin_bunrui, hanbai_tanka * 0.9 - shiire_tanka AS 'rikei'
  FROM Shohin
 WHERE hanbai_tanka * 0.9 - shiire_tanka > 100 AND (shohin_bunrui = 'キッチン用品' OR shohin_bunrui = '事務用品')