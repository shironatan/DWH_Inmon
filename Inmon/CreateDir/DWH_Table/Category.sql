CREATE TABLE `Inmon_DWH`.`Category` (
  `Category1_code` VARCHAR(45) NOT NULL,
  `Category2_code` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Category1_code`, `Category2_code`),
  INDEX `fk_Category_2_idx` (`Category2_code` ASC),
  CONSTRAINT `fk_Category_1`
    FOREIGN KEY (`Category1_code`)
    REFERENCES `Inmon_DWH`.`Category1` (`Category1_code`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Category_2`
    FOREIGN KEY (`Category2_code`)
    REFERENCES `Inmon_DWH`.`Category2` (`Category2_code`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);

