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
    1,
    '$2b$12$bnaCG6/wApivYZpfTrLm4O5YyRqKZSjla1WxJH2mknKHaWfXuESqi',
    'User1 Intel',
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
    1,
    '$2b$12$bnaCG6/wApivYZpfTrLm4O5YyRqKZSjla1WxJH2mknKHaWfXuESqi',
    'User1 Apple',
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
            email = 'user1@intel.com'
    );

/* Create Service */

/* FTP Service */

INSERT INTO
    `db`.`Service` (
        `serviceID`,
        `name`,
        `port`,
        `description`,
        `companyID`
    )
SELECT
    1,
    'FTP_Intel',
    2121,
    'FTP Service - Intel',
    2
WHERE NOT EXISTS (
        SELECT *
        FROM `db`.`Service`
        WHERE
            `name` = 'FTP_Intel'
    );

INSERT INTO
    `db`.`Service` (
        `serviceID`,
        `name`,
        `port`,
        `description`,
        `companyID`
    )
SELECT
    2,
    'FTP_Apple',
    2122,
    'FTP Service - Apple',
    3
WHERE NOT EXISTS (
        SELECT *
        FROM `db`.`Service`
        WHERE
            `name` = 'FTP_Apple'
    );

/* SMTP Service */

INSERT INTO
    `db`.`Service` (
        `serviceID`,
        `name`,
        `port`,
        `description`,
        `companyID`
    )
SELECT
    3,
    'SMTP_Intel',
    2525,
    'SMTP Service - Intel',
    2
WHERE NOT EXISTS (
        SELECT *
        FROM `db`.`Service`
        WHERE
            `name` = 'SMTP_Intel'
    );

/* HTTP Service */

INSERT INTO
    `db`.`Service` (
        `serviceID`,
        `name`,
        `port`,
        `description`,
        `companyID`
    )
SELECT
    4,
    'HTTP_Apple',
    8080,
    'HTTP Service - Apple',
    3
WHERE NOT EXISTS (
        SELECT *
        FROM `db`.`Service`
        WHERE
            `name` = 'HTTP_Apple'
    );

/* HTTP Service */

/* SSH Service */

INSERT INTO
    `db`.`Service` (
        `serviceID`,
        `name`,
        `port`,
        `description`,
        `companyID`
    )
SELECT
    5,
    'SSH_Intel',
    2222,
    'SSH Service - Intel',
    2
WHERE NOT EXISTS (
        SELECT *
        FROM `db`.`Service`
        WHERE
            `name` = 'SSH_Intel'
    );

/* Create Traps  */

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
    'Fake Admin',
    4,
    'We will hide the username and password of an admin user in a way that is easy for a hacker to reach.',
    1
WHERE NOT EXISTS (
        SELECT *
        FROM `db`.`Trap`
        WHERE
            `name` = 'Fake Admin'
    );

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
    4,
    'If a user enters one of the forbidden characters, we will know that he wants to break into our system and we will direct him to an alternative site.',
    1
WHERE NOT EXISTS (
        SELECT *
        FROM `db`.`Trap`
        WHERE
            `name` = 'SQL Injection'
    );

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
    'Super Admin - FTP_Apple',
    2,
    'If an email enters the server from an unidentified address on the same server (ie a fictitious address), the server will understand that there is impersonation and the senders data will be written in a database as a hacking attempt and the email sent will be forwarded to one of the SMTP server administrators for the purpose of checking the email.',
    1
WHERE NOT EXISTS (
        SELECT *
        FROM `db`.`Trap`
        WHERE
            `name` = 'Super Admin - FTP_Apple'
    );

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
    'Administrator fake',
    5,
    'When trying to log in with an Administrator username in Windows or another username that is set by default in the system, this will lead the hacker to a fictitious server and all his data will be recorded in a database.',
    1
WHERE NOT EXISTS (
        SELECT *
        FROM `db`.`Trap`
        WHERE
            `name` = 'Administrator fake'
    );

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
    'Admin Admin',
    1,
    'When trying to log in with the username Admin in Windows or ROOT in Linux and the password Admin in Windows or TOOR in Linux, this will lead the hacker to a fictitious server and all his data will be recorded in a database.',
    1
WHERE NOT EXISTS (
        SELECT *
        FROM `db`.`Trap`
        WHERE
            `name` = 'Admin Admin'
    );

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
    'Administrator fake',
    10,
    'When trying to log in with an Administrator username in Windows or another username that is set by default in the system, this will lead the hacker to a fictitious server and all his data will be recorded in a database.',
    1
WHERE NOT EXISTS (
        SELECT *
        FROM `db`.`Trap`
        WHERE
            `name` = 'Administrator fake'
    );

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
    'Admin Admin',
    11,
    'We will hide the username and password of an admin user in a way that is easy for a hacker to reach.',
    1
