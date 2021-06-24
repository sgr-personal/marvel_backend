ALTER TABLE `users` ADD `is_agent` INT(11) NOT NULL DEFAULT '0' AFTER `password`;
ALTER TABLE `users` ADD `commission` DECIMAL(12,2) NOT NULL DEFAULT '0' AFTER `is_agent`;
ALTER TABLE `users` CHANGE `city` `city` TEXT CHARACTER SET utf8 COLLATE utf8_general_ci NULL;
ALTER TABLE `users` CHANGE `area` `area` TEXT CHARACTER SET utf8 COLLATE utf8_general_ci NULL;
ALTER TABLE `users` CHANGE `street` `street` TEXT CHARACTER SET utf8 COLLATE utf8_general_ci NULL;
ALTER TABLE `users` CHANGE `pincode` `pincode` VARCHAR(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL;
ALTER TABLE `users` CHANGE `apikey` `apikey` VARCHAR(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL;
ALTER TABLE `users` CHANGE `referral_code` `referral_code` VARCHAR(28) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL;
ALTER TABLE `users` CHANGE `fcm_id` `fcm_id` VARCHAR(256) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL;
