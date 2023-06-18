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