WHERE NOT EXISTS (
        SELECT *
        FROM `db`.`Trap`
        WHERE
            `name` = 'Admin Admin'
    );

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
    'Super Admin - HTTP',
    4,
    'Hiding a line of code like a back door that allows access to all data. But in practice, the access will be to fake data and the intruders details will be written in a database.',
    1
WHERE NOT EXISTS (
        SELECT *
        FROM `db`.`Trap`
        WHERE
            `name` = 'Super Admin - HTTP'
    );

INSERT INTO
    `db`.`Trap` (
        `trapID`,
        `name`,
        `serviceID`,
        `description`,
        `isActivate`
    )
SELECT
    11,
    'Super Admin - SMTP',
    3,
    'Hiding a line of code like a back door that allows access to all data. But in practice, the access will be to fake data and the intruders details will be written in a database.',
    1
WHERE NOT EXISTS (
        SELECT *
        FROM `db`.`Trap`
        WHERE
            `name` = 'Super Admin - SMTP'
    );

INSERT INTO
    `db`.`Trap` (
        `trapID`,
        `name`,
        `serviceID`,
        `description`,
        `isActivate`
    )
SELECT
    12,
    'Super Admin - FTP_Intel',
    1,
    'Hiding a line of code like a back door that allows access to all data. But in practice, the access will be to fake data and the intruders details will be written in a database.',
    1
WHERE NOT EXISTS (
        SELECT *
        FROM `db`.`Trap`
        WHERE
            `name` = 'Super Admin - FTP_Intel'
    );

INSERT INTO
    `db`.`Trap` (
        `trapID`,
        `name`,
        `serviceID`,
        `description`,
        `isActivate`
    )
SELECT
    13,
    'Super Admin - SSH',
    5,
    'Hiding a line of code like a back door that allows access to all data. But in practice, the access will be to fake data and the intruders details will be written in a database.',
    1
WHERE NOT EXISTS (
        SELECT *
        FROM `db`.`Trap`
        WHERE
            `name` = 'Super Admin - SSH'
    );

/* Create Report */

INSERT INTO
    `db`.`Report` (
        `reportID`,
        `serviceID`,
        `createAt`,
        `companyID`,
        `attackerID`,
        `trapID`,
        `sessionLogID`,
    )
SELECT
    1,
    2,
    '2023-07-10 09:15:30',
    3,
    1,
    5,
    '43d7316e-d85d-4b9f-a9b4-f3d5d4266f56'
WHERE NOT EXISTS (
        SELECT *
        FROM `db`.`Report`
        WHERE
            `sessionLogID` = '43d7316e-d85d-4b9f-a9b4-f3d5d4266f56'
    );

INSERT INTO
    `db`.`Report` (
        `reportID`,
        `serviceID`,
        `createAt`,
        `companyID`,
        `attackerID`,
        `trapID`,
        `sessionLogID`
    )
SELECT
    2,
    4,
    '2023-08-05 16:45:22',
    3,
    1,
    1,
    '5c3a7599-44c1-4a8b-9a5e-cce0e8b89175'
WHERE NOT EXISTS (
        SELECT *
        FROM `db`.`Report`
        WHERE
            `sessionLogID` = '5c3a7599-44c1-4a8b-9a5e-cce0e8b89175'
    );

INSERT INTO
    `db`.`Report` (
        `reportID`,
        `serviceID`,
        `createAt`,
        `companyID`,
        `attackerID`,
        `trapID`,
        `sessionLogID`
    )
SELECT
    3,
    1,
    '2023-09-18 12:30:55',
    2,
    1,
    4,
    '9b842c8d-6631-4e20-89f9-76a63c7e548f'
WHERE NOT EXISTS (
        SELECT *
        FROM `db`.`Report`
        WHERE
            `sessionLogID` = '9b842c8d-6631-4e20-89f9-76a63c7e548f'
    );

INSERT INTO
    `db`.`Report` (
        `reportID`,
        `serviceID`,
        `createAt`,
        `companyID`,
        `attackerID`,
        `trapID`,
        `sessionLogID`
    )
SELECT
    4,
    5,
    '2023-10-29 19:55:10',
    2,
    2,
    3,
    'a5b9319f-8e9a-4ef1-964e-57bea8769f13'
WHERE NOT EXISTS (
        SELECT *
        FROM `db`.`Report`
        WHERE
            `sessionLogID` = 'a5b9319f-8e9a-4ef1-964e-57bea8769f13'
    );

INSERT INTO
    `db`.`Report` (
        `reportID`,
        `serviceID`,
        `createAt`,
        `companyID`,
        `attackerID`,
        `trapID`,
        `sessionLogID`
    )
SELECT
    5,
    4,
    '2023-11-14 08:20:40',
    3,
    3,
    2,
    '6d887bd6-b76c-4321-9e01-87ad2d328a11'
WHERE NOT EXISTS (
        SELECT *
        FROM `db`.`Report`
        WHERE
            `sessionLogID` = '6d887bd6-b76c-4321-9e01-87ad2d328a11'
    );

