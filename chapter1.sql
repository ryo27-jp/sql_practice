CREATE TABLE Jyushoroku
  ( toroku_bango INTEGER NOT NULL,
    namae VARCHAR(128) NOT NULL,
    jyusho VARCHAR(256) NOT NULL,
    tel_no CHAR(10),
    mail_adress CHAR(20),

    PRIMARY KEY(toroku_bango)
  );


  ALTER TABLE Jyushoroku ADD COLUMN yubin_bango CHAR(8) NOT NULL;

  -- DROP TABLE Jyushoroku;