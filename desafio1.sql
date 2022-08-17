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
      plano VARCHAR(100),
      valor_plano DECIMAL(10,2) NOT NULL
  ) engine = InnoDB;
INSERT INTO SpotifyClone.plano (plano, valor_plano)
  VALUES
    ('gratuito',0.0),
    ('familiar',7.99),
    ('universitário',5.99),
    ('pessoal',6.99);

  CREATE TABLE SpotifyClone.user(
      usuario_id INT PRIMARY KEY AUTO_INCREMENT,
      nome_usuario VARCHAR(100)  NOT NULL,
      idade INT NOT NULL,
      plano_id INT NOT NULL,
      data_assinatura  DATE NOT NULL,
      FOREIGN KEY (plano_id) REFERENCES SpotifyClone.plano(plano_id)

  ) engine = InnoDB;
    INSERT INTO SpotifyClone.user(nome_usuario, idade, plano_id, data_assinatura)
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
      FOREIGN KEY (artista_id) REFERENCES SpotifyClone.artista(artista_id)
  ) engine = InnoDB;
   INSERT INTO SpotifyClone.album(album, artista_id)
  VALUES
    ('Renaissance', '1'),
    ('Jazz', '2'),
    ('Hot Space','2'),
    ('Falso Brilhante', '3'),
    ('Vento de Maio', '3'),
    ('QVVJFA?','4'),
    ('Somewhere Far Beyond','5'),
    ('I Put A Spell On You','6');
    CREATE TABLE SpotifyClone.seguindo(
      seguindo_id INT PRIMARY KEY AUTO_INCREMENT,
      usuario_id INT NOT NULL,
      artista_id INT NOT NULL,
      CONSTRAINT PRIMARY KEY (usuario_id, artista_id),
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
      usuario_id INT NOT NULL
      cancao_id INT NOT NULL
      datehorario_reproducao DATETIME NOT NULL
      CONSTRAINT PRIMARY KEY (usuario_id, cancao_id),
      FOREIGN KEY (usuario_id) REFERENCES SpotifyClone.user(usuario_id),
      FOREIGN KEY (cancao_id) REFERENCES SpotifyClone.cancao(cancao_id)
  ) engine = InnoDB;
  INSERT INTO SpotifyClone.historico_reproducao(usuario_id,cancao_id, datehorario_reproducao)
  VALUES
    ('1','6','2022-02-28 10:45:55'),
    ('1','2','2020-05-02 05:30:35'),
    ('1','8','2020-03-06 11:22:33'),