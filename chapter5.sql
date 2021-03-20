-- CREATE VIEW ShohinSum (shohin_bunrui, cnt_shohin)
-- AS
-- SELECT shohin_bunrui, COUNT(*)
-- FROM   Shohin
-- GROUP BY shohin_bunrui;

-- SELECT shohin_bunrui, cnt_shohin
-- FROM   ShohinSum; 

-- 多段ビュー

-- CREATE VIEW ShohinSumJim (shohin_bunrui, cnt_shohin
-- AS
-- SELECT shohin_bunrui, cnt_shohin
-- FROM    ShohinSum
-- WHERE   shohin_bunrui = '事務用品';

-- SELECT shohin_bunrui, cnt_shohin
-- FROM   ShohinSumJim;

-- CREATE VIEW ShohinJim (shohin_id, shohin_mei, shohin_bunrui, hanbai_tanka, shiire_tanka, torokubi)
-- AS
-- SELECT *
-- FROM  Shohin
-- WHERE shohin_bunrui = '事務用品';

-- -- VIEWに対して更新をかける(集約も結合もない場合)
-- INSERT INTO ShohinJim VALUES ('0009', '印鑑', '事務用品', 95, 10, '2009-11-30');

-- SELECT *
-- FROM ShohinJim

-- サブクエリ
-- SELECT shohin_bunrui, cnt_shohin
-- FROM (SELECT shohin_bunrui, COUNT(*) AS cnt_shohin
--       FROM   Shohin
--       GROUP BY shohin_bunrui) AS ShohinSum;

-- スカラサブクエリ（単一の値スカラ値を返す）
-- SELECT AVG(hanbai_tanka)
-- FROM  Shohin;

-- WHERE句内での活用例
-- SELECT shohin_id, shohin_mei, hanbai_tanka
-- FROM   Shohin
-- WHERE  hanbai_tanka > (SELECT AVG(hanbai_tanka)
--                        FROM   Shohin);
-- 

-- 相関サブクエリ
-- SELECT shohin_bunrui, shohin_mei, hanbai_tanka
-- FROM   Shohin AS S1
-- WHERE  hanbai_tanka > (SELECT AVG(hanbai_tanka)
--                        FROM Shohin AS S2
--                        WHERE S1.shohin_bunrui = S2.shohin_bunrui
--                        GROUP BY shohin_bunrui);

-- 問題
-- CREATE VIEW ViewRenshu5_1
-- AS
-- SELECT shohin_mei, hanbai_tanka, torokubi
-- FROM shohin
-- WHERE hanbai_tanka >= 1000 AND torokubi = '2009-09-20';

-- select * FROM ViewRenshu5_1

-- INSERT INTO ViewRenshu5_1 VALUES ('ナイフ', 300, '2009-11-02');
-- 値が無いカラムにデフォルト値が無いので登録できない.NOT NULL制約に引っかかる

-- SELECT * , (SELECT AVG(hanbai_tanka) FROM shohin) AS hanbai_tanka_all
-- FROM shohin;

-- CREATE VIEW AvgTankaByBunrui(shohin_id, shohin_mei, shohin_bunrui, hanbai_tanka, avg_hanbai_tanka)
-- AS
-- SELECT shohin_id, shohin_mei, shohin_bunrui, hanbai_tanka,
-- (
-- SELECT AVG(hanbai_tanka)
-- FROM shohin AS S2
-- WHERE S1.shohin_bunrui = S2.shohin_bunrui
-- GROUP BY shohin_bunrui
-- ) 
-- FROM Shohin AS S1;

-- 回答
CREATE VIEW AvgTankaByBunrui AS
SELECT shohin_id, shohin_mei, shohin_bunrui, hanbai_tanka,
(
  SELECT AVG(hanbai_tanka)
  FROM   Shohin S2
  WHERE S1.shohin_bunrui = S2.shohin_bunrui
  GROUP BY S2.shohin_bunrui
)
AS avg_hanbai_tanka
FROM Shohin S1;
