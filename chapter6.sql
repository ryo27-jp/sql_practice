-- -- 前方一致
-- SELECT *
-- FROM SampleLike
-- WHERE strcol LIKE 'ddd%';

-- -- 中間一致
-- SELECT *
-- FROM SampleLike
-- WHERE strcol LIKE '%ddd%';

-- -- 後方一致
-- SELECT *
-- FROM SampleLike
-- WHERE strcol LIKE '%ddd';

-- -- 任意の２文字
-- SELECT *
-- FROM SampleLike
-- WHERE strcol LIKE 'abc__';

-- -- BETWEEN 100~1000
-- SELECT shohin_mei, hanbai_tanka
-- FROM Shohin
-- WHERE hanbai_tanka BETWEEN 100 AND 1000;

-- -- BETWEEN 101~999
-- SELECT shohin_mei, hanbai_tanka
-- FROM Shohin
-- WHERE hanbai_tanka > 100 AND hanbai_tanka < 1000;

-- -- IN
-- SELECT *
-- FROM Shohin
-- WHERE shiire_tanka IN (320,500,5000);

-- SELECT *
-- FROM Shohin
-- WHERE shiire_tanka NOT IN (320,500,5000);

-- -- 引数にサブクエリ
-- SELECT shohin_mei, hanbai_tanka
-- FROM   Shohin
-- WHERE  shohin_id IN (SELECT shohin_id
--                      FROM   TenpoShohin
--                      WHERE  tenpo_id = '000c');

-- -- EXISTS
-- SELECT shohin_mei, hanbai_tanka
-- FROM   Shohin AS S
-- WHERE  EXISTS (SELECT *
--                FROM   TenpoShohin AS TS
--                WHERE  TS.tenpo_id = '000C'
--                AND    TS.shohin_id = S.shohin_id);

-- -- CASE
-- SELECT shohin_mei,
--        CASE WHEN shohin_bunrui = '衣服'
--             THEN concat('A:', shohin_bunrui)
--             WHEN shohin_bunrui = '事務用品'
--             THEN concat('B:', shohin_bunrui)
--             WHEN shohin_bunrui = 'キッチン用品'
--             THEN concat('C:', shohin_bunrui)
--             ELSE NULL
--        END AS abc_shohin_bunrui
--   FROM Shohin;

-- 問題

-- 除外されたもの
-- NULL

SELECT
       SUM(CASE WHEN hanbai_tanka <= 1000
             THEN 1 ELSE 0 END) AS low_price,
       SUM(CASE WHEN hanbai_tanka > 1000 AND hanbai_tanka >= 3000
             THEN 1 ELSE 0 END) AS mid_price,
       SUM(CASE WHEN hanbai_tanka > 3000
             THEN 1 ELSE 0 END) AS high_price
FROM shohin;