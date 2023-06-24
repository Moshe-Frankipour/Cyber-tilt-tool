/* Create Company */

INSERT INTO
    `db`.`Company` (
        `companyID`,
        `name`,
        `address`,
        `isActivate`
    )
SELECT 1, 'System', 'IL', 1
WHERE NOT EXISTS (
        SELECT *
        FROM `db`.`Company`
        WHERE
            `name` = 'System'
    );

INSERT INTO
    `db`.`Company` (
        `companyID`,
        `name`,
        `address`,
        `isActivate`
    )
SELECT 2, 'Intel', 'IL', 1
WHERE NOT EXISTS (
        SELECT *
        FROM `db`.`Company`
        WHERE `name` = 'Intel'
    );

INSERT INTO
    `db`.`Company` (
        `companyID`,
        `name`,
        `address`,
        `isActivate`
    )
SELECT 3, 'Apple', 'IL', 1
WHERE NOT EXISTS (
        SELECT *
        FROM `db`.`Company`
        WHERE `name` = 'Apple'
    );

/* Create User */

/* Administrator */

INSERT INTO
    `db`.`User` (
        `userID`,
        `password`,
        `fullName`,
        `email`,
        `phone`,
        `birthdate`,
        `registerDate`,
        `isSysAdmin`,
        `isCompanyAdmin`,
        `isActive`,
        `companyID`
    )
SELECT
    1,
    '$2b$12$bnaCG6/wApivYZpfTrLm4O5YyRqKZSjla1WxJH2mknKHaWfXuESqi',
    'Administrator',
    'admin@admin.com',
    '050000000',
    '2021-01-27',
    '2023-01-27',
    1,
    0,
    1,
    1
WHERE NOT EXISTS (
        SELECT *
        FROM `db`.`User`
        WHERE
            email = 'admin@admin.com'
    );

/* User INTEL */

INSERT INTO
    `db`.`User` (
        `userID`,
        `password`,
        `fullName`,
        `email`,
        `phone`,
        `birthdate`,
        `registerDate`,
        `isSysAdmin`,
        `isCompanyAdmin`,
        `isActive`,
        `companyID`
    )
SELECT
    2,
    '$2b$12$bnaCG6/wApivYZpfTrLm4O5YyRqKZSjla1WxJH2mknKHaWfXuESqi',
    'User1, Intel',
    'user1@intel.com',
    '050099000',
    '2021-01-27',
    '2023-01-27',
    0,
    0,
    1,
    2
WHERE NOT EXISTS (
        SELECT *
        FROM `db`.`User`
        WHERE
            email = 'user1@intel.com'
    );

/* User Admin INTEL */

INSERT INTO
    `db`.`User` (
        `userID`,
        `password`,
        `fullName`,
        `email`,
        `phone`,
        `birthdate`,
        `registerDate`,
        `isSysAdmin`,
        `isCompanyAdmin`,
        `isActive`,
        `companyID`
    )
SELECT
    3,
    '$2b$12$bnaCG6/wApivYZpfTrLm4O5YyRqKZSjla1WxJH2mknKHaWfXuESqi',
    'Admin1, Intel',
    'admin1@intel.com',
    '050699000',
    '2021-01-27',
    '2023-01-27',
    0,
    1,
    1,
    2
WHERE NOT EXISTS (
        SELECT *
        FROM `db`.`User`
        WHERE
            email = 'admin1@intel.com'
    );

/* User Apple */

INSERT INTO
    `db`.`User` (
        `userID`,
        `password`,
        `fullName`,
        `email`,
        `phone`,
        `birthdate`,
        `registerDate`,
        `isSysAdmin`,
        `isCompanyAdmin`,
        `isActive`,
        `companyID`
    )
SELECT
    4,
    '$2b$12$bnaCG6/wApivYZpfTrLm4O5YyRqKZSjla1WxJH2mknKHaWfXuESqi',
    'User1, Apple',
    'user1@apple.com',
    '050099000',
    '2021-01-27',
    '2023-01-27',
    0,
    0,
    1,
    3
WHERE NOT EXISTS (
        SELECT *
        FROM `db`.`User`
        WHERE
            email = 'user1@apple.com'
    );

/* User Admin Apple */

INSERT INTO
    `db`.`User` (
        `userID`,
        `password`,
        `fullName`,
        `email`,
        `phone`,
        `birthdate`,
        `registerDate`,
        `isSysAdmin`,
        `isCompanyAdmin`,
        `isActive`,
        `companyID`
    )
SELECT
    5,
    '$2b$12$bnaCG6/wApivYZpfTrLm4O5YyRqKZSjla1WxJH2mknKHaWfXuESqi',
    'Admin1, Apple',
    'admin1@apple.com',
    '059099001',
    '2021-01-27',
    '2023-01-27',
    0,
    1,
    1,
    3
WHERE NOT EXISTS (
        SELECT *
        FROM `db`.`User`
        WHERE
            email = 'admin1@apple.com'
    );

/* Service */

/* FTP */

INSERT INTO
    `db`.`Service` (
        `serviceID`,
        `name`,
        `description`
    )
SELECT
    2,
    'FTP',
    'The File Transfer Protocol (FTP) is a standard communication protocol used for the transfer of computer files from a server to a client on a computer network. FTP is built on a client server model architecture using separate control and data connections between the client and the server.'
WHERE NOT EXISTS (
        SELECT *
        FROM `db`.`Service`
        WHERE `name` = 'FTP'
    );

/* SMTP */

INSERT INTO
    `db`.`Service` (
        `serviceID`,
        `name`,
        `description`
    )
SELECT
    4,
    'SMTP',
    'The Simple Mail Transfer Protocol (SMTP) is an Internet standard communication protocol for electronic mail transmission. Mail servers and other message transfer agents use SMTP to send and receive mail messages.'
WHERE NOT EXISTS (
        SELECT *
        FROM `db`.`Service`
        WHERE `name` = 'SMTP'
    );

/* HTTP */

INSERT INTO
    `db`.`Service` (
        `serviceID`,
        `name`,
        `description`
    )
SELECT
    1,
    'HTTP',
    'The Hypertext Transfer Protocol (HTTP) is an application layer protocol in the Internet protocol suite model for distributed, collaborative, hypermedia information systems.[1] HTTP is the foundation of data communication for the World Wide Web, where hypertext documents include hyperlinks to other resources that the user can easily access, for example by a mouse click or by tapping the screen in a web browser.'
WHERE NOT EXISTS (
        SELECT *
        FROM `db`.`Service`
        WHERE `name` = 'HTTP'
    );

/* SSH */

INSERT INTO
    `db`.`Service` (
        `serviceID`,
        `name`,
        `description`
    )
SELECT
    3,
    'SSH',
    'The Secure Shell Protocol (SSH) is a cryptographic network protocol for operating network services securely over an unsecured network.[1] Its most notable applications are remote login and command-line execution.'
WHERE NOT EXISTS (
        SELECT *
        FROM `db`.`Service`
        WHERE `name` = 'SSH'
    );

/* link Companies Services  */

/* FTP_Intel */

INSERT INTO
    `db`.`Companies_Services` (
        `ID`,
        `name`,
        `port`,
        `companyID`,
        `serviceID`
    )
SELECT
    1,
    'FTP_Intel',
    2121,
    2,
    2
WHERE NOT EXISTS (
        SELECT *
        FROM
            `db`.`Companies_Services`
        WHERE
            `name` = 'FTP_Intel'
    );

/* FTP_Apple */

INSERT INTO
    `db`.`Companies_Services` (
        `ID`,
        `name`,
        `port`,
        `companyID`,
        `serviceID`
    )
SELECT
    2,
    'FTP_Apple',
    2122,
    3,
    2
WHERE NOT EXISTS (
        SELECT *
        FROM
            `db`.`Companies_Services`
        WHERE
            `name` = 'FTP_Apple'
    );

/* SMTP_Intel */

INSERT INTO
    `db`.`Companies_Services` (
        `ID`,
        `name`,
        `port`,
        `companyID`,
        `serviceID`
    )
SELECT
    3,
    'SMTP_Intel',
    2525,
    2,
    4
WHERE NOT EXISTS (
        SELECT *
        FROM
            `db`.`Companies_Services`
        WHERE
            `name` = 'SMTP_Intel'
    );

/* SMTP_Intel */

INSERT INTO
    `db`.`Companies_Services` (
        `ID`,
        `name`,
        `port`,
        `companyID`,
        `serviceID`
    )
SELECT
    3,
    'SMTP_Intel',
    2525,
    2,
    4
WHERE NOT EXISTS (
        SELECT *
        FROM
            `db`.`Companies_Services`
        WHERE
            `name` = 'SMTP_Intel'
    );

/* HTTP_Apple */

INSERT INTO
    `db`.`Companies_Services` (
        `ID`,
        `name`,
        `port`,
        `companyID`,
        `serviceID`
    )
