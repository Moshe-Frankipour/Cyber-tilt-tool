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

/* Service */

/* FTP */

INSERT INTO
    `db`.`Service` (
        `serviceID`,
        `name`,
        `description`
    )
SELECT
    1,
    'FTP',
    'The File Transfer Protocol (FTP) is a standard communication protocol used for the transfer of computer files from a server to a client on a computer network. FTP is built on a client–server model architecture using separate control and data connections between the client and the server.',
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
    2,
    'SMTP',
    'The Simple Mail Transfer Protocol (SMTP) is an Internet standard communication protocol for electronic mail transmission. Mail servers and other message transfer agents use SMTP to send and receive mail messages.',
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
    3,
    'HTTP',
    'The Hypertext Transfer Protocol (HTTP) is an application layer protocol in the Internet protocol suite model for distributed, collaborative, hypermedia information systems.[1] HTTP is the foundation of data communication for the World Wide Web, where hypertext documents include hyperlinks to other resources that the user can easily access, for example by a mouse click or by tapping the screen in a web browser.',
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
    4,
    'SSH',
    'The Secure Shell Protocol (SSH) is a cryptographic network protocol for operating network services securely over an unsecured network.[1] Its most notable applications are remote login and command-line execution.',
WHERE NOT EXISTS (
        SELECT *
        FROM `db`.`Service`
        WHERE `name` = 'SSH'
    );

/* Create Traps  */

/* Create Log */