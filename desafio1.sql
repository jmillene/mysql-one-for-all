DROP DATABASE IF EXISTS SpotifyClone;

  CREATE DATABASE IF NOT EXISTS SpotifyClone;
  CREATE TABLE SpotifyClone.artista(
      artista_id INT PRIMARY KEY AUTO_INCREMENT,
      artista VARCHAR(100)
  ) engine = InnoDB;

  INSERT INTO SpotifyClone.artista(artista)
  VALUES
    ('Beyoncé'),
    ('Queen'),
    ('Elis Regina'),
    ('Baco Exu do Blues'),
    ('Blind Guardian'),
    ('Nina Simone');
  CREATE TABLE SpotifyClone.plano(
      plano_id INT PRIMARY KEY AUTO_INCREMENT,
      planos VARCHAR(100),
      valor_plano DECIMAL(10,2) NOT NULL
  ) engine = InnoDB;
INSERT INTO SpotifyClone.plano (planos, valor_plano)
  VALUES
    ('gratuito',0.0),
    ('familiar',7.99),
    ('universitário',5.99),
    ('pessoal',6.99);

  CREATE TABLE SpotifyClone.user(
      usuario_id INT PRIMARY KEY AUTO_INCREMENT,
      usuario VARCHAR(100)  NOT NULL,
      idade INT NOT NULL,
      plano_id INT NOT NULL,
      data_assinatura  DATE NOT NULL,
      FOREIGN KEY (plano_id) REFERENCES SpotifyClone.plano(plano_id)

  ) engine = InnoDB;
    INSERT INTO SpotifyClone.user(usuario, idade, plano_id, data_assinatura)
  VALUES
    ('Barbara Liskov','82','1','2019-10-20'),
    ('Robert Cecil Martin','58','1', '2017-01-06'),
    ('Ada Lovelace','37','2','2017-12-30'),
    ('Martin Fowler','46','2','2017-01-17'),
    ('Sandi Metz','58','2','2018-04-29'),
    ('Paulo Freire','19','3','2018-02-14'),
    ('Bell Hooks','26','3','2018-01-05'),
    ('Christopher Alexander','85','4','2019-06-05'),
    ('Judith Butler','45','4','2020-05-13'),
    ('Jorge Amado','58','4', '2017-02-17');
    CREATE TABLE SpotifyClone.album(
      album_id INT PRIMARY KEY AUTO_INCREMENT,
      artista_id INT NOT NULL,
      album VARCHAR(100),
      ano_lancamento YEAR NOT NULL,
      FOREIGN KEY (artista_id) REFERENCES SpotifyClone.artista(artista_id)
  ) engine = InnoDB;
   INSERT INTO SpotifyClone.album(album, artista_id,ano_lancamento)
  VALUES
    ('Renaissance', '1','2022'),
    ('Jazz', '2','1978'),
    ('Hot Space','2','1982'),
    ('Falso Brilhante', '3','1988'),
    ('Vento de Maio', '3', '2001'),
    ('QVVJFA?','4','2003'),
    ('Somewhere Far Beyond','5','2007'),
    ('I Put A Spell On You','6','2012');
    CREATE TABLE SpotifyClone.seguindo(
      usuario_id INT NOT NULL,
      artista_id INT NOT NULL,
      CONSTRAINT PRIMARY KEY(usuario_id, artista_id),
      FOREIGN KEY (usuario_id) REFERENCES SpotifyClone.user(usuario_id),
      FOREIGN KEY (artista_id) REFERENCES SpotifyClone.artista(artista_id)
  ) engine = InnoDB;
    INSERT INTO SpotifyClone.seguindo(usuario_id, artista_id)
  VALUES
    ('1','1'),
    ('1','2'),
    ('1','3'),
    ('2','1'),
    ('2','3'),
    ('3','2'),
    ('4','4'),
    ('5','5'),
    ('5','6'),
    ('6','1'),
    ('6','6'),
    ('7','6'),
    ('9','3'),
    ('10','2');
    CREATE TABLE SpotifyClone.cancao(
      cancao_id INT PRIMARY KEY AUTO_INCREMENT,
      album_id INT NOT NULL,
      cancao VARCHAR(100) NOT NULL,
      duracao_segundos INT NOT NULL,
      FOREIGN KEY (album_id) REFERENCES SpotifyClone.album(album_id)
  ) engine = InnoDB;
  INSERT INTO SpotifyClone.cancao(album_id,cancao,duracao_segundos)
  VALUES
    ('1','BREAK MY SOUL','279'),
    ('1','VIRGO’S GROOVE','369'),
    ('1','ALIEN SUPERSTAR','116'),
    ('2','Don’t Stop Me Now','203'),
    ('3','Under Pressure','152'),
    ('4','Como Nossos Pais','105'),
    ('5','O Medo de Amar é o Medo de Ser Livre','207'),
    ('6','Samba em Paris','267'),
    ('7','The Bard’s Song','244'),
    ('8','Feeling Good','100');

    CREATE TABLE SpotifyClone.historico_reproducao(
      usuario_id INT NOT NULL,
      cancao_id INT NOT NULL,
      datehorario_reproducao DATETIME NOT NULL,
      CONSTRAINT PRIMARY KEY (usuario_id, cancao_id),
      FOREIGN KEY (usuario_id) REFERENCES SpotifyClone.user(usuario_id),
      FOREIGN KEY (cancao_id) REFERENCES SpotifyClone.cancao(cancao_id)
  ) engine = InnoDB;
  INSERT INTO SpotifyClone.historico_reproducao(usuario_id,cancao_id, datehorario_reproducao)
  VALUES
    ('1','8','2022-02-28 10:45:55'),
    ('1','2','2020-05-02 05:30:35'),
    ('1','10','2020-03-06 11:22:33'),
    ('2','10','2022-08-05 08:05:17'),
    ('2','7','2020-01-02 07:40:33'),
    ('3','10','2020-11-13 16:55:13'),
    ('3','2','2020-12-05 18:38:30'),
    ('4','8','2021-08-15 17:10:10'),
    ('5','8','2022-01-09 01:44:33'),
    ('5','5','2020-08-06 15:23:43'),
    ('6','7','2017-01-24 00:31:17'),
    ('6','1','2017-10-12 12:35:20'),
    ('7','4','2012-03-17 14:56:41'),
    ('8','4','2012-03-17 14:56:41'),
    ('9','9','2022-02-24 21:14:22'),
    ('10','3','2015-12-13 08:30:22');