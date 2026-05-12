create database simulado_1

use simulado_1


CREATE TABLE IF NOT EXISTS `simulado_1`.`users` (
  `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `email_verified_at` TIMESTAMP NULL DEFAULT NULL,
  `password` VARCHAR(255) NOT NULL,
  `remember_token` VARCHAR(100) NULL DEFAULT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `users_email_unique` (`email` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci


CREATE TABLE IF NOT EXISTS `simulado_1`.`movimentacaos` (
  `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `quantidade` INT(11) NOT NULL,
  `data_movimentacao` DATE NOT NULL,
  `tipo` ENUM('entrada', 'saida') NOT NULL,
  `produto_id` BIGINT(20) UNSIGNED NOT NULL,
  `user_id` BIGINT(20) UNSIGNED NOT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `movimentacaos_produto_id_foreign` (`produto_id` ASC) VISIBLE,
  INDEX `movimentacaos_user_id_foreign` (`user_id` ASC) VISIBLE,
  CONSTRAINT `movimentacaos_produto_id_foreign`
    FOREIGN KEY (`produto_id`)
    REFERENCES `simulado_1`.`produtos` (`id`),
  CONSTRAINT `movimentacaos_user_id_foreign`
    FOREIGN KEY (`user_id`)
    REFERENCES `simulado_1`.`users` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci


CREATE TABLE IF NOT EXISTS `simulado_1`.`produtos` (
  `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(80) NOT NULL,
  `valor` DECIMAL(8,2) NOT NULL,
  `qtd_estoque` INT(11) NOT NULL,
  `qtd_minima` INT(11) NOT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci