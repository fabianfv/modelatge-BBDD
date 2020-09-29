-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema exercise-4-amazon
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `exercise-4-amazon` ;
USE `exercise-4-amazon` ;

-- -----------------------------------------------------
-- Table `book`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `book` (
  `idBook` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(100) NOT NULL,
  `description` VARCHAR(2000) NOT NULL,
  `stock` INT NOT NULL,
  `price` DECIMAL(5,2) NOT NULL,
  PRIMARY KEY (`idBook`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `author`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `author` (
  `idAuthor` INT NOT NULL AUTO_INCREMENT,
  `firstName` VARCHAR(45) NOT NULL,
  `lastName` VARCHAR(45) NOT NULL,
  `address` VARCHAR(100) NULL,
  PRIMARY KEY (`idAuthor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `user` (
  `idUser` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idUser`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `invoice`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `invoice` (
  `idInvoice` INT NOT NULL AUTO_INCREMENT,
  `invoiceNumber` VARCHAR(45) NOT NULL,
  `date` DATE NOT NULL,
  PRIMARY KEY (`idInvoice`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `author_book`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `author_book` (
  `idAuthor` INT NOT NULL,
  `idBook` INT NOT NULL,
  PRIMARY KEY (`idAuthor`, `idBook`),
  CONSTRAINT `fk_author_book_author1`
    FOREIGN KEY (`idAuthor`)
    REFERENCES `author` (`idAuthor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_author_book_book1`
    FOREIGN KEY (`idBook`)
    REFERENCES `book` (`idBook`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_author_book_book1_idx` ON `author_book` (`idBook` ASC);


-- -----------------------------------------------------
-- Table `detail`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `detail` (
  `idBook` INT NOT NULL,
  `idUser` INT NOT NULL,
  `idInvoice` INT NOT NULL,
  `amount` INT NOT NULL,
  PRIMARY KEY (`idBook`, `idUser`, `idInvoice`),
  CONSTRAINT `fk_shop_book1`
    FOREIGN KEY (`idBook`)
    REFERENCES `book` (`idBook`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_detail_user1`
    FOREIGN KEY (`idUser`)
    REFERENCES `user` (`idUser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_detail_invoice1`
    FOREIGN KEY (`idInvoice`)
    REFERENCES `invoice` (`idInvoice`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_detail_user1_idx` ON `detail` (`idUser` ASC);

CREATE INDEX `fk_detail_invoice1_idx` ON `detail` (`idInvoice` ASC);


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