SELECT
    4,
    'HTTP_Apple',
    8080,
    3,
    1
WHERE NOT EXISTS (
        SELECT *
        FROM
            `db`.`Companies_Services`
        WHERE
            `name` = 'HTTP_Apple'
    );

/* SSH_Intel */

INSERT INTO
    `db`.`Companies_Services` (
        `ID`,
        `name`,
        `port`,
        `companyID`,
        `serviceID`
    )
SELECT
    5,
    'SSH_Intel',
    2222,
    2,
    3
WHERE NOT EXISTS (
        SELECT *
        FROM
            `db`.`Companies_Services`
        WHERE
            `name` = 'SSH_Intel'
    );

/* Create Traps  */

/* Fake User - HTTP */

/*
 "admin": "admin",
 "dev"": ""fullaccess",
 "administrator": "P@sw0rd"
 */

INSERT INTO
    `db`.`Trap` (
        `trapID`,
        `name`,
        `serviceID`,
        `description`,
        `isActivate`
    )
SELECT
    1,
    'Fake User',
    1,
    'We will hide the username and password of an admin user in a way that is easy for a hacker to reach',
    1
WHERE NOT EXISTS (
        SELECT *
        FROM `db`.`Trap`
        WHERE
            `name` = 'Fake User'
            and `serviceID` = 1
    );

/* SQL Injection - HTTP */

/*
 " or ""="',
 ';',
 'OR 1=1'
 */

INSERT INTO
    `db`.`Trap` (
        `trapID`,
        `name`,
        `serviceID`,
        `description`,
        `isActivate`
    )
SELECT
    2,
    'SQL Injection',
    1,
    'If a user enters one of the forbidden characters, we will know that he wants to break into our system and we will direct him to an alternative site.',
    1
WHERE NOT EXISTS (
        SELECT *
        FROM `db`.`Trap`
        WHERE
            `name` = 'SQL Injection'
            and `serviceID` = 1
    );

/* Hide User Admin - HTTP */

/*
 administrator P@sw0rd
 dev fullaccess
 */

INSERT INTO
    `db`.`Trap` (
        `trapID`,
        `name`,
        `serviceID`,
        `description`,
        `isActivate`
    )
SELECT
    3,
    'Hide User Admin',
    1,
    'We will hide the username and password of an admin user in a way that is easy for a hacker to reach.',
    1
WHERE NOT EXISTS (
        SELECT *
        FROM `db`.`Trap`
        WHERE
            `name` = 'Hide User Admin'
            and `serviceID` = 1
    );

/* Fake User - FTP */

/*
 root toor 
 user 123456
 */

INSERT INTO
    `db`.`Trap` (
        `trapID`,
        `name`,
        `serviceID`,
        `description`,
        `isActivate`
    )
SELECT
    4,
    'Fake User',
    2,
    'We will hide the username and password of an admin user in a way that is easy for a hacker to reach.',
    1
WHERE NOT EXISTS (
        SELECT *
        FROM `db`.`Trap`
        WHERE
            `name` = 'Fake User'
            and `serviceID` = 2
    );

/* Hide User Admin - FTP */

/*
 Administrator admin
 */

INSERT INTO
    `db`.`Trap` (
        `trapID`,
        `name`,
        `serviceID`,
        `description`,
        `isActivate`
    )
SELECT
    5,
    'Hide User Admin',
    2,
    'We will hide the username and password of an admin user in a way that is easy for a hacker to reach.',
    1
WHERE NOT EXISTS (
        SELECT *
        FROM `db`.`Trap`
        WHERE
            `name` = 'Hide User Admin'
            and `serviceID` = 2
    );

/* Fake User - SSH */

/*
 "admin": "admin",
 "root" : "toor",
 "seed" : "dees"
 */

INSERT INTO
    `db`.`Trap` (
        `trapID`,
        `name`,
        `serviceID`,
        `description`,
        `isActivate`
    )
SELECT
    6,
    'Fake User',
    3,
    'We will hide the username and password of an admin user in a way that is easy for a hacker to reach.',
    1
WHERE NOT EXISTS (
        SELECT *
        FROM `db`.`Trap`
        WHERE
            `name` = 'Fake User'
            and `serviceID` = 3
    );

/* Hide User Admin - SSH */

/*
 sudo: fullaccess
 administrator: P@sw0rd
 */

INSERT INTO
    `db`.`Trap` (
        `trapID`,
        `name`,
        `serviceID`,
        `description`,
        `isActivate`
    )
SELECT
    7,
    'Hide User Admin',
    3,
    'We will hide the username and password of an admin user in a way that is easy for a hacker to reach.',
    1
WHERE NOT EXISTS (
        SELECT *
        FROM `db`.`Trap`
        WHERE
            `name` = 'Hide User Admin'
            and `serviceID` = 3
    );

/* Hide User Admin - SMTP */

/*
 "admin": "admin",
 "dev": "fullaccess",
 "administrator": "P@sw0rd"
 */

INSERT INTO
    `db`.`Trap` (
        `trapID`,
        `name`,
        `serviceID`,
        `description`,
        `isActivate`
    )
SELECT
    8,
    'Hide User Admin',
    4,
    'We will hide the username and password of an admin user in a way that is easy for a hacker to reach.',
    1
WHERE NOT EXISTS (
        SELECT *
        FROM `db`.`Trap`
        WHERE
            `name` = 'Hide User Admin'
            and `serviceID` = 4
    );

/* Verify Existence of email - SMTP */

/*
 "john.doe@intel.com",
 "jane_smith@intel.com",
 "johndoe123@intel.com",
 "support@intel.com",
 "info@intel.com"
 */

INSERT INTO
    `db`.`Trap` (
        `trapID`,
        `name`,
        `serviceID`,
        `description`,
        `isActivate`
    )
SELECT
    9,
    'Verify Existence of email',
    4,
    'If the attacker checks the existence of emails that we dont want anyone to know about, he will be considered an attacker and all his data will be recorded and sent to the database.',
    1
WHERE NOT EXISTS (
        SELECT *
        FROM `db`.`Trap`
        WHERE
            `name` = 'Verify Existence of email'
            and `serviceID` = 4
    );

/* Brute Force - HTTP */

INSERT INTO
    `db`.`Trap` (
        `trapID`,
        `name`,
        `serviceID`,
        `description`,
        `isActivate`
    )
SELECT
    10,
    'Brute Force',
    1,
    'Tracks a certain IP that tries to connect many times (5 times in our case) with different passwords, the system will allow the attacker to join and will recognize this as an attempt to do brute force, following which the attacker will be sent to fake data, all his data will be recorded in a database.',
    1
WHERE NOT EXISTS (
        SELECT *
        FROM `db`.`Trap`
        WHERE
            `name` = 'Brute Force'
            and `serviceID` = 1
    );

/* Create Attacker */

INSERT INTO
    `db`.`Attacker` (`attackerID`, `ip`, `location`)
SELECT 1, '103.25.63.95', ''
WHERE NOT EXISTS (
        SELECT *
        FROM `db`.`Attacker`
        WHERE
            `ip` = '103.25.63.95'
    );

INSERT INTO
    `db`.`Attacker` (`attackerID`, `ip`, `location`)
SELECT 2, '177.92.253.43', ''
WHERE NOT EXISTS (
        SELECT *
        FROM `db`.`Attacker`
        WHERE
            `ip` = '177.92.253.43'
    );

INSERT INTO
    `db`.`Attacker` (`attackerID`, `ip`, `location`)
SELECT 3, '103.13.46.248', ''
WHERE NOT EXISTS (
        SELECT *
        FROM `db`.`Attacker`
        WHERE
            `ip` = '103.13.46.248'
    );

INSERT INTO
    `db`.`Attacker` (`attackerID`, `ip`, `location`)
SELECT 4, '3.114.170.174', ''
WHERE NOT EXISTS (
        SELECT *
        FROM `db`.`Attacker`
        WHERE
            `ip` = '3.114.170.174'
    );

INSERT INTO
    `db`.`Attacker` (`attackerID`, `ip`, `location`)
SELECT 5, '113.83.229.69', ''
WHERE NOT EXISTS (
        SELECT *
        FROM `db`.`Attacker`
        WHERE
            `ip` = '113.83.229.69'
    );

INSERT INTO
    `db`.`Attacker` (`attackerID`, `ip`, `location`)
SELECT
    6,
    '206.172.176.239',
    ''
WHERE NOT EXISTS (
        SELECT *
        FROM `db`.`Attacker`
        WHERE
            `ip` = '206.172.176.239'
    );

INSERT INTO
    `db`.`Attacker` (`attackerID`, `ip`, `location`)
SELECT
    7,
    '209.211.97.211',
    ''
WHERE NOT EXISTS (
        SELECT *
        FROM `db`.`Attacker`
        WHERE
            `ip` = '209.211.97.211'
    );

