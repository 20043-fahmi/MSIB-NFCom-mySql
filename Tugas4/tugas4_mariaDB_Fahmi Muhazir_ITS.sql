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
-- Table `mydb`.`Montir`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Montir` (
  `idMontir` INT NOT NULL,
  `M_Nama` VARCHAR(45) NULL,
  `M_Alamat` VARCHAR(45) NULL,
  `M_Kontak` VARCHAR(45) NULL,
  PRIMARY KEY (`idMontir`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Staff`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Staff` (
  `idStaff` INT NOT NULL,
  `S_Nama` VARCHAR(45) NULL,
  `S_Alamat` VARCHAR(45) NULL,
  `S_Kontak` VARCHAR(45) NULL,
  PRIMARY KEY (`idStaff`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Onderdil`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Onderdil` (
  `idOnderdil` INT NOT NULL,
  `O_Tipe` VARCHAR(45) NULL,
  `O_Harga` VARCHAR(45) NULL,
  PRIMARY KEY (`idOnderdil`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Pelanggan`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Pelanggan` (
  `idPelanggan` INT NOT NULL,
  `P_Nama` VARCHAR(45) NULL,
  `P_Alamat` VARCHAR(45) NULL,
  `P_Kontak` VARCHAR(45) NULL,
  PRIMARY KEY (`idPelanggan`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Resi`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Resi` (
  `idResi` INT NOT NULL,
  `R_Perbaikan` VARCHAR(45) NULL,
  `R_PembelianOnderdil` VARCHAR(45) NULL,
  `R_TanggalService` VARCHAR(45) NULL,
  `Pelanggan_idPelanggan` INT NOT NULL,
  `Montir_idMontir` INT NOT NULL,
  `Onderdil_idOnderdil` INT NOT NULL,
  `Staff_idStaff` INT NOT NULL,
  PRIMARY KEY (`idResi`, `Pelanggan_idPelanggan`, `Montir_idMontir`, `Onderdil_idOnderdil`, `Staff_idStaff`),
  INDEX `fk_Resi_Pelanggan_idx` (`Pelanggan_idPelanggan` ASC),
  INDEX `fk_Resi_Montir1_idx` (`Montir_idMontir` ASC) VISIBLE,
  INDEX `fk_Resi_Onderdil1_idx` (`Onderdil_idOnderdil` ASC),
  INDEX `fk_Resi_Staff1_idx` (`Staff_idStaff` ASC),
  CONSTRAINT `fk_Resi_Pelanggan`
    FOREIGN KEY (`Pelanggan_idPelanggan`)
    REFERENCES `mydb`.`Pelanggan` (`idPelanggan`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Resi_Montir1`
    FOREIGN KEY (`Montir_idMontir`)
    REFERENCES `mydb`.`Montir` (`idMontir`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Resi_Onderdil1`
    FOREIGN KEY (`Onderdil_idOnderdil`)
    REFERENCES `mydb`.`Onderdil` (`idOnderdil`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Resi_Staff1`
    FOREIGN KEY (`Staff_idStaff`)
    REFERENCES `mydb`.`Staff` (`idStaff`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
