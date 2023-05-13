CREATE TABLE
    IF NOT EXISTS `db`.`Services_HTTP_IPFOLLOW` (
        `ip_id` INT unsigned NOT NULL AUTO_INCREMENT,
        `ip` VARCHAR(15) NOT NULL,
        `counter` INT DEFAULT 0 NOT NULL,
        `last_date_login` DATE NOT NULL,
        PRIMARY KEY(`ip_id`)
    );

CREATE TABLE
    IF NOT EXISTS `db`.`Service` (
        `serviceID` INT unsigned NOT NULL AUTO_INCREMENT,
        `name` VARCHAR(5) NOT NULL,
        `port` INT NOT NULL,
        `description` TEXT,
        PRIMARY KEY (`serviceID`)
    );

CREATE TABLE
    IF NOT EXISTS `db`.`Attacker` (
        `attackerID` INT unsigned NOT NULL AUTO_INCREMENT,
        `ip` VARCHAR(15) NOT NULL,
        `location` TEXT,
        KEY `idx_Attacker_ip` (`ip`) USING BTREE,
        PRIMARY KEY (`attackerID`)
    );

CREATE TABLE
    IF NOT EXISTS `db`.`Trap` (
        `trapID` INT unsigned NOT NULL AUTO_INCREMENT,
        `name` VARCHAR(30) NOT NULL,
        `serviceID` INT unsigned NOT NULL,
        `description` TEXT,
        `isActivate` TINYINT(1) NOT NULL DEFAULT 1,
        CONSTRAINT `idx_Trap_serviceID` FOREIGN KEY (`serviceID`) REFERENCES `Service` (`serviceID`),
        PRIMARY KEY (`trapID`)
    );

CREATE TABLE
    IF NOT EXISTS `db`.`Company` (
        `companyID` INT unsigned NOT NULL AUTO_INCREMENT,
        `name` VARCHAR(128) NOT NULL,
        `address` TEXT,
        `isActivate` TINYINT(1) NOT NULL DEFAULT 1,
        KEY `idx_Company_name` (`name`) USING BTREE,
        PRIMARY KEY (`companyID`)
    );

CREATE TABLE
    IF NOT EXISTS `db`.`Log` (
        `logID` INT unsigned NOT NULL AUTO_INCREMENT,
        `sessionID` VARCHAR(32) NOT NULL,
        `createAt` DATETIME NOT NULL,
        `description` TEXT,
        KEY `idx_sessionID` (`sessionID`) USING HASH,
        PRIMARY KEY (`logID`)
    );

CREATE TABLE
    IF NOT EXISTS `db`.`Report` (
        `reportID` INT unsigned NOT NULL AUTO_INCREMENT,
        `serviceID` INT unsigned NOT NULL,
        `createAt` DATETIME NOT NULL,
        `companyID` INT unsigned NOT NULL,
        `attackerID` INT unsigned NOT NULL,
        `trapID` INT unsigned NOT NULL,
        `sessionLogID` VARCHAR(32) NOT NULL,
        CONSTRAINT `idx_Report_log_sessionID` FOREIGN KEY (`sessionLogID`) REFERENCES `Log` (`sessionID`),
        CONSTRAINT `idx_Report_companyID` FOREIGN KEY (`companyID`) REFERENCES `Company` (`companyID`),
        CONSTRAINT `idx_Report_trapID` FOREIGN KEY (`trapID`) REFERENCES `Trap` (`trapID`),
        CONSTRAINT `idx_Report_serviceID` FOREIGN KEY (`serviceID`) REFERENCES `Service` (`serviceID`),
        CONSTRAINT `idx_Report_attackerID` FOREIGN KEY (`attackerID`) REFERENCES `Attacker` (`attackerID`),
        PRIMARY KEY (`reportID`)
    );

CREATE TABLE
    IF NOT EXISTS `db`.`User` (
        `userID` INT unsigned NOT NULL AUTO_INCREMENT,
        `username` VARCHAR(32) NOT NULL,
        `password` VARCHAR(64) NOT NULL,
        `fullName` VARCHAR(256) NOT NULL,
        `email` VARCHAR(256) NOT NULL,
        `phone` CHAR(15),
        `address` TEXT,
        `birthdate` DATE NOT NULL,
        `registerDate` DATETIME NOT NULL,
        `companyID` INT unsigned NOT NULL,
        `isSysAdmin` TINYINT(1) NOT NULL DEFAULT 0,
        `isCompanyAdmin` TINYINT(1) NOT NULL DEFAULT 0,
        `isActive` TINYINT(1) NOT NULL DEFAULT 1,
        KEY `idx_User_username` (`username`) USING BTREE,
        KEY `idx_User_email` (`email`) USING BTREE,
        CONSTRAINT `idx_User_companyID` FOREIGN KEY (`companyID`) REFERENCES `Company` (`companyID`),
        PRIMARY KEY (`userID`)
    );

CREATE TABLE
    IF NOT EXISTS `db`.`linking_company_service` (
        `id` INT unsigned NOT NULL AUTO_INCREMENT,
        `company_id` INT unsigned NOT NULL,
        `service_id` INT unsigned NOT NULL,
        CONSTRAINT `idx_linking_company_service_company_id` FOREIGN KEY (`company_id`) REFERENCES `Company` (`companyID`),
        CONSTRAINT `idx_linking_company_service_service_id` FOREIGN KEY (`service_id`) REFERENCES `Service` (`serviceID`),
        PRIMARY KEY (`id`)
    );