INSERT INTO
    `db`.`Attacker` (`attackerID`, `ip`, `location`)
SELECT 8, '32.135.231.38', ''
WHERE NOT EXISTS (
        SELECT *
        FROM `db`.`Attacker`
        WHERE
            `ip` = '32.135.231.38'
    );

INSERT INTO
    `db`.`Attacker` (`attackerID`, `ip`, `location`)
SELECT
    9,
    '127.224.206.237',
    ''
WHERE NOT EXISTS (
        SELECT *
        FROM `db`.`Attacker`
        WHERE
            `ip` = '127.224.206.237'
    );

INSERT INTO
    `db`.`Attacker` (`attackerID`, `ip`, `location`)
SELECT
    10,
    '115.102.158.160',
    ''
WHERE NOT EXISTS (
        SELECT *
        FROM `db`.`Attacker`
        WHERE
            `ip` = '115.102.158.160'
    );

INSERT INTO
    `db`.`Attacker` (`attackerID`, `ip`, `location`)
SELECT 11, '15.74.189.77', ''
WHERE NOT EXISTS (
        SELECT *
        FROM `db`.`Attacker`
        WHERE
            `ip` = '15.74.189.77'
    );

INSERT INTO
    `db`.`Attacker` (`attackerID`, `ip`, `location`)
SELECT
    12,
    '250.59.250.119',
    ''
WHERE NOT EXISTS (
        SELECT *
        FROM `db`.`Attacker`
        WHERE
            `ip` = '250.59.250.119'
    );

INSERT INTO
    `db`.`Attacker` (`attackerID`, `ip`, `location`)
SELECT
    13,
    '212.167.139.251',
    ''
WHERE NOT EXISTS (
        SELECT *
        FROM `db`.`Attacker`
        WHERE
            `ip` = '212.167.139.251'
    );

/* Create Report with first log */

/* 1 */

INSERT INTO
    `db`.`Log` (
        `logID`,
        `sessionID`,
        `createAt`,
        `description`
    )
SELECT
    1,
    '43d7316e-d85d-4b9f-a9b4-f3d5d4266f56',
    '2023-07-10 09:15:30',
    'Create report ID: 1'
WHERE NOT EXISTS (
        SELECT *
        FROM `db`.`Log`
        WHERE `logID` = 1
    );

INSERT INTO
    `db`.`Report` (
        `reportID`,
        `createAt`,
        `companies_services_id`,
        `attackerID`,
        `trapID`,
        `sessionLogID`
    )
SELECT
    1,
    '2023-07-10 09:15:31',
    2,
    1,
    5,
    '43d7316e-d85d-4b9f-a9b4-f3d5d4266f56'
WHERE NOT EXISTS (
        SELECT *
        FROM `db`.`Report`
        WHERE
            `sessionLogID` = '43d7316e-d85d-4b9f-a9b4-f3d5d4266f56'
    );

/* 2 */

INSERT INTO
    `db`.`Log` (
        `logID`,
        `sessionID`,
        `createAt`,
        `description`
    )
SELECT
    2,
    '5c3a7599-44c1-4a8b-9a5e-cce0e8b89175',
    '2023-08-05 16:45:22',
    'Create report ID: 2'
WHERE NOT EXISTS (
        SELECT *
        FROM `db`.`Log`
        WHERE `logID` = 2
    );

INSERT INTO
    `db`.`Report` (
        `reportID`,
        `createAt`,
        `companies_services_id`,
        `attackerID`,
        `trapID`,
        `sessionLogID`
    )
SELECT
    2,
    '2023-08-05 16:45:22',
    4,
    1,
    1,
    '5c3a7599-44c1-4a8b-9a5e-cce0e8b89175'
WHERE NOT EXISTS (
        SELECT *
        FROM `db`.`Report`
        WHERE
            `sessionLogID` = '5c3a7599-44c1-4a8b-9a5e-cce0e8b89175'
    );

/* 3 */

INSERT INTO
    `db`.`Log` (
        `logID`,
        `sessionID`,
        `createAt`,
        `description`
    )
SELECT
    3,
    '9b842c8d-6631-4e20-89f9-76a63c7e548f',
    '2023-09-18 12:30:55',
    'Create report ID: 3'
WHERE NOT EXISTS (
        SELECT *
        FROM `db`.`Log`
        WHERE `logID` = 3
    );

INSERT INTO
    `db`.`Report` (
        `reportID`,
        `createAt`,
        `companies_services_id`,
        `attackerID`,
        `trapID`,
        `sessionLogID`
    )
SELECT
    3,
    '2023-09-18 12:30:55',
    1,
    1,
    4,
    '9b842c8d-6631-4e20-89f9-76a63c7e548f'
WHERE NOT EXISTS (
        SELECT *
        FROM `db`.`Report`
        WHERE
            `sessionLogID` = '9b842c8d-6631-4e20-89f9-76a63c7e548f'
    );

/* 4 */

INSERT INTO
    `db`.`Log` (
        `logID`,
        `sessionID`,
        `createAt`,
        `description`
    )
SELECT
    4,
    'a5b9319f-8e9a-4ef1-964e-57bea8769f13',
    '2023-10-29 19:55:10',
    'Create Report ID: 4'
WHERE NOT EXISTS (
        SELECT *
        FROM `db`.`Log`
        WHERE `logID` = 4
    );

INSERT INTO
    `db`.`Report` (
        `reportID`,
        `createAt`,
        `companies_services_id`,
        `attackerID`,
        `trapID`,
        `sessionLogID`
    )
SELECT
    4,
    '2023-10-29 19:55:10',
    5,
    2,
    6,
    'a5b9319f-8e9a-4ef1-964e-57bea8769f13'
WHERE NOT EXISTS (
        SELECT *
        FROM `db`.`Report`
        WHERE
            `sessionLogID` = 'a5b9319f-8e9a-4ef1-964e-57bea8769f13'
    );

/* 5 */

INSERT INTO
    `db`.`Log` (
        `logID`,
        `sessionID`,
        `createAt`,
        `description`
    )
SELECT
    5,
    '6d887bd6-b76c-4321-9e01-87ad2d328a11',
    '2023-10-29 19:55:10',
    'Create Report ID: 5'
WHERE NOT EXISTS (
        SELECT *
        FROM `db`.`Log`
        WHERE `logID` = 5
    );

INSERT INTO
    `db`.`Report` (
        `reportID`,
        `createAt`,
        `companies_services_id`,
        `attackerID`,
        `trapID`,
        `sessionLogID`
    )
SELECT
    5,
    '2023-11-14 08:20:40',
    4,
    3,
    2,
    '6d887bd6-b76c-4321-9e01-87ad2d328a11'
WHERE NOT EXISTS (
        SELECT *
        FROM `db`.`Report`
        WHERE
            `sessionLogID` = '6d887bd6-b76c-4321-9e01-87ad2d328a11'
    );

/* 6 */

INSERT INTO
    `db`.`Log` (
        `logID`,
        `sessionID`,
        `createAt`,
        `description`
    )
SELECT
    6,
    'e49c89d7-2a16-4b8a-b38d-8edf6f65bbde',
    '2023-10-29 19:55:10',
    'Create Report ID: 6'
WHERE NOT EXISTS (
        SELECT *
        FROM `db`.`Log`
        WHERE `logID` = 6
    );

INSERT INTO
    `db`.`Report` (
        `reportID`,
        `createAt`,
        `companies_services_id`,
        `attackerID`,
        `trapID`,
        `sessionLogID`
    )
SELECT
    6,
    '2023-12-03 14:10:25',
    3,
    4,
    8,
    'e49c89d7-2a16-4b8a-b38d-8edf6f65bbde'
WHERE NOT EXISTS (
        SELECT *
        FROM `db`.`Report`
        WHERE
            `sessionLogID` = 'e49c89d7-2a16-4b8a-b38d-8edf6f65bbde'
    );

/* 7 */

INSERT INTO
    `db`.`Log` (
        `logID`,
        `sessionID`,
        `createAt`,
        `description`
    )
SELECT
    7,
    'f86e29ac-63c9-4c49-89de-d497e1e5c5a4',
    '2023-10-29 19:55:10',
    'Create Report ID: 7'
WHERE NOT EXISTS (
        SELECT *
        FROM `db`.`Log`
        WHERE `logID` = 7
    );

INSERT INTO
    `db`.`Report` (
        `reportID`,
        `createAt`,
        `companies_services_id`,
        `attackerID`,
        `trapID`,
        `sessionLogID`
    )
SELECT
    7,
    '2022-01-06 18:40:15',
    3,
    4,
    9,
    'f86e29ac-63c9-4c49-89de-d497e1e5c5a4'
WHERE NOT EXISTS (
        SELECT *
        FROM `db`.`Report`
        WHERE
            `sessionLogID` = 'f86e29ac-63c9-4c49-89de-d497e1e5c5a4'
    );

