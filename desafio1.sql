DROP DATABASE IF EXISTS SpotifyClone;
CREATE SCHEMA IF NOT EXISTS `SpotifyClone`;
USE `SpotifyClone` ;

CREATE TABLE IF NOT EXISTS `SpotifyClone`.`plan` (
  `idplan` INT NOT NULL AUTO_INCREMENT,
  `plan_type` VARCHAR(45) NOT NULL,
  `plan_price` DECIMAL(3,2) NOT NULL,
  PRIMARY KEY (`idplan`)
)
ENGINE = InnoDB;

INSERT INTO SpotifyClone.plan (plan_type, plan_price)
VALUES
  ('gratuito', '0.00'),
  ('familiar', '7.99'),
  ('universitário', '5.99'),
  ('pessoal', '6.99');
  
CREATE TABLE IF NOT EXISTS `SpotifyClone`.`user` (
  `iduser` INT NOT NULL AUTO_INCREMENT,
  `user_name` VARCHAR(100) NOT NULL,
  `age` INT NOT NULL,
  `plan_date` DATE NULL,
  `idplan` INT NOT NULL,
  PRIMARY KEY (`iduser`),
  CONSTRAINT `idplan`
    FOREIGN KEY (`idplan`)
    REFERENCES `SpotifyClone`.`plan` (`idplan`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

INSERT INTO SpotifyClone.user (user_name, age, plan_date, idplan)
VALUES
    ('Barbara Liskov', 82, '2019-10-20', 1),
    ('Robert Cecil Martin', 58, '2017-01-06', 1),
    ('Ada Lovelace', 37, '2017-12-30', 2),
    ('Martin Fowler', 46, '2017-01-17', 2),
    ('Sandi Metz', 58, '2018-04-29', 2),
    ('Paulo Freire', 19, '2018-02-14', 3),
    ('Bell Hooks', 26, '2018-01-05', 3),
    ('Christopher Alexander', 85, '2019-06-05', 4),
    ('Judith Butler', 45, '2020-05-13', 4),
    ('Jorge Amado', 58, '2017-02-17', 4);
    
CREATE TABLE IF NOT EXISTS `SpotifyClone`.`artists` (
  `idartists` INT NOT NULL AUTO_INCREMENT,
  `artist_name` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`idartists`))
ENGINE = InnoDB;

INSERT INTO `SpotifyClone`.`artists` (artist_name)
  VALUES
    ('Beyoncé'),
    ('Queen'),
    ('Elis Regina'),
    ('Baco Exu do Blues'),
    ('Blind Guardian'),
    ('Nina Simone');

CREATE TABLE IF NOT EXISTS `SpotifyClone`.`album` (
  `idalbum` INT NOT NULL AUTO_INCREMENT,
  `album_name` VARCHAR(100) NOT NULL,
  `release_year` YEAR NOT NULL,
  `idartists` INT NOT NULL,
  PRIMARY KEY (`idalbum`),
  CONSTRAINT `idartists`
    FOREIGN KEY (`idartists`)
    REFERENCES `SpotifyClone`.`artists` (`idartists`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

INSERT INTO SpotifyClone.album (album_name, release_year, idartists)
  VALUES
    ('Renaissance', '2022', '1'),
    ('Jazz', '1978', '2'),
    ('Hot Space', '1982', '2'),
	('Falso Brilhante', '1998', '3'),
    ('Vento de Maio', '2001', '3'),
    ('QVVJFA?', '2003', '4'),
    ('Somewhere Far Beyond', '2007', '5'),
    ('I Put A Spell On You', '2012', '6');

CREATE TABLE IF NOT EXISTS `SpotifyClone`.`songs` (
  `idsongs` INT NOT NULL AUTO_INCREMENT,
  `song_name` VARCHAR(100) NOT NULL,
  `song_duration` INT NOT NULL,
  `album_idalbum` INT NOT NULL,
  PRIMARY KEY (`idsongs`),
  CONSTRAINT `idalbum`
    FOREIGN KEY (`album_idalbum`)
    REFERENCES `SpotifyClone`.`album` (`idalbum`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

INSERT INTO SpotifyClone.songs (song_name, song_duration, album_idalbum)
  VALUES
	('BREAK MY SOUL', '279', '1'),
    ('VIRGO’S GROOVE', '369', '1'),
    ('ALIEN SUPERSTAR', '116', '1'),
    ('Don’t Stop Me Now', '203', '2'),
    ('Under Pressure', '152', '3'),
    ('Como Nossos Pais', '105', '4'),
    ('O Medo de Amar é o Medo de Ser Livre', '207', '5'),
    ('Samba em Paris', '267', '6'),
    ('The Bard’s Song', '244', '7'),
    ('Feeling Good', '100', '8');


CREATE TABLE IF NOT EXISTS `SpotifyClone`.`favorites`(
    `iduser` INT NOT NULL,
    `idartists` INT NOT NULL,
    PRIMARY KEY (iduser, idartists),
    FOREIGN KEY (`iduser`) REFERENCES `SpotifyClone`.`user`(`iduser`),
    FOREIGN KEY (`idartists`) REFERENCES `SpotifyClone`.`artists`(`idartists`)
  ) engine = InnoDB;

INSERT INTO SpotifyClone.favorites (iduser, idartists)
  VALUES
    (1, 1),
    (1, 2),
    (1, 3),
    (2, 1),
    (2, 3),
    (3, 2),
    (4, 4),
    (5, 5),
    (5, 6),
    (6, 6),
    (6, 1),
    (7, 6),
    (9, 3),
    (10, 2);

CREATE TABLE IF NOT EXISTS `SpotifyClone`.`play_history`(
    `iduser` INT NOT NULL,
    `idsongs` INT NOT NULL,
    `play_history` DATETIME NOT NULL,
    PRIMARY KEY (iduser, idsongs),
    FOREIGN KEY (`iduser`) REFERENCES `SpotifyClone`.`user` (`iduser`),
    FOREIGN KEY (`idsongs`) REFERENCES `SpotifyClone`.`songs` (`idsongs`)
  ) engine = InnoDB;

INSERT INTO SpotifyClone.play_history (iduser, idsongs, play_history)
  VALUES

  ('1', '8', '2022-02-28 10:45:55'),
  ('1' ,'2', '2020-05-02 05:30:35'),
  ('1', '10', '2020-03-06 11:22:33'),
  ('2', '10', '2022-08-05 08:05:17'),
  ('2', '7', '2020-01-02 07:40:33'),
  ('3', '10', '2020-11-13 16:55:13'),
  ('3', '2', '2020-12-05 18:38:30'),
  ('4', '8', '2021-08-15 17:10:10'),
  ('5', '8', '2022-01-09 01:44:33'),
  ('5', '5', '2020-08-06 15:23:43'),
  ('6', '7', '2017-01-24 00:31:17'),
  ('6', '1', '2017-10-12 12:35:20'),
  ('7', '4', '2011-12-15 22:30:49'),
  ('8', '4', '2012-03-17 14:56:41'),
  ('9', '9', '2022-02-24 21:14:22'),
  ('10', '3', '2015-12-13 08:30:22');
