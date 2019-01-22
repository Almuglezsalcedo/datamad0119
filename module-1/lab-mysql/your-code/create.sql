SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`salesperson`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`salesperson` (
  `salesperson_id` INT NOT NULL AUTO_INCREMENT,
  `salesperson_name` VARCHAR(45) NULL,
  `store` VARCHAR(45) NULL,
  PRIMARY KEY (`salesperson_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`invoice`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`invoice` (
  `invoice_number` INT NOT NULL,
  `invoice_date` DATE NULL,
  `salesperson_salesperson_id` INT NOT NULL,
  PRIMARY KEY (`invoice_number`),
  UNIQUE INDEX `invoice_date_UNIQUE` (`invoice_date` ASC),
  INDEX `fk_invoice_salesperson1_idx` (`salesperson_salesperson_id` ASC),
  CONSTRAINT `fk_invoice_salesperson1`
    FOREIGN KEY (`salesperson_salesperson_id`)
    REFERENCES `mydb`.`salesperson` (`salesperson_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`customer` (
  `customer_id` INT NOT NULL AUTO_INCREMENT,
  `customer_name` VARCHAR(45) NULL,
  `phone_number` INT NULL,
  `email` VARCHAR(45) NULL,
  `address` VARCHAR(45) NULL,
  `city` VARCHAR(45) NULL,
  `state/province` VARCHAR(45) NULL,
  `country` VARCHAR(45) NULL,
  `zip/postal` INT NULL,
  `salesperson_salesperson_id` INT NOT NULL,
  PRIMARY KEY (`customer_id`),
  INDEX `fk_customer_salesperson1_idx` (`salesperson_salesperson_id` ASC),
  CONSTRAINT `fk_customer_salesperson1`
    FOREIGN KEY (`salesperson_salesperson_id`)
    REFERENCES `mydb`.`salesperson` (`salesperson_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`cars`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`cars` (
  `vin` INT NOT NULL AUTO_INCREMENT,
  `manufacturer` VARCHAR(45) NULL,
  `model` VARCHAR(45) NULL,
  `car_year` INT NULL,
  `color` VARCHAR(45) NULL,
  `invoice_invoice_number` INT NOT NULL,
  `customer_customer_id` INT NOT NULL,
  PRIMARY KEY (`vin`),
  INDEX `fk_cars_invoice_idx` (`invoice_invoice_number` ASC),
  INDEX `fk_cars_customer1_idx` (`customer_customer_id` ASC),
  CONSTRAINT `fk_cars_invoice`
    FOREIGN KEY (`invoice_invoice_number`)
    REFERENCES `mydb`.`invoice` (`invoice_number`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_cars_customer1`
    FOREIGN KEY (`customer_customer_id`)
    REFERENCES `mydb`.`customer` (`customer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