/* 8 */

INSERT INTO
    `db`.`Log` (
        `logID`,
        `sessionID`,
        `createAt`,
        `description`
    )
SELECT
    8,
    'c4716c0f-d71b-4b7a-9e62-6c9c441c04ad',
    '2023-10-29 19:55:10',
    'Create Report ID: 8'
WHERE NOT EXISTS (
        SELECT *
        FROM `db`.`Log`
        WHERE `logID` = 8
    );

INSERT INTO
    `db`.`Report` (
        `reportID`,
        `createAt`,
        `companies_services_id`,
        `attackerID`,
        `trapID`,
        `sessionLogID`
    )
SELECT
    8,
    '2022-02-17 11:25:50',
    1,
    4,
    4,
    'c4716c0f-d71b-4b7a-9e62-6c9c441c04ad'
WHERE NOT EXISTS (
        SELECT *
        FROM `db`.`Report`
        WHERE
            `sessionLogID` = 'c4716c0f-d71b-4b7a-9e62-6c9c441c04ad'
    );

/* 9 */

INSERT INTO
    `db`.`Log` (
        `logID`,
        `sessionID`,
        `createAt`,
        `description`
    )
SELECT
    9,
    '247ed0bf-3f4c-4db9-81e0-2ef4546ef2bc',
    '2023-10-29 19:55:10',
    'Create Report ID: 9'
WHERE NOT EXISTS (
        SELECT *
        FROM `db`.`Log`
        WHERE `logID` = 9
    );

INSERT INTO
    `db`.`Report` (
        `reportID`,
        `createAt`,
        `companies_services_id`,
        `attackerID`,
        `trapID`,
        `sessionLogID`
    )
SELECT
    9,
    '2022-03-22 06:05:12',
    4,
    5,
    1,
    '247ed0bf-3f4c-4db9-81e0-2ef4546ef2bc'
WHERE NOT EXISTS (
        SELECT *
        FROM `db`.`Report`
        WHERE
            `sessionLogID` = '247ed0bf-3f4c-4db9-81e0-2ef4546ef2bc'
    );

/* 10 */

INSERT INTO
    `db`.`Log` (
        `logID`,
        `sessionID`,
        `createAt`,
        `description`
    )
SELECT
    10,
    '1822011a-8d68-4a57-a769-970573a11c47',
    '2023-10-29 19:55:10',
    'Create Report ID: 10'
WHERE NOT EXISTS (
        SELECT *
        FROM `db`.`Log`
        WHERE `logID` = 10
    );

INSERT INTO
    `db`.`Report` (
        `reportID`,
        `createAt`,
        `companies_services_id`,
        `attackerID`,
        `trapID`,
        `sessionLogID`
    )
SELECT
    10,
    '2022-04-29 22:30:35',
    2,
    6,
    4,
    '1822011a-8d68-4a57-a769-970573a11c47'
WHERE NOT EXISTS (
        SELECT *
        FROM `db`.`Report`
        WHERE
            `sessionLogID` = '1822011a-8d68-4a57-a769-970573a11c47'
    );

/* 11 */

INSERT INTO
    `db`.`Log` (
        `logID`,
        `sessionID`,
        `createAt`,
        `description`
    )
SELECT
    11,
    '5e1e778e-4a8d-485e-af5b-2a24a7c672bb',
    '2023-10-29 19:55:10',
    'Create Report ID: 11'
WHERE NOT EXISTS (
        SELECT *
        FROM `db`.`Log`
        WHERE `logID` = 11
    );

INSERT INTO
    `db`.`Report` (
        `reportID`,
        `createAt`,
        `companies_services_id`,
        `attackerID`,
        `trapID`,
        `sessionLogID`
    )
SELECT
    11,
    '2022-05-15 17:50:03',
    4,
    6,
    2,
    '5e1e778e-4a8d-485e-af5b-2a24a7c672bb'
WHERE NOT EXISTS (
        SELECT *
        FROM `db`.`Report`
        WHERE
            `sessionLogID` = '5e1e778e-4a8d-485e-af5b-2a24a7c672bb'
    );

/* 12 */

INSERT INTO
    `db`.`Log` (
        `logID`,
        `sessionID`,
        `createAt`,
        `description`
    )
SELECT
    12,
    'b38cc38e-0b4c-4ef0-a2a6-3461ce5a0e4f',
    '2023-10-29 19:55:10',
    'Create Report ID: 12'
WHERE NOT EXISTS (
        SELECT *
        FROM `db`.`Log`
        WHERE `logID` = 12
    );

INSERT INTO
    `db`.`Report` (
        `reportID`,
        `createAt`,
        `companies_services_id`,
        `attackerID`,
        `trapID`,
        `sessionLogID`
    )
SELECT
    12,
    '2022-06-26 04:45:18',
    5,
    7,
    7,
    'b38cc38e-0b4c-4ef0-a2a6-3461ce5a0e4f'
WHERE NOT EXISTS (
        SELECT *
        FROM `db`.`Report`
        WHERE
            `sessionLogID` = 'b38cc38e-0b4c-4ef0-a2a6-3461ce5a0e4f'
    );

/* 13 */

INSERT INTO
    `db`.`Log` (
        `logID`,
        `sessionID`,
        `createAt`,
        `description`
    )
SELECT
    13,
    'd4ae5b16-5d6d-4cc0-b8a6-89a98f1bc9ce',
    '2023-10-29 19:55:10',
    'Create Report ID: 13'
WHERE NOT EXISTS (
        SELECT *
        FROM `db`.`Log`
        WHERE `logID` = 13
    );

INSERT INTO
    `db`.`Report` (
        `reportID`,
        `createAt`,
        `companies_services_id`,
        `attackerID`,
        `trapID`,
        `sessionLogID`
    )
SELECT
    13,
    '2022-07-12 13:00:08',
    1,
    7,
    5,
    'd4ae5b16-5d6d-4cc0-b8a6-89a98f1bc9ce'
WHERE NOT EXISTS (
        SELECT *
        FROM `db`.`Report`
        WHERE
            `sessionLogID` = 'd4ae5b16-5d6d-4cc0-b8a6-89a98f1bc9ce'
    );

/* 14 */

INSERT INTO
    `db`.`Log` (
        `logID`,
        `sessionID`,
        `createAt`,
        `description`
    )
SELECT
    14,
    '14e933ee-9b5a-4a63-b425-9e8160dce3a9',
    '2023-10-29 19:55:10',
    'Create Report ID: 14'
WHERE NOT EXISTS (
        SELECT *
        FROM `db`.`Log`
        WHERE `logID` = 14
    );

INSERT INTO
    `db`.`Report` (
        `reportID`,
        `createAt`,
        `companies_services_id`,
        `attackerID`,
        `trapID`,
        `sessionLogID`
    )
SELECT
    14,
    '2022-07-18 15:24:18',
    1,
    8,
    10,
    '14e933ee-9b5a-4a63-b425-9e8160dce3a9'
WHERE NOT EXISTS (
        SELECT *
        FROM `db`.`Report`
        WHERE
            `sessionLogID` = '14e933ee-9b5a-4a63-b425-9e8160dce3a9'
    );

/* Create Log */

INSERT INTO
    `db`.`Log` (
        `logID`,
        `sessionID`,
        `createAt`,
        `description`
    )
SELECT
    15,
    '43d7316e-d85d-4b9f-a9b4-f3d5d4266f56',
    '2023-07-10 09:15:30',
    'Execute Command: on_connect'
WHERE NOT EXISTS (
        SELECT *
        FROM `db`.`Log`
        WHERE `logID` = 15
    );

INSERT INTO
    `db`.`Log` (
        `logID`,
        `sessionID`,
        `createAt`,
        `description`
    )
SELECT
    16,
    '43d7316e-d85d-4b9f-a9b4-f3d5d4266f56',
    '2023-07-10 09:15:32',
    'Execute Command: on_login: Username: Administrator, Password: admin'
WHERE NOT EXISTS (
        SELECT *
        FROM `db`.`Log`
        WHERE `logID` = 16
    );

INSERT INTO
    `db`.`Log` (
        `logID`,
        `sessionID`,
        `createAt`,
        `description`
    )
SELECT
    17,
    '43d7316e-d85d-4b9f-a9b4-f3d5d4266f56',
    '2023-07-10 09:15:34',
    'Execute Command: on_file_sent'
WHERE NOT EXISTS (
        SELECT *
        FROM `db`.`Log`
        WHERE `logID` = 17
    );

INSERT INTO
    `db`.`Log` (
        `logID`,
        `sessionID`,
        `createAt`,
        `description`
    )
SELECT
    18,
    '43d7316e-d85d-4b9f-a9b4-f3d5d4266f56',
    '2023-07-10 09:15:36',
    'Execute Command: on_file_received'
WHERE NOT EXISTS (
        SELECT *
        FROM `db`.`Log`
        WHERE `logID` = 18
    );

