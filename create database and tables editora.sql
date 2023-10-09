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
-- Table `mydb`.`Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Cliente` (
  `CPF` VARCHAR(11) NOT NULL,
  `nome` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`CPF`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Funcionario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Funcionario` (
  `CPF` VARCHAR(11) NOT NULL,
  `nome` VARCHAR(100) NOT NULL,
  `cargo` VARCHAR(45) NOT NULL,
  `salario` DECIMAL(7,2) NOT NULL,
  PRIMARY KEY (`CPF`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Endereco`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Endereco` (
  `idendereco` INT NOT NULL AUTO_INCREMENT,
  `UF` VARCHAR(45) NOT NULL,
  `cidade` VARCHAR(45) NOT NULL,
  `bairro` VARCHAR(45) NOT NULL,
  `logradouro` VARCHAR(45) NOT NULL,
  `numero` VARCHAR(45) NOT NULL,
  `CEP` VARCHAR(45) NOT NULL,
  `complemento` VARCHAR(45) NULL,
  `Cliente_CPF` VARCHAR(11) NULL,
  `Funcionario_CPF` VARCHAR(11) NULL,
  PRIMARY KEY (`idendereco`),
  INDEX `fk_Endereco_Cliente1_idx` (`Cliente_CPF` ASC) VISIBLE,
  INDEX `fk_Endereco_Funcionario1_idx` (`Funcionario_CPF` ASC) VISIBLE,
  CONSTRAINT `fk_Endereco_Cliente1`
    FOREIGN KEY (`Cliente_CPF`)
    REFERENCES `mydb`.`Cliente` (`CPF`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Endereco_Funcionario1`
    FOREIGN KEY (`Funcionario_CPF`)
    REFERENCES `mydb`.`Funcionario` (`CPF`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Telefone`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Telefone` (
  `idtelefone` INT NOT NULL,
  `numero` VARCHAR(9) NOT NULL,
  `Cliente_CPF` VARCHAR(11) NULL,
  `Funcionario_CPF` VARCHAR(11) NULL,
  PRIMARY KEY (`idtelefone`),
  INDEX `fk_Telefone_Cliente_idx` (`Cliente_CPF` ASC) VISIBLE,
  INDEX `fk_Telefone_Funcionario1_idx` (`Funcionario_CPF` ASC) VISIBLE,
  CONSTRAINT `fk_Telefone_Cliente`
    FOREIGN KEY (`Cliente_CPF`)
    REFERENCES `mydb`.`Cliente` (`CPF`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Telefone_Funcionario1`
    FOREIGN KEY (`Funcionario_CPF`)
    REFERENCES `mydb`.`Funcionario` (`CPF`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Livro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Livro` (
  `ISBN` VARCHAR(13) NOT NULL,
  `editora` VARCHAR(45) NOT NULL,
  `genero` VARCHAR(45) NOT NULL,
  `titulo` VARCHAR(60) NOT NULL,
  `numeroPaginas` INT NOT NULL,
  `descricao` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`ISBN`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`AreaConhecimento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`AreaConhecimento` (
  `idAreaConhecimento` INT NOT NULL AUTO_INCREMENT,
  `descricao` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`idAreaConhecimento`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`PalavraChave`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`PalavraChave` (
  `idPalavraChave` INT NOT NULL AUTO_INCREMENT,
  `descricao` VARCHAR(60) NOT NULL,
  `Livro_ISBN` VARCHAR(13) NOT NULL,
  PRIMARY KEY (`idPalavraChave`),
  INDEX `fk_PalavraChave_Livro1_idx` (`Livro_ISBN` ASC) VISIBLE,
  CONSTRAINT `fk_PalavraChave_Livro1`
    FOREIGN KEY (`Livro_ISBN`)
    REFERENCES `mydb`.`Livro` (`ISBN`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Autor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Autor` (
  `idAutor` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100) NOT NULL,
  `dataNascimento` DATETIME NOT NULL,
  `biografia` VARCHAR(150) NOT NULL,
  `nacionalidade` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idAutor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ObrasEscritas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`ObrasEscritas` (
  `Livro_ISBN` VARCHAR(13) NOT NULL,
  `Autor_idAutor` INT NOT NULL,
  PRIMARY KEY (`Livro_ISBN`, `Autor_idAutor`),
  INDEX `fk_Livro_has_Autor_Autor1_idx` (`Autor_idAutor` ASC) VISIBLE,
  INDEX `fk_Livro_has_Autor_Livro1_idx` (`Livro_ISBN` ASC) VISIBLE,
  CONSTRAINT `fk_Livro_has_Autor_Livro1`
    FOREIGN KEY (`Livro_ISBN`)
    REFERENCES `mydb`.`Livro` (`ISBN`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Livro_has_Autor_Autor1`
    FOREIGN KEY (`Autor_idAutor`)
    REFERENCES `mydb`.`Autor` (`idAutor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`AreasDoLivro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`AreasDoLivro` (
  `Livro_ISBN` VARCHAR(13) NOT NULL,
  `AreaConhecimento_idAreaConhecimento` INT NOT NULL,
  PRIMARY KEY (`Livro_ISBN`, `AreaConhecimento_idAreaConhecimento`),
  INDEX `fk_Livro_has_AreaConhecimento_AreaConhecimento1_idx` (`AreaConhecimento_idAreaConhecimento` ASC) VISIBLE,
  INDEX `fk_Livro_has_AreaConhecimento_Livro1_idx` (`Livro_ISBN` ASC) VISIBLE,
  CONSTRAINT `fk_Livro_has_AreaConhecimento_Livro1`
    FOREIGN KEY (`Livro_ISBN`)
    REFERENCES `mydb`.`Livro` (`ISBN`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Livro_has_AreaConhecimento_AreaConhecimento1`
    FOREIGN KEY (`AreaConhecimento_idAreaConhecimento`)
    REFERENCES `mydb`.`AreaConhecimento` (`idAreaConhecimento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Exemplar`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Exemplar` (
  `idExemplar` INT NOT NULL,
  `status` VARCHAR(45) NOT NULL,
  `localizacao` VARCHAR(45) NOT NULL,
  `Livro_ISBN` VARCHAR(13) NOT NULL,
  PRIMARY KEY (`idExemplar`, `Livro_ISBN`),
  INDEX `fk_Exemplar_Livro1_idx` (`Livro_ISBN` ASC) VISIBLE,
  CONSTRAINT `fk_Exemplar_Livro1`
    FOREIGN KEY (`Livro_ISBN`)
    REFERENCES `mydb`.`Livro` (`ISBN`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Pedido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Pedido` (
  `idPedido` INT NOT NULL AUTO_INCREMENT,
  `dataPedido` DATETIME NOT NULL,
  `valorPedido` DECIMAL(7,2) NOT NULL,
  `status` VARCHAR(45) NOT NULL,
  `dataPagamento` DATETIME NULL,
  `descricao` VARCHAR(60) NOT NULL,
  `quantidade` INT NOT NULL,
  `Cliente_CPF` VARCHAR(11) NOT NULL,
  `Funcionario_CPF` VARCHAR(11) NOT NULL,
  `Exemplar_idExemplar` INT NOT NULL,
  `Exemplar_Livro_ISBN` VARCHAR(13) NOT NULL,
  PRIMARY KEY (`idPedido`, `Cliente_CPF`, `Funcionario_CPF`, `Exemplar_idExemplar`, `Exemplar_Livro_ISBN`),
  INDEX `fk_Pedido_Cliente1_idx` (`Cliente_CPF` ASC) VISIBLE,
  INDEX `fk_Pedido_Funcionario1_idx` (`Funcionario_CPF` ASC) VISIBLE,
  INDEX `fk_Pedido_Exemplar1_idx` (`Exemplar_idExemplar` ASC, `Exemplar_Livro_ISBN` ASC) VISIBLE,
  CONSTRAINT `fk_Pedido_Cliente1`
    FOREIGN KEY (`Cliente_CPF`)
    REFERENCES `mydb`.`Cliente` (`CPF`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pedido_Funcionario1`
    FOREIGN KEY (`Funcionario_CPF`)
    REFERENCES `mydb`.`Funcionario` (`CPF`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pedido_Exemplar1`
    FOREIGN KEY (`Exemplar_idExemplar` , `Exemplar_Livro_ISBN`)
    REFERENCES `mydb`.`Exemplar` (`idExemplar` , `Livro_ISBN`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Venda`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Venda` (
  `idVenda` INT NOT NULL,
  `formaPagamento` VARCHAR(45) NOT NULL,
  `dataVenda` DATETIME NOT NULL,
  `desconto` DECIMAL(7,2) NULL,
  `valorTotal` DECIMAL(7,2) NOT NULL,
  `Pedido_idPedido` INT NOT NULL,
  `Pedido_Cliente_CPF` VARCHAR(11) NOT NULL,
  `Pedido_Funcionario_CPF` VARCHAR(11) NOT NULL,
  `Pedido_Exemplar_idExemplar` INT NOT NULL,
  `Pedido_Exemplar_Livro_ISBN` VARCHAR(13) NOT NULL,
  PRIMARY KEY (`idVenda`, `Pedido_idPedido`, `Pedido_Cliente_CPF`, `Pedido_Funcionario_CPF`, `Pedido_Exemplar_idExemplar`, `Pedido_Exemplar_Livro_ISBN`),
  INDEX `fk_Venda_Pedido1_idx` (`Pedido_idPedido` ASC, `Pedido_Cliente_CPF` ASC, `Pedido_Funcionario_CPF` ASC, `Pedido_Exemplar_idExemplar` ASC, `Pedido_Exemplar_Livro_ISBN` ASC) VISIBLE,
  CONSTRAINT `fk_Venda_Pedido1`
    FOREIGN KEY (`Pedido_idPedido` , `Pedido_Cliente_CPF` , `Pedido_Funcionario_CPF` , `Pedido_Exemplar_idExemplar` , `Pedido_Exemplar_Livro_ISBN`)
    REFERENCES `mydb`.`Pedido` (`idPedido` , `Cliente_CPF` , `Funcionario_CPF` , `Exemplar_idExemplar` , `Exemplar_Livro_ISBN`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
