-- CREATE TABLE ShohinIns
-- (shohin_id    CHAR(4)   NOT NULL,
--  shohin_mei   VARCHAR(100) NOT NULL,
--  shohin_bunrui VARCHAR(32) NOT NULL,
--  hanbai_tanka INTEGER DEFAULT 0,
--  shiire_tanka INTEGER,
--  torokubi     DATE,
--  PRIMARY KEY (shohin_id));

--  CREATE TABLE ShohinCopy
-- (shohin_id    CHAR(4)   NOT NULL,
--  shohin_mei   VARCHAR(100) NOT NULL,
--  shohin_bunrui VARCHAR(32) NOT NULL,
--  hanbai_tanka INTEGER,
--  shiire_tanka INTEGER,
--  torokubi     DATE,
--  PRIMARY KEY (shohin_id));

--  INSERT INTO ShohinCopy (shohin_id, shohin_mei, shohin_bunrui, hanbai_tanka, shiire_tanka, torokubi)
--  SELECT shohin_id, shohin_mei, shohin_bunrui, hanbai_tanka, shiire_tanka, torokubi FROM Shohin;

--  CREATE TABLE ShohinBunrui
-- (
--  shohin_bunrui VARCHAR(32) NOT NULL,
--  sum_hanbai_tanka INTEGER,
--  sum_shiire_tanka INTEGER,
--  PRIMARY KEY (shohin_bunrui));

-- INSERT INTO ShohinBunrui (shohin_bunrui, sum_hanbai_tanka, sum_shiire_tanka)
-- SELECT      shohin_bunrui, SUM(hanbai_tanka), SUM(shiire_tanka)
-- FROM        Shohin
-- GROUP BY shohin_bunrui;

-- START TRANSACTION;

--   UPDATE Shohin
--   SET    hanbai_tanka = hanbai_tanka - 1000
--   WHERE  shohin_mei = 'カッターシャツ';

--   UPDATE Shohin
--   SET    hanbai_tanka = hanbai_tanka + 1000
--   WHERE  shohin_mei = 'Tシャツ';

-- COMMIT;

-- COMMITされてないから何もない

-- PRIMARY KEYがあるので実行できない

-- INSERT INTO Shohin
-- VALUES ('001', 'Tシャツ', '衣服', 1000, 500, '2008-09-20');

-- INSERT INTO Shohin
-- VALUES ('002', '穴あけパンチ', '事務用品', 500, 320, '2009-09-11');
-- INSERT INTO Shohin
-- VALUES ('003', 'カッターシャツ', '衣服', 4000, 2800, NULL);

--  CREATE TABLE ShohinSaeki
-- (
--   shohin_id       CHAR(4)      NOT NULL,
--   shohin_mei      VARCHAR(100) NOT NULL,
--   hanbai_tanka    INTEGER,
--   shiire_tanka    INTEGER,
--   saeki           INTEGER,
--  PRIMARY KEY (shohin_id)
--  );

-- INSERT INTO ShohinSaeki 
-- (shohin_id, shohin_mei, hanbai_tanka, shiire_tanka, saeki)
-- SELECT
-- shohin_id, shohin_mei, hanbai_tanka, shiire_tanka, hanbai_tanka - shiire_tanka
-- FROM
-- Shohin; 

START TRANSACTION;

UPDATE ShohinSaeki
SET hanbai_tanka = 3000
WHERE shohin_id = '003';

UPDATE ShohinSaeki
SET saeki = hanbai_tanka - shiire_tanka
WHERE shohin_id = '003';

COMMIT;