INSERT INTO
    `db`.`Log` (
        `logID`,
        `sessionID`,
        `createAt`,
        `description`
    )
SELECT
    19,
    '43d7316e-d85d-4b9f-a9b4-f3d5d4266f56',
    '2023-07-10 09:15:38',
    'Execute Command: on_logout'
WHERE NOT EXISTS (
        SELECT *
        FROM `db`.`Log`
        WHERE `logID` = 19
    );

INSERT INTO
    `db`.`Log` (
        `logID`,
        `sessionID`,
        `createAt`,
        `description`
    )
SELECT
    20,
    '43d7316e-d85d-4b9f-a9b4-f3d5d4266f56',
    '2023-07-10 09:15:40',
    'Execute Command: on_disconnect'
WHERE NOT EXISTS (
        SELECT *
        FROM `db`.`Log`
        WHERE `logID` = 20
    );

INSERT INTO
    `db`.`Log` (
        `logID`,
        `sessionID`,
        `createAt`,
        `description`
    )
SELECT
    21,
    '5c3a7599-44c1-4a8b-9a5e-cce0e8b89175',
    '2023-08-05 16:45:22',
    'Execute Command: on_connect'
WHERE NOT EXISTS (
        SELECT *
        FROM `db`.`Log`
        WHERE `logID` = 21
    );

INSERT INTO
    `db`.`Log` (
        `logID`,
        `sessionID`,
        `createAt`,
        `description`
    )
SELECT
    22,
    '5c3a7599-44c1-4a8b-9a5e-cce0e8b89175',
    '2023-08-05 16:45:45',
    'login: Username: admin, Password: admin'
WHERE NOT EXISTS (
        SELECT *
        FROM `db`.`Log`
        WHERE `logID` = 23
    );

INSERT INTO
    `db`.`Log` (
        `logID`,
        `sessionID`,
        `createAt`,
        `description`
    )
SELECT
    24,
    '5c3a7599-44c1-4a8b-9a5e-cce0e8b89175',
    '2023-08-05 16:45:58',
    'Execute Command: Users Details'
WHERE NOT EXISTS (
        SELECT *
        FROM `db`.`Log`
        WHERE `logID` = 25
    );

INSERT INTO
    `db`.`Log` (
        `logID`,
        `sessionID`,
        `createAt`,
        `description`
    )
SELECT
    26,
    '9b842c8d-6631-4e20-89f9-76a63c7e548f',
    '2023-09-18 12:30:55',
    'Execute Command: on_connect'
WHERE NOT EXISTS (
        SELECT *
        FROM `db`.`Log`
        WHERE `logID` = 26
    );

INSERT INTO
    `db`.`Log` (
        `logID`,
        `sessionID`,
        `createAt`,
        `description`
    )
SELECT
    27,
    '9b842c8d-6631-4e20-89f9-76a63c7e548f',
    '2023-09-19 12:31:24',
    'Execute Command: on_login: Username: root Password: toor'
WHERE NOT EXISTS (
        SELECT *
        FROM `db`.`Log`
        WHERE `logID` = 27
    );

INSERT INTO
    `db`.`Log` (
        `logID`,
        `sessionID`,
        `createAt`,
        `description`
    )
SELECT
    28,
    '9b842c8d-6631-4e20-89f9-76a63c7e548f',
    '2023-09-20 12:31:53',
    'Execute Command: on_file_sent'
WHERE NOT EXISTS (
        SELECT *
        FROM `db`.`Log`
        WHERE `logID` = 28
    );

INSERT INTO
    `db`.`Log` (
        `logID`,
        `sessionID`,
        `createAt`,
        `description`
    )
SELECT
    29,
    '9b842c8d-6631-4e20-89f9-76a63c7e548f',
    '2023-09-21 12:32:22',
    'Execute Command: on_logout'
WHERE NOT EXISTS (
        SELECT *
        FROM `db`.`Log`
        WHERE `logID` = 29
    );

INSERT INTO
    `db`.`Log` (
        `logID`,
        `sessionID`,
        `createAt`,
        `description`
    )
SELECT
    30,
    '9b842c8d-6631-4e20-89f9-76a63c7e548f',
    '2023-09-22 12:32:51',
    'Execute Command: on_disconnect'
WHERE NOT EXISTS (
        SELECT *
        FROM `db`.`Log`
        WHERE `logID` = 31
    );

INSERT INTO
    `db`.`Log` (
        `logID`,
        `sessionID`,
        `createAt`,
        `description`
    )
SELECT
    32,
    'a5b9319f-8e9a-4ef1-964e-57bea8769f13',
    '2023-10-29 19:55:10',
    'Execute Command: on_connect'
WHERE NOT EXISTS (
        SELECT *
        FROM `db`.`Log`
        WHERE `logID` = 32
    );

INSERT INTO
    `db`.`Log` (
        `logID`,
        `sessionID`,
        `createAt`,
        `description`
    )
SELECT
    33,
    'a5b9319f-8e9a-4ef1-964e-57bea8769f13',
    '2023-10-29 19:56:30',
    'login: Username: seed Password: dees'
WHERE NOT EXISTS (
        SELECT *
        FROM `db`.`Log`
        WHERE `logID` = 33
    );

INSERT INTO
    `db`.`Log` (
        `logID`,
        `sessionID`,
        `createAt`,
        `description`
    )
SELECT
    34,
    'a5b9319f-8e9a-4ef1-964e-57bea8769f13',
    '2023-10-29 19:57:50',
    'Execute Command: cd'
WHERE NOT EXISTS (
        SELECT *
        FROM `db`.`Log`
        WHERE `logID` = 34
    );

INSERT INTO
    `db`.`Log` (
        `logID`,
        `sessionID`,
        `createAt`,
        `description`
    )
SELECT
    35,
    'a5b9319f-8e9a-4ef1-964e-57bea8769f13',
    '2023-10-29 19:59:10',
    'Execute Command: cat'
WHERE NOT EXISTS (
        SELECT *
        FROM `db`.`Log`
        WHERE `logID` = 35
    );

INSERT INTO
    `db`.`Log` (
        `logID`,
        `sessionID`,
        `createAt`,
        `description`
    )
SELECT
    36,
    'a5b9319f-8e9a-4ef1-964e-57bea8769f13',
    '2023-10-29 20:00:30',
    'Execute Command: ls'
WHERE NOT EXISTS (
        SELECT *
        FROM `db`.`Log`
        WHERE `logID` = 36
    );

INSERT INTO
    `db`.`Log` (
        `logID`,
        `sessionID`,
        `createAt`,
        `description`
    )
SELECT
    37,
    'a5b9319f-8e9a-4ef1-964e-57bea8769f14',
    '2023-10-29 20:01:50',
    'Execute Command: help'
WHERE NOT EXISTS (
        SELECT *
        FROM `db`.`Log`
        WHERE `logID` = 37
    );

INSERT INTO
    `db`.`Log` (
        `logID`,
        `sessionID`,
        `createAt`,
        `description`
    )
SELECT
    38,
    'a5b9319f-8e9a-4ef1-964e-57bea8769f15',
    '2023-10-29 20:03:10',
    'Execute Command: rm'
WHERE NOT EXISTS (
        SELECT *
        FROM `db`.`Log`
        WHERE `logID` = 38
    );

INSERT INTO
    `db`.`Log` (
        `logID`,
        `sessionID`,
        `createAt`,
        `description`
    )
SELECT
    39,
    'a5b9319f-8e9a-4ef1-964e-57bea8769f16',
    '2023-10-29 20:04:30',
    'Execute Command: pwd'
WHERE NOT EXISTS (
        SELECT *
        FROM `db`.`Log`
        WHERE `logID` = 39
    );

INSERT INTO
    `db`.`Log` (
        `logID`,
        `sessionID`,
        `createAt`,
        `description`
    )
SELECT
    40,
    'a5b9319f-8e9a-4ef1-964e-57bea8769f17',
    '2023-10-29 20:05:50',
    'Execute Command: whoami'
WHERE NOT EXISTS (
        SELECT *
        FROM `db`.`Log`
        WHERE `logID` = 40
    );

INSERT INTO
    `db`.`Log` (
        `logID`,
        `sessionID`,
        `createAt`,
        `description`
    )
SELECT
    41,
    'a5b9319f-8e9a-4ef1-964e-57bea8769f18',
    '2023-10-29 20:07:10',
    'Execute Command: us'
WHERE NOT EXISTS (
        SELECT *
        FROM `db`.`Log`
        WHERE `logID` = 41
    );

INSERT INTO
    `db`.`Log` (
        `logID`,
        `sessionID`,
        `createAt`,
        `description`
    )
SELECT
    42,
    'a5b9319f-8e9a-4ef1-964e-57bea8769f19',
    '2023-10-29 20:08:30',
    'Execute Command: sudo'
