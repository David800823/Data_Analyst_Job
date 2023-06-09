-- MySQL Script generated by MySQL Workbench
-- Tue May  9 17:34:20 2023
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `mydb` ;

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`DIM_Company_Info`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`DIM_Company_Info` ;

CREATE TABLE IF NOT EXISTS `mydb`.`DIM_Company_Info` (
  `idDIM_Company_Info` INT NOT NULL,
  `companyName` VARCHAR(45) NULL,
  `companyInfo` VARCHAR(45) NULL,
  PRIMARY KEY (`idDIM_Company_Info`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`DIM_Employee_Info`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`DIM_Employee_Info` ;

CREATE TABLE IF NOT EXISTS `mydb`.`DIM_Employee_Info` (
  `idDIM_Employee_Info` INT NOT NULL,
  `jobtitle` VARCHAR(45) NULL,
  `jobfamily` VARCHAR(45) NULL,
  `level` VARCHAR(45) NULL,
  `yearOfExperience` INT NULL,
  `yearsAtCompany` INT NULL,
  `yearAtLevel` INT NULL,
  `offerDate` DATE NULL,
  `location` VARCHAR(45) NULL,
  `workArrangement` VARCHAR(45) NULL,
  `compPerspective` VARCHAR(45) NULL,
  `dmald` VARCHAR(45) NULL,
  PRIMARY KEY (`idDIM_Employee_Info`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`DIM_Employee_Salary`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`DIM_Employee_Salary` ;

CREATE TABLE IF NOT EXISTS `mydb`.`DIM_Employee_Salary` (
  `idDIM_Employee_Salaey` INT NOT NULL,
  `baseSalary` DECIMAL(2) NULL,
  `baseSalaryCurrency` DECIMAL(2) NULL,
  `totalCompensation` DECIMAL(2) NULL,
  `avgAnnualStockGrantValue` DECIMAL(2) NULL,
  `stockGrantCurrency` VARCHAR(45) NULL,
  `avgAnnualBonusValue` DECIMAL(2) NULL,
  `bonusCurrency` DECIMAL(2) NULL,
  `salesComp` DECIMAL(2) NULL,
  `negotiatedAmount` DECIMAL(2) NULL,
  `vestingSchedule` DECIMAL(2) NULL,
  PRIMARY KEY (`idDIM_Employee_Salaey`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`DIM_Foreign_Exchange`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`DIM_Foreign_Exchange` ;

CREATE TABLE IF NOT EXISTS `mydb`.`DIM_Foreign_Exchange` (
  `idDIM_Foreign_Exchange` INT NOT NULL,
  `countryID` INT NULL,
  `exchangeRate` DECIMAL NULL,
  PRIMARY KEY (`idDIM_Foreign_Exchange`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Fact_Job_Record`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Fact_Job_Record` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Fact_Job_Record` (
  `idFact_Job_Record` INT NOT NULL,
  `uuid` INT NULL,
  `DIM_Company_Info_idDIM_Company_Info` INT NOT NULL,
  `DIM_Employee_Info_idDIM_Employee_Info` INT NOT NULL,
  `DIM_Foreign_Exchange_idDIM_Foreign_Exchange` INT NOT NULL,
  `DIM_Employee_Salary_idDIM_Employee_Salaey` INT NOT NULL,
  PRIMARY KEY (`idFact_Job_Record`),
  INDEX `fk_Fact_Job_Record_DIM_Company_Info_idx` (`DIM_Company_Info_idDIM_Company_Info` ASC) VISIBLE,
  INDEX `fk_Fact_Job_Record_DIM_Employee_Info1_idx` (`DIM_Employee_Info_idDIM_Employee_Info` ASC) VISIBLE,
  INDEX `fk_Fact_Job_Record_DIM_Foreign_Exchange1_idx` (`DIM_Foreign_Exchange_idDIM_Foreign_Exchange` ASC) VISIBLE,
  INDEX `fk_Fact_Job_Record_DIM_Employee_Salary1_idx` (`DIM_Employee_Salary_idDIM_Employee_Salaey` ASC) VISIBLE,
  CONSTRAINT `fk_Fact_Job_Record_DIM_Company_Info`
    FOREIGN KEY (`DIM_Company_Info_idDIM_Company_Info`)
    REFERENCES `mydb`.`DIM_Company_Info` (`idDIM_Company_Info`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Fact_Job_Record_DIM_Employee_Info1`
    FOREIGN KEY (`DIM_Employee_Info_idDIM_Employee_Info`)
    REFERENCES `mydb`.`DIM_Employee_Info` (`idDIM_Employee_Info`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Fact_Job_Record_DIM_Foreign_Exchange1`
    FOREIGN KEY (`DIM_Foreign_Exchange_idDIM_Foreign_Exchange`)
    REFERENCES `mydb`.`DIM_Foreign_Exchange` (`idDIM_Foreign_Exchange`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Fact_Job_Record_DIM_Employee_Salary1`
    FOREIGN KEY (`DIM_Employee_Salary_idDIM_Employee_Salaey`)
    REFERENCES `mydb`.`DIM_Employee_Salary` (`idDIM_Employee_Salaey`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