INSERT INTO
    `db`.`Report` (
        `reportID`,
        `serviceID`,
        `createAt`,
        `companyID`,
        `attackerID`,
        `trapID`,
        `sessionLogID`
    )
SELECT
    6,
    3,
    '2023-12-03 14:10:25',
    2,
    4,
    5,
    'e49c89d7-2a16-4b8a-b38d-8edf6f65bbde'
WHERE NOT EXISTS (
        SELECT *
        FROM `db`.`Report`
        WHERE
            `sessionLogID` = 'e49c89d7-2a16-4b8a-b38d-8edf6f65bbde'
    );

INSERT INTO
    `db`.`Report` (
        `reportID`,
        `serviceID`,
        `createAt`,
        `companyID`,
        `attackerID`,
        `trapID`,
        `sessionLogID`
    )
SELECT
    7,
    3,
    '2022-01-06 18:40:15',
    2,
    4,
    5,
    'f86e29ac-63c9-4c49-89de-d497e1e5c5a4'
WHERE NOT EXISTS (
        SELECT *
        FROM `db`.`Report`
        WHERE
            `sessionLogID` = 'f86e29ac-63c9-4c49-89de-d497e1e5c5a4'
    );

INSERT INTO
    `db`.`Report` (
        `reportID`,
        `serviceID`,
        `createAt`,
        `companyID`,
        `attackerID`,
        `trapID`,
        `sessionLogID`
    )
SELECT
    8,
    1,
    '2022-02-17 11:25:50',
    3,
    4,
    4,
    'c4716c0f-d71b-4b7a-9e62-6c9c441c04ad'
WHERE NOT EXISTS (
        SELECT *
        FROM `db`.`Report`
        WHERE
            `sessionLogID` = 'c4716c0f-d71b-4b7a-9e62-6c9c441c04ad'
    );

INSERT INTO
    `db`.`Report` (
        `reportID`,
        `serviceID`,
        `createAt`,
        `companyID`,
        `attackerID`,
        `trapID`,
        `sessionLogID`
    )
SELECT
    9,
    4,
    '2022-03-22 06:05:12',
    3,
    5,
    1,
    '247ed0bf-3f4c-4db9-81e0-2ef4546ef2bc'
WHERE NOT EXISTS (
        SELECT *
        FROM `db`.`Report`
        WHERE
            `sessionLogID` = '247ed0bf-3f4c-4db9-81e0-2ef4546ef2bc'
    );

INSERT INTO
    `db`.`Report` (
        `reportID`,
        `serviceID`,
        `createAt`,
        `companyID`,
        `attackerID`,
        `trapID`,
        `sessionLogID`
    )
SELECT
    10,
    2,
    '2022-04-29 22:30:35',
    3,
    6,
    4,
    '1822011a-8d68-4a57-a769-970573a11c47'
WHERE NOT EXISTS (
        SELECT *
        FROM `db`.`Report`
        WHERE
            `sessionLogID` = '1822011a-8d68-4a57-a769-970573a11c47'
    );

INSERT INTO
    `db`.`Report` (
        `reportID`,
        `serviceID`,
        `createAt`,
        `companyID`,
        `attackerID`,
        `trapID`,
        `sessionLogID`
    )
SELECT
    11,
    4,
    '2022-05-15 17:50:03',
    3,
    6,
    2,
    '5e1e778e-4a8d-485e-af5b-2a24a7c672bb'
WHERE NOT EXISTS (
        SELECT *
        FROM `db`.`Report`
        WHERE
            `sessionLogID` = '5e1e778e-4a8d-485e-af5b-2a24a7c672bb'
    );

INSERT INTO
    `db`.`Report` (
        `reportID`,
        `serviceID`,
        `createAt`,
        `companyID`,
        `attackerID`,
        `trapID`,
        `sessionLogID`
    )
SELECT
    12,
    5,
    '2022-06-26 04:45:18',
    2,
    7,
    3,
    'b38cc38e-0b4c-4ef0-a2a6-3461ce5a0e4f'
WHERE NOT EXISTS (
        SELECT *
        FROM `db`.`Report`
        WHERE
            `sessionLogID` = 'b38cc38e-0b4c-4ef0-a2a6-3461ce5a0e4f'
    );

INSERT INTO
    `db`.`Report` (
        `reportID`,
        `serviceID`,
        `createAt`,
        `companyID`,
        `attackerID`,
        `trapID`,
        `sessionLogID`
    )
SELECT
    13,
    1,
    '2022-07-12 13:00:08',
    2,
    7,
    5,
    'd4ae5b16-5d6d-4cc0-b8a6-89a98f1bc9ce'
WHERE NOT EXISTS (
        SELECT *
        FROM `db`.`Report`
        WHERE
            `sessionLogID` = 'd4ae5b16-5d6d-4cc0-b8a6-89a98f1bc9ce'
    );

/* Create Log */