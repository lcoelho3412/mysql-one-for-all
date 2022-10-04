DROP DATABASE IF EXISTS `SpotifyClone`;

CREATE DATABASE IF NOT EXISTS `SpotifyClone`;
CREATE TABLE IF NOT EXISTS `SpotifyClone`.`plan` (
  `idplan` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `plan_type` VARCHAR(45) NOT NULL,
  `plan_price` DOUBLE NOT NULL,
  PRIMARY KEY (`idplan`),
  UNIQUE INDEX `plan_type_UNIQUE` (`plan_type` ASC)
  )
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `SpotifyClone`.`play_history` (
  `idplay_history` INT NOT NULL AUTO_INCREMENT,
  `play_history` TIMESTAMP NOT NULL,
  PRIMARY KEY (`idplay_history`)
  )
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `SpotifyClone`.`plan` (
  `idplan` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `plan_type` VARCHAR(45) NOT NULL,
  `plan_price` DOUBLE NOT NULL,
  PRIMARY KEY (`idplan`),
  UNIQUE INDEX `plan_type_UNIQUE` (`plan_type` ASC)
  )
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `SpotifyClone`.`user` (
  `iduser` INT NOT NULL AUTO_INCREMENT,
  `user_name` VARCHAR(100) NOT NULL,
  `age` INT NOT NULL,
  `plan_date` DATE NULL,
  `idplan` INT NOT NULL,
  `play_history_idplay_history` INT NOT NULL,
  `plan_idplan` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`iduser`),
  INDEX `idplan_idx` (`idplan` ASC),
  INDEX `fk_user_play_history1_idx` (`play_history_idplay_history` ASC),
  INDEX `fk_user_plan1_idx` (`plan_idplan` ASC),
  CONSTRAINT `idplan`
    FOREIGN KEY (`idplan`)
    REFERENCES `SpotifyClone`.`plan` (`idplan`),
  CONSTRAINT `fk_user_play_history1`
    FOREIGN KEY (`play_history_idplay_history`)
    REFERENCES `SpotifyClone`.`play_history` (`idplay_history`),
  CONSTRAINT `fk_user_plan1`
    FOREIGN KEY (`plan_idplan`)
    REFERENCES `SpotifyClone`.`plan` (`idplan`)
    )
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `SpotifyClone`.`artists` (
  `idartists` INT NOT NULL AUTO_INCREMENT,
  `artist_name` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`idartists`)
  )
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `SpotifyClone`.`album` (
  `idalbum` INT NOT NULL AUTO_INCREMENT,
  `album_name` VARCHAR(100) NOT NULL,
  `artists_idartists` INT NOT NULL,
  PRIMARY KEY (`idalbum`),
  UNIQUE INDEX `idalbum_UNIQUE` (`idalbum` ASC),
  UNIQUE INDEX `album_name_UNIQUE` (`album_name` ASC),
  INDEX `fk_album_artists1_idx` (`artists_idartists` ASC),
  CONSTRAINT `fk_album_artists1`
    FOREIGN KEY (`artists_idartists`)
    REFERENCES `SpotifyClone`.`artists` (`idartists`)
    )
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `SpotifyClone`.`songs` (
  `idsongs` INT NOT NULL AUTO_INCREMENT,
  `song_name` VARCHAR(100) NOT NULL,
  `song_duration` TIME NOT NULL,
  `release_year` SMALLINT NOT NULL,
  `album_idalbum` INT NOT NULL,
  `play_history_idplay_history` INT NOT NULL,
  PRIMARY KEY (`idsongs`),
  INDEX `fk_songs_album1_idx` (`album_idalbum` ASC),
  INDEX `fk_songs_play_history1_idx` (`play_history_idplay_history` ASC),
  CONSTRAINT `fk_songs_album1`
    FOREIGN KEY (`album_idalbum`)
    REFERENCES `SpotifyClone`.`album` (`idalbum`),
  CONSTRAINT `fk_songs_play_history1`
    FOREIGN KEY (`play_history_idplay_history`)
    REFERENCES `SpotifyClone`.`play_history` (`idplay_history`)
    )
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `SpotifyClone`.`favorites` (
  `idfavorites` INT NOT NULL AUTO_INCREMENT,
  `iduser` INT NOT NULL,
  `idartists` INT NOT NULL,
  PRIMARY KEY (`idfavorites`),
  INDEX `iduser_idx` (`iduser` ASC),
  INDEX `idartists_idx` (`idartists` ASC),
  CONSTRAINT `iduser`
    FOREIGN KEY (`iduser`)
    REFERENCES `SpotifyClone`.`user` (`iduser`),
  CONSTRAINT `idartists`
    FOREIGN KEY (`idartists`)
    REFERENCES `SpotifyClone`.`artists` (`idartists`)
    )
ENGINE = InnoDB;

