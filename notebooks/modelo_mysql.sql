-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`seasons`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`seasons` (
  `id_season` INT NOT NULL AUTO_INCREMENT,
  `season` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`id_season`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`date`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`date` (
  `id_date` INT NOT NULL AUTO_INCREMENT,
  `date` DATE NOT NULL,
  `seasons_id_season` INT NOT NULL,
  PRIMARY KEY (`id_date`),
  UNIQUE INDEX `date_UNIQUE` (`date` ASC) VISIBLE,
  INDEX `fk_date_seasons1_idx` (`seasons_id_season` ASC) VISIBLE,
  CONSTRAINT `fk_date_seasons1`
    FOREIGN KEY (`seasons_id_season`)
    REFERENCES `mydb`.`seasons` (`id_season`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`locations`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`locations` (
  `id_location` INT NOT NULL AUTO_INCREMENT,
  `latitude` DECIMAL(6,4) NOT NULL,
  `longitude` DECIMAL(6,4) NOT NULL,
  `city` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_location`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`measurements`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`measurements` (
  `id_measurement` INT NOT NULL AUTO_INCREMENT,
  `precipitation_mm` DECIMAL NULL,
  `temperature_max_C` DECIMAL NULL,
  `temperature_avg_C` DECIMAL NULL,
  `temperature_min_C` DECIMAL NULL,
  `dew_point_min_C` DECIMAL NULL,
  `humidity_max_%` DECIMAL NULL,
  `humidity_avg_%` DECIMAL NULL,
  `humidity_min_%` DECIMAL NULL,
  `wind_speed_max_kph` DECIMAL NULL,
  `wind_speed_avg_kph` DECIMAL NULL,
  `wind_speed_min_kph` DECIMAL NULL,
  `pressure_max_hpa` INT NULL,
  `pressure_avg_hpa` INT NULL,
  `pressure_min_hpa` INT NULL,
  `seasons_id_season` INT NOT NULL,
  `locations_id_location` INT NOT NULL,
  `date_id_date` INT NOT NULL,
  PRIMARY KEY (`id_measurement`),
  INDEX `fk_measurements_seasons_idx` (`seasons_id_season` ASC) VISIBLE,
  INDEX `fk_measurements_locations1_idx` (`locations_id_location` ASC) VISIBLE,
  INDEX `fk_measurements_date1_idx` (`date_id_date` ASC) VISIBLE,
  CONSTRAINT `fk_measurements_seasons`
    FOREIGN KEY (`seasons_id_season`)
    REFERENCES `mydb`.`seasons` (`id_season`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_measurements_locations1`
    FOREIGN KEY (`locations_id_location`)
    REFERENCES `mydb`.`locations` (`id_location`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_measurements_date1`
    FOREIGN KEY (`date_id_date`)
    REFERENCES `mydb`.`date` (`id_date`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
