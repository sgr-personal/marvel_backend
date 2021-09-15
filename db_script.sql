ALTER TABLE `products` ADD `profession_id` VARCHAR(255) NULL DEFAULT NULL AFTER `subcategory_id`;

ALTER TABLE `products` ADD `commission` DECIMAL(10,2) NOT NULL DEFAULT '0' AFTER `description`;

/* ======================================== Dt 29 JUL 21 ======================================== */
ALTER TABLE `category` ADD `description` LONGTEXT NULL AFTER `web_image`;
/* ======================================== Ends ======================================== */
