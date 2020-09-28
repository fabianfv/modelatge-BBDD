-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Exercise_3_Stube
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Exercise_3_Stube` ;
USE `Exercise_3_Stube` ;

-- -----------------------------------------------------
-- Table `User`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `User` (
  `idUser` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idUser`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `name_UNIQUE` ON `User` (`name` ASC);


-- -----------------------------------------------------
-- Table `Video`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Video` (
  `idVideo` VARCHAR(11) NOT NULL,
  `title` VARCHAR(250) NOT NULL,
  `description` VARCHAR(2000) NOT NULL,
  `url` VARCHAR(100) NOT NULL,
  `idUser` INT NOT NULL,
  PRIMARY KEY (`idVideo`),
  CONSTRAINT `fk_Video_User`
    FOREIGN KEY (`idUser`)
    REFERENCES `User` (`idUser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Video_User_idx` ON `Video` (`idUser` ASC);


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
