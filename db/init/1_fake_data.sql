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