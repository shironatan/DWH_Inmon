CREATE TABLE `Inmon_DM2`.`Official_tweet` (
  `Official_tweet_key` INT NOT NULL AUTO_INCREMENT,
  `Official_tweet_number` VARCHAR(45) NULL,
  `Tweet` VARCHAR(45) NULL,
  PRIMARY KEY (`Official_tweet_key`),
  UNIQUE INDEX `Official_tweet_number_UNIQUE` (`Official_tweet_number` ASC));

