CREATE TABLE `test_inmon_DM2`.`Sale` (
  `Category_key` INT NOT NULL,
  `Official_tweet_key` INT NOT NULL,
  `Sale_number` INT NULL,
  `Sale_number_count` INT NULL,
  PRIMARY KEY (`Category_key`, `Official_tweet_key`),
  INDEX `fk_Sale_2_idx` (`Official_tweet_key` ASC),
  CONSTRAINT `fk_Sale_1`
    FOREIGN KEY (`Category_key`)
    REFERENCES `test_inmon_DM2`.`Category` (`Category_key`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Sale_2`
    FOREIGN KEY (`Official_tweet_key`)
    REFERENCES `test_inmon_DM2`.`Official_tweet` (`Official_tweet_key`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);

