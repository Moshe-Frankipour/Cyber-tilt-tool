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

/* Create Service */

/* FTP Service */

INSERT INTO
    `db`.`Service` (
        `serviceID`,
        `name`,
        `port`,
        `description`
    )
SELECT
    1,
    'FTP_Intel',
    2121,
    'FTP Service - Intel'
WHERE NOT EXISTS (
        SELECT *
        FROM `db`.`Company`
        WHERE
            `name` = 'FTP_Intel'
    );

INSERT INTO
    `db`.`Service` (
        `serviceID`,
        `name`,
        `port`,
        `description`
    )
SELECT
    2,
    'FTP_Apple',
    2122,
    'FTP Service - Apple'
WHERE NOT EXISTS (
        SELECT *
        FROM `db`.`Company`
        WHERE
            `name` = 'FTP_Apple'
    );

/* SMTP Service */

INSERT INTO
    `db`.`Service` (
        `serviceID`,
        `name`,
        `port`,
        `description`
    )
SELECT
    3,
    'SMTP_Intel',
    2525,
    'SMTP Service - Intel'
WHERE NOT EXISTS (
        SELECT *
        FROM `db`.`Company`
        WHERE
            `name` = 'SMTP_Intel'
    );

/* HTTP Service */

INSERT INTO
    `db`.`Service` (
        `serviceID`,
        `name`,
        `port`,
        `description`
    )
SELECT
    4,
    'HTTP_Apple',
    8080,
    'HTTP Service - Apple'
WHERE NOT EXISTS (
        SELECT *
        FROM `db`.`Company`
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
        `description`
    )
SELECT
    5,
    'SSH_Intel',
    2222,
    'SSH Service - Intel'
WHERE NOT EXISTS (
        SELECT *
        FROM `db`.`Company`
        WHERE
            `name` = 'SSH_Intel'
    );

/* Create linking_company_service */

/* FTP_Intel */

INSERT INTO
    `db`.`linking_company_service` (
        `id`,
        `company_id`,
        `service_id`,
    )
SELECT 1, 2, 1
WHERE NOT EXISTS (
        SELECT *
        FROM `db`.`Company`
        WHERE
            `company_id` = 2
            AND `service_id` = 1
    );

/* FTP_Apple */

INSERT INTO
    `db`.`linking_company_service` (
        `id`,
        `company_id`,
        `service_id`,
    )
SELECT 1, 3, 2
WHERE NOT EXISTS (
        SELECT *
        FROM `db`.`Company`
        WHERE
            `company_id` = 3
            AND `service_id` = 2
    );

/* HTTP_Apple */

INSERT INTO
    `db`.`linking_company_service` (
        `id`,
        `company_id`,
        `service_id`,
    )
SELECT 1, 3, 4
WHERE NOT EXISTS (
        SELECT *
        FROM `db`.`Company`
        WHERE
            `company_id` = 3
            AND `service_id` = 4
    );

/* SMTP_Intel */

INSERT INTO
    `db`.`linking_company_service` (
        `id`,
        `company_id`,
        `service_id`,
    )
SELECT 1, 2, 3
WHERE NOT EXISTS (
        SELECT *
        FROM `db`.`Company`
        WHERE
            `company_id` = 2
            AND `service_id` = 3
    );

/* SSH_Intel */

INSERT INTO
    `db`.`linking_company_service` (
        `id`,
        `company_id`,
        `service_id`,
    )
SELECT 1, 2, 5
WHERE NOT EXISTS (
        SELECT *
        FROM `db`.`Company`
        WHERE
            `company_id` = 2
            AND `service_id` = 5
    );

/* Create Traps */

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
    'name',
    1,
    'Trap des',
    1
WHERE NOT EXISTS (
        SELECT *
        FROM `db`.`Company`
        WHERE `name` = 'SSH'
    );