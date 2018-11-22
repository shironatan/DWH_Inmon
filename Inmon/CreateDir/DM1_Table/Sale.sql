CREATE TABLE `test_inmon_DM1`.`Sale` (
  `Date_key` INT NOT NULL,
  `Sale_number` VARCHAR(45) NULL,
  `Sale_number_count` INT NULL,
  PRIMARY KEY (`Date_key`),
  CONSTRAINT `fk_Sale_1`
    FOREIGN KEY (`Date_key`)
    REFERENCES `test_inmon_DM1`.`Date` (`Date_key`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);

