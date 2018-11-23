CREATE TABLE `Inmon_DM3`.`Stories` (
  `Stories_key` INT NOT NULL AUTO_INCREMENT,
  `Stories_number` INT NULL,
  `Term_number` INT NULL,
  PRIMARY KEY (`Stories_key`),
  UNIQUE INDEX `Stories_number_UNIQUE` (`Stories_number` ASC));

