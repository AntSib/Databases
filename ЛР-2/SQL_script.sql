-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema internet_sales
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema internet_sales
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `internet_sales` DEFAULT CHARACTER SET utf8 ;
USE `internet_sales` ;

-- -----------------------------------------------------
-- Table `internet_sales`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `internet_sales`.`users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `fio` VARCHAR(225) NOT NULL,
  `login` VARCHAR(225) NULL,
  `password` VARCHAR(225) NULL,
  `e_mail` VARCHAR(225) NULL,
  `type` VARCHAR(45) NULL,
  PRIMARY KEY (`id`, `fio`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  UNIQUE INDEX `login_UNIQUE` (`login` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `internet_sales`.`settings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `internet_sales`.`settings` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `host` VARCHAR(45) NULL,
  `db` VARCHAR(45) NULL,
  `user` VARCHAR(45) NULL,
  `password` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `internet_sales`.`shops`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `internet_sales`.`shops` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(225) NULL,
  `address` VARCHAR(225) NULL,
  `tel` VARCHAR(100) NULL,
  `site` VARCHAR(100) NULL,
  `email` VARCHAR(100) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `internet_sales`.`product_type`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `internet_sales`.`product_type` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(225) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `internet_sales`.`products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `internet_sales`.`products` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `shop_id` INT NOT NULL,
  `type_id` INT NOT NULL,
  `brand` VARCHAR(225) NULL,
  `model` VARCHAR(225) NULL,
  `data` TINYTEXT NULL,
  `img` VARCHAR(225) NULL,
  `price` VARCHAR(45) NULL,
  `warranty` VARCHAR(45) NULL,
  PRIMARY KEY (`id`, `shop_id`, `type_id`),
  INDEX `product_id_type_idx` (`type_id` ASC) VISIBLE,
  INDEX `shop_id_products_idx` (`shop_id` ASC) VISIBLE,
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  CONSTRAINT `shop_id_products`
    FOREIGN KEY (`shop_id`)
    REFERENCES `internet_sales`.`shops` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `product_id_type`
    FOREIGN KEY (`type_id`)
    REFERENCES `internet_sales`.`product_type` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `internet_sales`.`orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `internet_sales`.`orders` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `shop_id` INT NOT NULL,
  `product_id` INT NOT NULL,
  `fio` INT NOT NULL,
  `date` DATE NULL,
  `quantity` INT NULL,
  `tel` VARCHAR(100) NULL,
  `confirm` TINYINT NULL,
  PRIMARY KEY (`id`, `shop_id`, `product_id`, `fio`),
  INDEX `fio_idx` (`fio` ASC) VISIBLE,
  INDEX `product_id_idx` (`product_id` ASC) VISIBLE,
  INDEX `shop_id_shops_idx` (`shop_id` ASC) VISIBLE,
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  CONSTRAINT `fio`
    FOREIGN KEY (`fio`)
    REFERENCES `internet_sales`.`users` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `shop_id_shops`
    FOREIGN KEY (`shop_id`)
    REFERENCES `internet_sales`.`shops` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `id_product`
    FOREIGN KEY (`product_id`)
    REFERENCES `internet_sales`.`products` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `internet_sales`.`deliveries`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `internet_sales`.`deliveries` (
  `order_id` INT NOT NULL AUTO_INCREMENT,
  `fio` INT NOT NULL,
  `address` VARCHAR(225) NULL,
  `time` VARCHAR(225) NULL,
  `date` TIME NULL,
  `confirm` TINYINT NULL,
  PRIMARY KEY (`order_id`, `fio`),
  UNIQUE INDEX `order_id_UNIQUE` (`order_id` ASC) VISIBLE,
  INDEX `fio_id_idx` (`fio` ASC) VISIBLE,
  CONSTRAINT `fio_id`
    FOREIGN KEY (`fio`)
    REFERENCES `internet_sales`.`users` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `order_id_orders`
    FOREIGN KEY (`order_id`)
    REFERENCES `internet_sales`.`orders` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