WHERE NOT EXISTS (
        SELECT *
        FROM `db`.`Log`
        WHERE `logID` = 42
    );

INSERT INTO
    `db`.`Log` (
        `logID`,
        `sessionID`,
        `createAt`,
        `description`
    )
SELECT
    43,
    'a5b9319f-8e9a-4ef1-964e-57bea8769f20',
    '2023-10-29 20:09:50',
    'Execute Command: version'
WHERE NOT EXISTS (
        SELECT *
        FROM `db`.`Log`
        WHERE `logID` = 43
    );

INSERT INTO
    `db`.`Log` (
        `logID`,
        `sessionID`,
        `createAt`,
        `description`
    )
SELECT
    44,
    'a5b9319f-8e9a-4ef1-964e-57bea8769f21',
    '2023-10-29 20:11:10',
    'Execute Command: cmd'
WHERE NOT EXISTS (
        SELECT *
        FROM `db`.`Log`
        WHERE `logID` = 44
    );

INSERT INTO
    `db`.`Log` (
        `logID`,
        `sessionID`,
        `createAt`,
        `description`
    )
SELECT
    45,
    '6d887bd6-b76c-4321-9e01-87ad2d328a11',
    '2023-11-14 08:20:40',
    'Execute Command: on_connect'
WHERE NOT EXISTS (
        SELECT *
        FROM `db`.`Log`
        WHERE `logID` = 45
    );

INSERT INTO
    `db`.`Log` (
        `logID`,
        `sessionID`,
        `createAt`,
        `description`
    )
SELECT
    46,
    '6d887bd6-b76c-4321-9e01-87ad2d328a11',
    '2023-11-15 08:20:50',
    'Execute Command: login Username: ''OR 1=1'', Password: 12345678aA!'
WHERE NOT EXISTS (
        SELECT *
        FROM `db`.`Log`
        WHERE `logID` = 46
    );

INSERT INTO
    `db`.`Log` (
        `logID`,
        `sessionID`,
        `createAt`,
        `description`
    )
SELECT
    47,
    'e49c89d7-2a16-4b8a-b38d-8edf6f65bbde',
    '2023-12-03 14:10:25',
    'Execute Command: on_connect'
WHERE NOT EXISTS (
        SELECT *
        FROM `db`.`Log`
        WHERE `logID` = 47
    );

INSERT INTO
    `db`.`Log` (
        `logID`,
        `sessionID`,
        `createAt`,
        `description`
    )
SELECT
    48,
    'e49c89d7-2a16-4b8a-b38d-8edf6f65bbde',
    '2023-12-03 14:10:36',
    'Execute Command: AUTH GET USERS'
WHERE NOT EXISTS (
        SELECT *
        FROM `db`.`Log`
        WHERE `logID` = 48
    );

INSERT INTO
    `db`.`Log` (
        `logID`,
        `sessionID`,
        `createAt`,
        `description`
    )
SELECT
    49,
    'e49c89d7-2a16-4b8a-b38d-8edf6f65bbde',
    '2023-12-03 14:10:47',
    'Execute Command: AUTH LOGIN: Username: administrator, Password: P@sw0rd'
WHERE NOT EXISTS (
        SELECT *
        FROM `db`.`Log`
        WHERE `logID` = 49
    );

INSERT INTO
    `db`.`Log` (
        `logID`,
        `sessionID`,
        `createAt`,
        `description`
    )
SELECT
    50,
    'e49c89d7-2a16-4b8a-b38d-8edf6f65bbde',
    '2023-12-03 14:10:58',
    'Execute Command: HELO'
WHERE NOT EXISTS (
        SELECT *
        FROM `db`.`Log`
        WHERE `logID` = 50
    );

INSERT INTO
    `db`.`Log` (
        `logID`,
        `sessionID`,
        `createAt`,
        `description`
    )
SELECT
    51,
    'e49c89d7-2a16-4b8a-b38d-8edf6f65bbde',
    '2023-12-03 14:11:09',
    'Execute Command: EHLO'
WHERE NOT EXISTS (
        SELECT *
        FROM `db`.`Log`
        WHERE `logID` = 51
    );

INSERT INTO
    `db`.`Log` (
        `logID`,
        `sessionID`,
        `createAt`,
        `description`
    )
SELECT
    52,
    'e49c89d7-2a16-4b8a-b38d-8edf6f65bbde',
    '2023-12-03 14:11:20',
    'Execute Command: HELP'
WHERE NOT EXISTS (
        SELECT *
        FROM `db`.`Log`
        WHERE `logID` = 52
    );

INSERT INTO
    `db`.`Log` (
        `logID`,
        `sessionID`,
        `createAt`,
        `description`
    )
SELECT
    53,
    'e49c89d7-2a16-4b8a-b38d-8edf6f65bbde',
    '2023-12-03 14:11:31',
    'Execute Command: DATA'
WHERE NOT EXISTS (
        SELECT *
        FROM `db`.`Log`
        WHERE `logID` = 53
    );

INSERT INTO
    `db`.`Log` (
        `logID`,
        `sessionID`,
        `createAt`,
        `description`
    )
SELECT
    54,
    'e49c89d7-2a16-4b8a-b38d-8edf6f65bbde',
    '2023-12-03 14:11:42',
    'Execute Command: VRFY "john.doe@intel.com"'
WHERE NOT EXISTS (
        SELECT *
        FROM `db`.`Log`
        WHERE `logID` = 54
    );

INSERT INTO
    `db`.`Log` (
        `logID`,
        `sessionID`,
        `createAt`,
        `description`
    )
SELECT
    55,
    'e49c89d7-2a16-4b8a-b38d-8edf6f65bbde',
    '2023-12-03 14:11:53',
    'Execute Command: QUIT'
WHERE NOT EXISTS (
        SELECT *
        FROM `db`.`Log`
        WHERE `logID` = 55
    );

INSERT INTO
    `db`.`Log` (
        `logID`,
        `sessionID`,
        `createAt`,
        `description`
    )
SELECT
    56,
    'f86e29ac-63c9-4c49-89de-d497e1e5c5a4',
    '2022-01-06 18:40:15',
    'Execute Command: on_connect'
WHERE NOT EXISTS (
        SELECT *
        FROM `db`.`Log`
        WHERE `logID` = 56
    );

INSERT INTO
    `db`.`Log` (
        `logID`,
        `sessionID`,
        `createAt`,
        `description`
    )
SELECT
    57,
    'f86e29ac-63c9-4c49-89de-d497e1e5c5a5',
    '2022-01-06 18:41:15',
    'Execute Command: VRFY "john.doe@intel.com"'
WHERE NOT EXISTS (
        SELECT *
        FROM `db`.`Log`
        WHERE `logID` = 57
    );

INSERT INTO
    `db`.`Log` (
        `logID`,
        `sessionID`,
        `createAt`,
        `description`
    )
SELECT
    58,
    'f86e29ac-63c9-4c49-89de-d497e1e5c5a6',
    '2022-01-06 18:42:15',
    'Execute Command: QUIT'
WHERE NOT EXISTS (
        SELECT *
        FROM `db`.`Log`
        WHERE `logID` = 58
    );

INSERT INTO
    `db`.`Log` (
        `logID`,
        `sessionID`,
        `createAt`,
        `description`
    )
SELECT
    59,
    'c4716c0f-d71b-4b7a-9e62-6c9c441c04ad',
    '2022-02-17 11:25:50',
    'Execute Command: on_connect'
WHERE NOT EXISTS (
        SELECT *
        FROM `db`.`Log`
        WHERE `logID` = 59
    );

INSERT INTO
    `db`.`Log` (
        `logID`,
        `sessionID`,
        `createAt`,
        `description`
    )
SELECT
    60,
    'c4716c0f-d71b-4b7a-9e62-6c9c441c04ad',
    '2022-02-17 11:26:21',
    'Execute Command: on_login: Username: user Password: 123456'
WHERE NOT EXISTS (
        SELECT *
        FROM `db`.`Log`
        WHERE `logID` = 60
    );

INSERT INTO
    `db`.`Log` (
        `logID`,
        `sessionID`,
        `createAt`,
        `description`
    )
SELECT
    61,
    'c4716c0f-d71b-4b7a-9e62-6c9c441c04ad',
    '2022-02-17 11:26:52',
    'Execute Command: on_file_received'
WHERE NOT EXISTS (
        SELECT *
        FROM `db`.`Log`
        WHERE `logID` = 61
    );

INSERT INTO
    `db`.`Log` (
        `logID`,
        `sessionID`,
        `createAt`,
        `description`
    )
SELECT
    62,
    'c4716c0f-d71b-4b7a-9e62-6c9c441c04ad',
    '2022-02-17 11:27:23',
    'Execute Command: on_logout'
WHERE NOT EXISTS (
        SELECT *
        FROM `db`.`Log`
        WHERE `logID` = 62
    );

