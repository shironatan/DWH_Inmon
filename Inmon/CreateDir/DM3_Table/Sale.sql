CREATE TABLE `Inmon_DM3`.`Sale` (
  `Category_key` INT NOT NULL,
  `Stories_key` INT NOT NULL,
  `Sale_number` INT NULL,
  `Sale_number_count` INT NULL,
  PRIMARY KEY (`Category_key`, `Stories_key`),
  INDEX `fk_Sale_2_idx` (`Stories_key` ASC),
  CONSTRAINT `fk_Sale_1`
    FOREIGN KEY (`Category_key`)
    REFERENCES `Inmon_DM3`.`Category` (`Category_key`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Sale_2`
    FOREIGN KEY (`Stories_key`)
    REFERENCES `Inmon_DM3`.`Stories` (`Stories_key`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);
