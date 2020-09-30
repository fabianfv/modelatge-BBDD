-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema exercise-6-opticians
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `exercise-6-opticians` ;
USE `exercise-6-opticians` ;

-- -----------------------------------------------------
-- Table `supplier`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `supplier` (
  `idSupplier` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `street` VARCHAR(45) NOT NULL,
  `number` VARCHAR(45) NOT NULL,
  `floor` VARCHAR(45) NULL,
  `door` VARCHAR(45) NULL,
  `city` VARCHAR(45) NOT NULL,
  `postalCode` VARCHAR(45) NOT NULL,
  `country` VARCHAR(45) NOT NULL,
  `phone` VARCHAR(45) NOT NULL,
  `fax` VARCHAR(45) NULL,
  `NIF` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idSupplier`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `brand`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `brand` (
  `idBrand` INT NOT NULL AUTO_INCREMENT,
  `brandName` VARCHAR(45) NOT NULL,
  `supplier_idSupplier` INT NOT NULL,
  PRIMARY KEY (`idBrand`),
  CONSTRAINT `fk_brand_supplier1`
    FOREIGN KEY (`supplier_idSupplier`)
    REFERENCES `supplier` (`idSupplier`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_brand_supplier1_idx` ON `brand` (`supplier_idSupplier` ASC);


-- -----------------------------------------------------
-- Table `glass`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `glass` (
  `idGlass` INT NOT NULL AUTO_INCREMENT,
  `gradLeft` DECIMAL(4,2) NOT NULL,
  `gradRight` DECIMAL(4,2) NOT NULL,
  `frameType` VARCHAR(45) NOT NULL,
  `colorLeft` VARCHAR(45) NOT NULL,
  `colorRight` VARCHAR(45) NOT NULL,
  `price` DECIMAL(6,2) NOT NULL,
  `brand_idBrand` INT NOT NULL,
  PRIMARY KEY (`idGlass`),
  CONSTRAINT `fk_glass_brand1`
    FOREIGN KEY (`brand_idBrand`)
    REFERENCES `brand` (`idBrand`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_glass_brand1_idx` ON `glass` (`brand_idBrand` ASC);


-- -----------------------------------------------------
-- Table `employee`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `employee` (
  `idEmployee` INT NOT NULL AUTO_INCREMENT,
  `firstName` VARCHAR(45) NOT NULL,
  `lastName` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idEmployee`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `client`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `client` (
  `idClient` INT NOT NULL AUTO_INCREMENT,
  `firstName` VARCHAR(45) NOT NULL,
  `lastName` VARCHAR(45) NOT NULL,
  `mailingAddress` VARCHAR(45) NOT NULL,
  `phoneNumber` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `regDate` DATE NOT NULL,
  `recommendedBy_idClient` INT NULL,
  PRIMARY KEY (`idClient`),
  CONSTRAINT `fk_client_client`
    FOREIGN KEY (`recommendedBy_idClient`)
    REFERENCES `client` (`idClient`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_client_client_idx` ON `client` (`recommendedBy_idClient` ASC);


-- -----------------------------------------------------
-- Table `employee_glass`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `employee_glass` (
  `idEmployee_glass` INT NOT NULL AUTO_INCREMENT,
  `idEmployee` INT NOT NULL,
  `idGlass` INT NOT NULL,
  `idClient` INT NOT NULL,
  PRIMARY KEY (`idEmployee_glass`),
  CONSTRAINT `fk_employee-glass_employee1`
    FOREIGN KEY (`idEmployee`)
    REFERENCES `employee` (`idEmployee`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_employee-glass_glass1`
    FOREIGN KEY (`idGlass`)
    REFERENCES `glass` (`idGlass`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_employee-glass_client1`
    FOREIGN KEY (`idClient`)
    REFERENCES `client` (`idClient`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_employee-glass_employee1_idx` ON `employee_glass` (`idEmployee` ASC);

CREATE INDEX `fk_employee-glass_glass1_idx` ON `employee_glass` (`idGlass` ASC);

CREATE INDEX `fk_employee-glass_client1_idx` ON `employee_glass` (`idClient` ASC);


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
