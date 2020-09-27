-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Exercise_1_Vueling
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Exercise_1_Vueling` ;
USE `Exercise_1_Vueling` ;

-- -----------------------------------------------------
-- Table `Plane`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Plane` (
  `idPlane` INT NOT NULL AUTO_INCREMENT,
  `capacity` INT NOT NULL,
  `model` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idPlane`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Seat`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Seat` (
  `idSeat` INT NOT NULL,
  `idPlane` INT NOT NULL,
  PRIMARY KEY (`idSeat`, `idPlane`),
  CONSTRAINT `fk_Seat_Plane`
    FOREIGN KEY (`idPlane`)
    REFERENCES `Plane` (`idPlane`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

CREATE INDEX `fk_Seat_Plane_idx` ON `Seat` (`idPlane` ASC);


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
