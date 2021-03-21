-- -- 集合演算子
-- -- UNION
-- SELECT shohin_id, shohin_mei
-- FROM   Shohin
-- UNION  ALL
-- SELECT shohin_id, shohin_mei
-- FROM   Shohin2;

-- SELECT shohin_id, shohin_mei
-- FROM   Shohin
-- EXCEPT
-- SELECT shohin_id, shohin_mei
-- FROM   Shohin2
-- ORDER BY shohin_id;

-- 結合
-- 内部結合

-- SELECT TS.tenpo_id, TS.tenpo_mei, TS.shohin_id, S.shohin_mei, S.hanbai_tanka
-- FROM   TenpoShohin AS TS INNER JOIN Shohin AS S
-- ON     TS.shohin_id = S.shohin_id;

-- -- WHERE句を使った場合
-- SELECT TS.tenpo_id, TS.tenpo_mei, TS.shohin_id, S.shohin_mei, S.hanbai_tanka
-- FROM   TenpoShohin AS TS INNER JOIN Shohin AS S
-- ON     TS.shohin_id = S.shohin_id
-- WHERE  TS.tenpo_id = '000A';

-- -- 外部結合
-- SELECT TS.tenpo_id, TS.tenpo_mei, S.shohin_id, S.shohin_mei, S.hanbai_tanka
-- FROM   TenpoShohin AS TS RIGHT OUTER JOIN Shohin AS S
-- ON     TS.shohin_id = S.shohin_id;

-- ３つ以上の結合
-- SELECT TS.tenpo_id, TS.tenpo_mei, S.shohin_id, S.shohin_mei, S.hanbai_tanka, ZS.souko_id
-- FROM   TenpoShohin AS TS INNER JOIN Shohin AS S
-- ON     TS.shohin_id = S.shohin_id
--   INNER JOIN ZaikoShohin AS ZS
--       ON TS.shohin_id = ZS.shohin_id
-- WHERE ZS.souko_id = 'S001';

-- shohinテーブルのレコードが返る

-- SELECT COALESCE(TS.tenpo_id, '不明') AS tenpo_id,
--        COALESCE(TS.tenpo_mei, '不明') AS tenpo_mei,
--        S.shohin_id,
--        S.shohin_mei,
--        S.hanbai_tanka
-- FROM   TenpoShohin TS RIGHT OUTER JOIN Shohin S
--   ON   TS.shohin_id = S.shohin_id
-- ORDER BY tenpo_id;