INSERT INTO
    `db`.`Log` (
        `logID`,
        `sessionID`,
        `createAt`,
        `description`
    )
SELECT
    63,
    'c4716c0f-d71b-4b7a-9e62-6c9c441c04ad',
    '2022-02-17 11:27:54',
    'Execute Command: on_disconnect'
WHERE NOT EXISTS (
        SELECT *
        FROM `db`.`Log`
        WHERE `logID` = 63
    );

INSERT INTO
    `db`.`Log` (
        `logID`,
        `sessionID`,
        `createAt`,
        `description`
    )
SELECT
    64,
    '247ed0bf-3f4c-4db9-81e0-2ef4546ef2bc',
    '2022-03-22 06:05:12',
    'Execute Command: on_connect'
WHERE NOT EXISTS (
        SELECT *
        FROM `db`.`Log`
        WHERE `logID` = 64
    );

INSERT INTO
    `db`.`Log` (
        `logID`,
        `sessionID`,
        `createAt`,
        `description`
    )
SELECT
    65,
    '247ed0bf-3f4c-4db9-81e0-2ef4546ef2bc',
    '2022-03-22 06:06:12',
    'login: Username: dev Password: fullaccess'
WHERE NOT EXISTS (
        SELECT *
        FROM `db`.`Log`
        WHERE `logID` = 65
    );

INSERT INTO
    `db`.`Log` (
        `logID`,
        `sessionID`,
        `createAt`,
        `description`
    )
SELECT
    66,
    '247ed0bf-3f4c-4db9-81e0-2ef4546ef2bc',
    '2022-03-22 06:07:12',
    'Route: Users Details'
WHERE NOT EXISTS (
        SELECT *
        FROM `db`.`Log`
        WHERE `logID` = 66
    );

INSERT INTO
    `db`.`Log` (
        `logID`,
        `sessionID`,
        `createAt`,
        `description`
    )
SELECT
    67,
    '247ed0bf-3f4c-4db9-81e0-2ef4546ef2bc',
    '2022-03-22 06:08:12',
    'Route: Company Employments Details'
WHERE NOT EXISTS (
        SELECT *
        FROM `db`.`Log`
        WHERE `logID` = 67
    );

INSERT INTO
    `db`.`Log` (
        `logID`,
        `sessionID`,
        `createAt`,
        `description`
    )
SELECT
    68,
    '247ed0bf-3f4c-4db9-81e0-2ef4546ef2bc',
    '2022-03-22 06:09:12',
    'Route: Administrator Details'
WHERE NOT EXISTS (
        SELECT *
        FROM `db`.`Log`
        WHERE `logID` = 68
    );

INSERT INTO
    `db`.`Log` (
        `logID`,
        `sessionID`,
        `createAt`,
        `description`
    )
SELECT
    69,
    '1822011a-8d68-4a57-a769-970573a11c47',
    '2022-04-29 22:30:35',
    'Execute Command: on_connect'
WHERE NOT EXISTS (
        SELECT *
        FROM `db`.`Log`
        WHERE `logID` = 69
    );

INSERT INTO
    `db`.`Log` (
        `logID`,
        `sessionID`,
        `createAt`,
        `description`
    )
SELECT
    70,
    '1822011a-8d68-4a57-a769-970573a11c47',
    '2022-04-30 22:30:44',
    'Execute Command: on_login: Username: root Password: toor'
WHERE NOT EXISTS (
        SELECT *
        FROM `db`.`Log`
        WHERE `logID` = 70
    );

INSERT INTO
    `db`.`Log` (
        `logID`,
        `sessionID`,
        `createAt`,
        `description`
    )
SELECT
    71,
    '1822011a-8d68-4a57-a769-970573a11c47',
    '2022-05-01 22:30:53',
    'Execute Command: on_file_received'
WHERE NOT EXISTS (
        SELECT *
        FROM `db`.`Log`
        WHERE `logID` = 71
    );

INSERT INTO
    `db`.`Log` (
        `logID`,
        `sessionID`,
        `createAt`,
        `description`
    )
SELECT
    72,
    '1822011a-8d68-4a57-a769-970573a11c47',
    '2022-05-02 22:31:02',
    'Execute Command: on_logout'
WHERE NOT EXISTS (
        SELECT *
        FROM `db`.`Log`
        WHERE `logID` = 72
    );

INSERT INTO
    `db`.`Log` (
        `logID`,
        `sessionID`,
        `createAt`,
        `description`
    )
SELECT
    73,
    '1822011a-8d68-4a57-a769-970573a11c47',
    '2022-05-03 22:31:11',
    'Execute Command: on_disconnect'
WHERE NOT EXISTS (
        SELECT *
        FROM `db`.`Log`
        WHERE `logID` = 73
    );

INSERT INTO
    `db`.`Log` (
        `logID`,
        `sessionID`,
        `createAt`,
        `description`
    )
SELECT
    74,
    '5e1e778e-4a8d-485e-af5b-2a24a7c672bb',
    '2022-05-15 17:50:03',
    'Execute Command: on_connect'
WHERE NOT EXISTS (
        SELECT *
        FROM `db`.`Log`
        WHERE `logID` = 74
    );

INSERT INTO
    `db`.`Log` (
        `logID`,
        `sessionID`,
        `createAt`,
        `description`
    )
SELECT
    75,
    '5e1e778e-4a8d-485e-af5b-2a24a7c672bb',
    '2022-05-15 17:51:03',
    'Execute Command: login (Username: " or ""=", Password: 1561651sadA@'
WHERE NOT EXISTS (
        SELECT *
        FROM `db`.`Log`
        WHERE `logID` = 75
    );

INSERT INTO
    `db`.`Log` (
        `logID`,
        `sessionID`,
        `createAt`,
        `description`
    )
SELECT
    76,
    'b38cc38e-0b4c-4ef0-a2a6-3461ce5a0e4f',
    '2022-06-26 04:45:18',
    'Execute Command: on_connect'
WHERE NOT EXISTS (
        SELECT *
        FROM `db`.`Log`
        WHERE `logID` = 76
    );

INSERT INTO
    `db`.`Log` (
        `logID`,
        `sessionID`,
        `createAt`,
        `description`
    )
SELECT
    77,
    'b38cc38e-0b4c-4ef0-a2a6-3461ce5a0e4f',
    '2022-06-26 04:46:44',
    'Execute Command: us'
WHERE NOT EXISTS (
        SELECT *
        FROM `db`.`Log`
        WHERE `logID` = 77
    );

INSERT INTO
    `db`.`Log` (
        `logID`,
        `sessionID`,
        `createAt`,
        `description`
    )
SELECT
    78,
    'b38cc38e-0b4c-4ef0-a2a6-3461ce5a0e4f',
    '2022-06-26 04:48:10',
    'Execute Command: login Username: sudo Password: fullaccess'
WHERE NOT EXISTS (
        SELECT *
        FROM `db`.`Log`
        WHERE `logID` = 78
    );

INSERT INTO
    `db`.`Log` (
        `logID`,
        `sessionID`,
        `createAt`,
        `description`
    )
SELECT
    79,
    'b38cc38e-0b4c-4ef0-a2a6-3461ce5a0e4f',
    '2022-06-26 04:49:36',
    'Execute Command: cd'
WHERE NOT EXISTS (
        SELECT *
        FROM `db`.`Log`
        WHERE `logID` = 79
    );

INSERT INTO
    `db`.`Log` (
        `logID`,
        `sessionID`,
        `createAt`,
        `description`
    )
SELECT
    80,
    'b38cc38e-0b4c-4ef0-a2a6-3461ce5a0e4f',
    '2022-06-26 04:51:02',
    'Execute Command: cat'
WHERE NOT EXISTS (
        SELECT *
        FROM `db`.`Log`
        WHERE `logID` = 80
    );

INSERT INTO
    `db`.`Log` (
        `logID`,
        `sessionID`,
        `createAt`,
        `description`
    )
SELECT
    81,
    'b38cc38e-0b4c-4ef0-a2a6-3461ce5a0e4f',
    '2022-06-26 04:52:28',
    'Execute Command: ls'
WHERE NOT EXISTS (
        SELECT *
        FROM `db`.`Log`
        WHERE `logID` = 81
    );

INSERT INTO
    `db`.`Log` (
        `logID`,
        `sessionID`,
        `createAt`,
        `description`
    )
SELECT
    82,
    'b38cc38e-0b4c-4ef0-a2a6-3461ce5a0e4f',
    '2022-06-26 04:53:54',
    'Execute Command: help'
WHERE NOT EXISTS (
        SELECT *
        FROM `db`.`Log`
        WHERE `logID` = 82
    );

INSERT INTO
    `db`.`Log` (
        `logID`,
        `sessionID`,
        `createAt`,
        `description`
    )
SELECT
    83,
    'b38cc38e-0b4c-4ef0-a2a6-3461ce5a0e4f',
    '2022-06-26 04:55:20',
    'Execute Command: rm'
