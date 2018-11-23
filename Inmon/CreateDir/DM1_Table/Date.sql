CREATE TABLE `Inmon_DM1`.`Date` (
  `Date_key` INT NOT NULL AUTO_INCREMENT,
  `Month` INT NULL,
  `Day` INT NULL,
  `Day_week` VARCHAR(45) NULL,
  `Term` VARCHAR(45) NULL,
  PRIMARY KEY (`Date_key`),
  UNIQUE INDEX `index2` (`Month` ASC, `Day` ASC));

