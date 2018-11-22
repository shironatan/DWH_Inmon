CREATE TABLE `test_inmon2`.`Sale` (
  `Production_code` INT NOT NULL,
  `Production_name` VARCHAR(45) NULL,
  `Month` INT NULL,
  `Day` INT NULL,
  `Category1_code` VARCHAR(45) NULL,
  `Category2_code` VARCHAR(45) NULL,
  `Stories_number` INT NULL,
  `Official_tweet` INT NULL,
  `Sale_number` INT NULL,
  PRIMARY KEY (`Production_code`),
  INDEX `fk_Sale_1_idx` (`Month` ASC, `Day` ASC),
  INDEX `fk_Sale_2_idx` (`Category1_code` ASC, `Category2_code` ASC),
  INDEX `fk_Sale_3_idx` (`Stories_number` ASC),
  INDEX `fk_Sale_4_idx` (`Official_tweet` ASC),
  CONSTRAINT `fk_Sale_1`
    FOREIGN KEY (`Month` , `Day`)
    REFERENCES `test_inmon2`.`Date` (`Month` , `Day`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Sale_2`
    FOREIGN KEY (`Category1_code` , `Category2_code`)
    REFERENCES `test_inmon2`.`Category` (`Category1_code` , `Category2_code`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Sale_3`
    FOREIGN KEY (`Stories_number`)
    REFERENCES `test_inmon2`.`Stories` (`Stories_number`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Sale_4`
    FOREIGN KEY (`Official_tweet`)
    REFERENCES `test_inmon2`.`Official_tweet` (`Official_tweet_number`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);
