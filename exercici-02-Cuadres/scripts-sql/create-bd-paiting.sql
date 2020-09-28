-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Exercise_2_Painting
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Exercise_2_Painting` ;
USE `Exercise_2_Painting` ;

-- -----------------------------------------------------
-- Table `Buyer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Buyer` (
  `idBuyer` INT NOT NULL AUTO_INCREMENT,
  `dni` VARCHAR(45) NOT NULL,
  `firstName` VARCHAR(45) NOT NULL,
  `lastName` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idBuyer`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `dni_UNIQUE` ON `Buyer` (`dni` ASC);


-- -----------------------------------------------------
-- Table `Painting`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Painting` (
  `idPainting` INT NOT NULL AUTO_INCREMENT,
  `price` INT NOT NULL,
  `author` VARCHAR(45) NULL,
  `idBuyer` INT NULL,
  PRIMARY KEY (`idPainting`),
  CONSTRAINT `fk_Painting_Buyer`
    FOREIGN KEY (`idBuyer`)
    REFERENCES `Buyer` (`idBuyer`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Painting_Buyer_idx` ON `Painting` (`idBuyer` ASC);


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
