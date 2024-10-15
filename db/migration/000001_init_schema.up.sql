CREATE TABLE accounts (
  `id` int(32) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `owner` varchar(32) not null,
  `balance` double(16,7) NOT NULL,
  `currency` varchar(3) NOT NULL,
  `status` int(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
);

CREATE TABLE entries (
  `id` int(64) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `account_id` int(32) NOT NULL,
  `amount` double(16, 7) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
);

CREATE TABLE `transfers` (
  `id` int(128) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `from_account_id` int(32) NOT NULL,
  `to_account_id` int(32) NOT NULL,
  `amount` double(16, 7) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
);

ALTER table `entries` ADD FOREIGN KEY (`account_id`) REFERENCES `accounts`(`id`);
ALTER TABLE `transfers` ADD FOREIGN KEY (`from_account_id`) REFERENCES `accounts`(`id`);
ALTER TABLE `transfers` ADD FOREIGN KEY (`to_account_id`) REFERENCES `accounts`(`id`);

CREATE INDEX IDX01 ON `accounts`(`owner`);
CREATE INDEX IDX02 ON `entries`(`account_id`);
CREATE INDEX IDX03 ON `transfers`(`from_account_id`);
CREATE INDEX IDX04 ON `transfers`(`to_account_id`);
CREATE INDEX IDX05 ON `transfers`(`from_account_id`, `to_account_id`);
