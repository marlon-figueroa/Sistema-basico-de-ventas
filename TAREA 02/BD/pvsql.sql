-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema pvsql
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `pvsql` DEFAULT CHARACTER SET utf8 ;
USE `pvsql` ;

-- -----------------------------------------------------
-- Table `pvsql`.`cuenta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pvsql`.`cuenta` (
  `idcuenta` INT(11) NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idcuenta`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `pvsql`.`administrador`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pvsql`.`administrador` (
  `idadministrador` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `telefono` INT(8) NOT NULL,
  `dui` VARCHAR(10) NOT NULL,
  `nit` VARCHAR(20) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `cuenta_idcuenta` INT(11) NOT NULL,
  PRIMARY KEY (`idadministrador`),
  INDEX `fk_administrador_cuenta1_idx` (`cuenta_idcuenta` ASC),
  CONSTRAINT `fk_administrador_cuenta1`
    FOREIGN KEY (`cuenta_idcuenta`)
    REFERENCES `pvsql`.`cuenta` (`idcuenta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `pvsql`.`cajero`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pvsql`.`cajero` (
  `idcajero` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `telefono` INT(8) NOT NULL,
  `dui` VARCHAR(20) NOT NULL,
  `nit` VARCHAR(20) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `cuenta_idcuenta` INT(11) NOT NULL,
  PRIMARY KEY (`idcajero`),
  INDEX `fk_cajero_cuenta1_idx` (`cuenta_idcuenta` ASC),
  CONSTRAINT `fk_cajero_cuenta1`
    FOREIGN KEY (`cuenta_idcuenta`)
    REFERENCES `pvsql`.`cuenta` (`idcuenta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `pvsql`.`categoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pvsql`.`categoria` (
  `idcategoria` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idcategoria`))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `pvsql`.`cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pvsql`.`cliente` (
  `idcliente` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `telefono` INT(8) NOT NULL,
  `dui` VARCHAR(20) NOT NULL,
  `nit` VARCHAR(20) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `cuenta_idcuenta` INT(11) NOT NULL,
  PRIMARY KEY (`idcliente`),
  INDEX `fk_cliente_cuenta1_idx` (`cuenta_idcuenta` ASC),
  CONSTRAINT `fk_cliente_cuenta1`
    FOREIGN KEY (`cuenta_idcuenta`)
    REFERENCES `pvsql`.`cuenta` (`idcuenta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `pvsql`.`config_precios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pvsql`.`config_precios` (
  `id_config_precios` INT(11) NOT NULL AUTO_INCREMENT,
  `margen` DOUBLE NOT NULL,
  `descuento` DOUBLE NOT NULL,
  `administrador_idadministrador` INT(11) NOT NULL,
  PRIMARY KEY (`id_config_precios`),
  INDEX `fk_config_precios_cajero1_idx` (`administrador_idadministrador` ASC),
  CONSTRAINT `fk_config_precios_administrador1`
    FOREIGN KEY (`administrador_idadministrador`)
    REFERENCES `pvsql`.`administrador` (`idadministrador`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `pvsql`.`marca`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pvsql`.`marca` (
  `idmarca` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idmarca`))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `pvsql`.`proveedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pvsql`.`proveedor` (
  `idproveedor` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `telefono` INT(8) NOT NULL,
  `dui` VARCHAR(20) NOT NULL,
  `nit` VARCHAR(20) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idproveedor`))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `pvsql`.`producto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pvsql`.`producto` (
  `idproducto` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `precio_uni` DOUBLE NOT NULL,
  `stock` INT(11) NOT NULL,
  `fecha_venci` DATE NOT NULL,
  `marca_idmarca` INT(11) NOT NULL,
  `categoria_idcategoria` INT(11) NOT NULL,
  `proveedor_idproveedor` INT(11) NOT NULL,
  PRIMARY KEY (`idproducto`),
  INDEX `fk_producto_marca1_idx` (`marca_idmarca` ASC),
  INDEX `fk_producto_categoria1_idx` (`categoria_idcategoria` ASC),
  INDEX `fk_producto_proveedor1_idx` (`proveedor_idproveedor` ASC),
  CONSTRAINT `fk_producto_categoria1`
    FOREIGN KEY (`categoria_idcategoria`)
    REFERENCES `pvsql`.`categoria` (`idcategoria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_producto_marca1`
    FOREIGN KEY (`marca_idmarca`)
    REFERENCES `pvsql`.`marca` (`idmarca`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_producto_proveedor1`
    FOREIGN KEY (`proveedor_idproveedor`)
    REFERENCES `pvsql`.`proveedor` (`idproveedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `pvsql`.`venta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pvsql`.`venta` (
  `idventa` INT(11) NOT NULL AUTO_INCREMENT,
  `fecha_venta` DATE NOT NULL,
  `cliente_idcliente` INT(11) NOT NULL,
  `cajero_idcajero` INT(11) NOT NULL,
  PRIMARY KEY (`idventa`),
  INDEX `fk_venta_cliente1_idx` (`cliente_idcliente` ASC),
  INDEX `fk_venta_cajero1_idx` (`cajero_idcajero` ASC),
  CONSTRAINT `fk_venta_cajero1`
    FOREIGN KEY (`cajero_idcajero`)
    REFERENCES `pvsql`.`cajero` (`idcajero`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_venta_cliente1`
    FOREIGN KEY (`cliente_idcliente`)
    REFERENCES `pvsql`.`cliente` (`idcliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `pvsql`.`detalleventa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pvsql`.`detalleventa` (
  `iddetalleventa` VARCHAR(10) NOT NULL,
  `cantidad` INT(11) NOT NULL,
  `precio_venta` DOUBLE NOT NULL,
  `venta_idventa` INT(11) NOT NULL,
  `producto_idproducto` INT(11) NOT NULL,
  PRIMARY KEY (`iddetalleventa`),
  INDEX `fk_detalle_venta_venta1_idx` (`venta_idventa` ASC),
  INDEX `fk_detalle_venta_producto1_idx` (`producto_idproducto` ASC),
  CONSTRAINT `fk_detalle_venta_producto1`
    FOREIGN KEY (`producto_idproducto`)
    REFERENCES `pvsql`.`producto` (`idproducto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_detalle_venta_venta1`
    FOREIGN KEY (`venta_idventa`)
    REFERENCES `pvsql`.`venta` (`idventa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