WHERE NOT EXISTS (
        SELECT *
        FROM `db`.`Log`
        WHERE `logID` = 83
    );

INSERT INTO
    `db`.`Log` (
        `logID`,
        `sessionID`,
        `createAt`,
        `description`
    )
SELECT
    84,
    'b38cc38e-0b4c-4ef0-a2a6-3461ce5a0e4f',
    '2022-06-26 04:56:46',
    'Execute Command: pwd'
WHERE NOT EXISTS (
        SELECT *
        FROM `db`.`Log`
        WHERE `logID` = 84
    );

INSERT INTO
    `db`.`Log` (
        `logID`,
        `sessionID`,
        `createAt`,
        `description`
    )
SELECT
    85,
    'b38cc38e-0b4c-4ef0-a2a6-3461ce5a0e4f',
    '2022-06-26 04:58:12',
    'Execute Command: whoami'
WHERE NOT EXISTS (
        SELECT *
        FROM `db`.`Log`
        WHERE `logID` = 85
    );

INSERT INTO
    `db`.`Log` (
        `logID`,
        `sessionID`,
        `createAt`,
        `description`
    )
SELECT
    86,
    'b38cc38e-0b4c-4ef0-a2a6-3461ce5a0e4f',
    '2022-06-26 04:59:38',
    'Execute Command: sudo'
WHERE NOT EXISTS (
        SELECT *
        FROM `db`.`Log`
        WHERE `logID` = 86
    );

INSERT INTO
    `db`.`Log` (
        `logID`,
        `sessionID`,
        `createAt`,
        `description`
    )
SELECT
    87,
    'b38cc38e-0b4c-4ef0-a2a6-3461ce5a0e4f',
    '2022-06-26 05:01:04',
    'Execute Command: version'
WHERE NOT EXISTS (
        SELECT *
        FROM `db`.`Log`
        WHERE `logID` = 87
    );

INSERT INTO
    `db`.`Log` (
        `logID`,
        `sessionID`,
        `createAt`,
        `description`
    )
SELECT
    88,
    'b38cc38e-0b4c-4ef0-a2a6-3461ce5a0e4f',
    '2022-06-26 05:02:30',
    'Execute Command: cmd'
WHERE NOT EXISTS (
        SELECT *
        FROM `db`.`Log`
        WHERE `logID` = 88
    );

INSERT INTO
    `db`.`Log` (
        `logID`,
        `sessionID`,
        `createAt`,
        `description`
    )
SELECT
    89,
    'd4ae5b16-5d6d-4cc0-b8a6-89a98f1bc9ce',
    '2022-07-12 13:00:08',
    'Execute Command: on_connect'
WHERE NOT EXISTS (
        SELECT *
        FROM `db`.`Log`
        WHERE `logID` = 89
    );

INSERT INTO
    `db`.`Log` (
        `logID`,
        `sessionID`,
        `createAt`,
        `description`
    )
SELECT
    90,
    'd4ae5b16-5d6d-4cc0-b8a6-89a98f1bc9ce',
    '2022-07-12 13:02:01',
    'Execute Command: on_login: Username: Administrator Password: admin'
WHERE NOT EXISTS (
        SELECT *
        FROM `db`.`Log`
        WHERE `logID` = 90
    );

INSERT INTO
    `db`.`Log` (
        `logID`,
        `sessionID`,
        `createAt`,
        `description`
    )
SELECT
    91,
    'd4ae5b16-5d6d-4cc0-b8a6-89a98f1bc9ce',
    '2022-07-12 13:03:54',
    'Execute Command: on_file_sent'
WHERE NOT EXISTS (
        SELECT *
        FROM `db`.`Log`
        WHERE `logID` = 91
    );

INSERT INTO
    `db`.`Log` (
        `logID`,
        `sessionID`,
        `createAt`,
        `description`
    )
SELECT
    92,
    'd4ae5b16-5d6d-4cc0-b8a6-89a98f1bc9ce',
    '2022-07-12 13:05:47',
    'Execute Command: on_file_received'
WHERE NOT EXISTS (
        SELECT *
        FROM `db`.`Log`
        WHERE `logID` = 92
    );

INSERT INTO
    `db`.`Log` (
        `logID`,
        `sessionID`,
        `createAt`,
        `description`
    )
SELECT
    93,
    'd4ae5b16-5d6d-4cc0-b8a6-89a98f1bc9ce',
    '2022-07-12 13:07:40',
    'Execute Command: on_logout'
WHERE NOT EXISTS (
        SELECT *
        FROM `db`.`Log`
        WHERE `logID` = 93
    );

INSERT INTO
    `db`.`Log` (
        `logID`,
        `sessionID`,
        `createAt`,
        `description`
    )
SELECT
    94,
    'd4ae5b16-5d6d-4cc0-b8a6-89a98f1bc9ce',
    '2022-07-12 13:09:33',
    'Execute Command: on_disconnect'
WHERE NOT EXISTS (
        SELECT *
        FROM `db`.`Log`
        WHERE `logID` = 94
    );

INSERT INTO
    `db`.`Log` (
        `logID`,
        `sessionID`,
        `createAt`,
        `description`
    )
SELECT
    95,
    '14e933ee-9b5a-4a63-b425-9e8160dce3a9',
    '2022-07-18 15:24:18',
    'Execute Command: on_connect'
WHERE NOT EXISTS (
        SELECT *
        FROM `db`.`Log`
        WHERE `logID` = 95
    );

INSERT INTO
    `db`.`Log` (
        `logID`,
        `sessionID`,
        `createAt`,
        `description`
    )
SELECT
    96,
    '14e933ee-9b5a-4a63-b425-9e8160dce3a10',
    '2022-07-18 15:25:18',
    'Try login: Username: root, Password: toor'
WHERE NOT EXISTS (
        SELECT *
        FROM `db`.`Log`
        WHERE `logID` = 96
    );

INSERT INTO
    `db`.`Log` (
        `logID`,
        `sessionID`,
        `createAt`,
        `description`
    )
SELECT
    97,
    '14e933ee-9b5a-4a63-b425-9e8160dce3a11',
    '2022-07-18 15:26:18',
    'Try login: Username: Admin, Password: Admin'
WHERE NOT EXISTS (
        SELECT *
        FROM `db`.`Log`
        WHERE `logID` = 97
    );

INSERT INTO
    `db`.`Log` (
        `logID`,
        `sessionID`,
        `createAt`,
        `description`
    )
SELECT
    98,
    '14e933ee-9b5a-4a63-b425-9e8160dce3a12',
    '2022-07-18 15:27:18',
    'Try login: Username: user, Password: 123456'
WHERE NOT EXISTS (
        SELECT *
        FROM `db`.`Log`
        WHERE `logID` = 98
    );

INSERT INTO
    `db`.`Log` (
        `logID`,
        `sessionID`,
        `createAt`,
        `description`
    )
SELECT
    99,
    '14e933ee-9b5a-4a63-b425-9e8160dce3a13',
    '2022-07-18 15:28:18',
    'Try login: Username: user, Password: resu'
WHERE NOT EXISTS (
        SELECT *
        FROM `db`.`Log`
        WHERE `logID` = 99
    );

INSERT INTO
    `db`.`Log` (
        `logID`,
        `sessionID`,
        `createAt`,
        `description`
    )
SELECT
    100,
    '14e933ee-9b5a-4a63-b425-9e8160dce3a14',
    '2022-07-18 15:29:18',
    'login: Username: Tilt, Password: Tool'
WHERE NOT EXISTS (
        SELECT *
        FROM `db`.`Log`
        WHERE `logID` = 100
    );

INSERT INTO
    `db`.`Log` (
        `logID`,
        `sessionID`,
        `createAt`,
        `description`
    )
SELECT
    101,
    '14e933ee-9b5a-4a63-b425-9e8160dce3a15',
    '2022-07-18 15:30:18',
    'Route: Users Details'
WHERE NOT EXISTS (
        SELECT *
        FROM `db`.`Log`
        WHERE `logID` = 101
    );

INSERT INTO
    `db`.`Log` (
        `logID`,
        `sessionID`,
        `createAt`,
        `description`
    )
SELECT
    102,
    '14e933ee-9b5a-4a63-b425-9e8160dce3a16',
    '2022-07-18 15:31:18',
    'Route: Company Employments Details'
WHERE NOT EXISTS (
        SELECT *
        FROM `db`.`Log`
        WHERE `logID` = 102
    );

INSERT INTO
    `db`.`Log` (
        `logID`,
        `sessionID`,
        `createAt`,
        `description`
    )
SELECT
    103,
    '14e933ee-9b5a-4a63-b425-9e8160dce3a17',
    '2022-07-18 15:32:18',
    'Route: Administrator Details'
WHERE NOT EXISTS (
        SELECT *
        FROM `db`.`Log`
        WHERE `logID` = 103
    );