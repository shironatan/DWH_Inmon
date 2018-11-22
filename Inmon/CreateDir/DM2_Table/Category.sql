CREATE TABLE `test_inmon_DM2`.`Category` (
  `Category_key` INT NOT NULL AUTO_INCREMENT,
  `Category1_code` VARCHAR(45) NULL,
  `Category1_name` VARCHAR(45) NULL,
  `Category2_code` VARCHAR(45) NULL,
  `Category2_name` VARCHAR(45) NULL,
  PRIMARY KEY (`Category_key`),
  UNIQUE INDEX `index2` (`Category1_code` ASC, `Category2_code` ASC));

