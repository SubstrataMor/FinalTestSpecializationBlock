DROP DATABASE IF EXISTS `human_friends`;

-- Создаем базу данных "human_friends"
CREATE DATABASE IF NOT EXISTS `human_friends`;

USE `human_friends`;

-- Создаем таблицу "animals"
CREATE TABLE `animals` (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY UNIQUE,
  animals_class VARCHAR(30)
);

-- Создаем низкоуровневые таблицы с внешним ключом на таблицу "animals"
CREATE TABLE `dogs` (
   id INT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE,
  `name` VARCHAR(50) NOT NULL,
  `ability` VARCHAR(100) NOT NULL,
  `birthday` DATE NOT NULL,
  `animal_id` INT UNSIGNED NOT NULL,
  FOREIGN KEY (`animal_id`) REFERENCES `animals` (`id`) ON DELETE CASCADE
);

CREATE TABLE `cats` (
   id INT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE,
  `name` VARCHAR(50) NOT NULL,
  `ability` VARCHAR(100) NOT NULL,
  `birthday` DATE NOT NULL,
  `animal_id` INT UNSIGNED NOT NULL,
  FOREIGN KEY (`animal_id`) REFERENCES `animals` (`id`) ON DELETE CASCADE
);

CREATE TABLE `hamsters` (
   id INT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE,
  `name` VARCHAR(50) NOT NULL,
  `ability` VARCHAR(100) NOT NULL,
  `birthday` DATE NOT NULL,
  `animal_id` INT UNSIGNED NOT NULL,
  FOREIGN KEY (`animal_id`) REFERENCES `animals` (`id`) ON DELETE CASCADE
);

CREATE TABLE `horses` (
   id INT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE,
  `name` VARCHAR(50) NOT NULL,
  `ability` VARCHAR(100) NOT NULL,
  `birthday` DATE NOT NULL,
  `animal_id` INT UNSIGNED NOT NULL,
  FOREIGN KEY (`animal_id`) REFERENCES `animals` (`id`) ON DELETE CASCADE
);

CREATE TABLE `camels` (
   id INT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE,
  `name` VARCHAR(50) NOT NULL,
  `ability` VARCHAR(100) NOT NULL,
  `birthday` DATE NOT NULL,
  `animal_id` INT UNSIGNED NOT NULL,
  FOREIGN KEY (`animal_id`) REFERENCES `animals` (`id`) ON DELETE CASCADE
);

CREATE TABLE `donkeys` (
   id INT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE,
  `name` VARCHAR(50) NOT NULL,
  `ability` VARCHAR(100) NOT NULL,
  `birthday` DATE NOT NULL,
  `animal_id` INT UNSIGNED NOT NULL,
  FOREIGN KEY (`animal_id`) REFERENCES `animals` (`id`) ON DELETE CASCADE
);

-- Заполняем таблицу "animals"
INSERT INTO `human_friends`.`animals` (`id`, `animals_class`) VALUES ('1', 'pet'),('2', 'wild');

-- Заполнить низкоуровневые таблицы именами(животных), командами которые они выполняют и датами рождения
-- Заполняем таблицу "dogs"
INSERT INTO `human_friends`.`dogs` (`name`, `ability`, `birthday`, `animal_id`) VALUES
  ('Bobik', 'Sit, Give paw', '2016-08-25', 1),
  ('Sharik', 'Lie', '2020-06-06', 1),
  ('Muhtar', 'Voice, Aport', '2021-02-02', 1),
  ('Max', 'Sit, Stay', '2019-10-10', 1),
  ('Belka', 'Lie, Face', '2018-12-12', 1);

-- Заполняем таблицу "cats"
INSERT INTO `human_friends`.`cats` (`name`, `ability`, `birthday`, `animal_id`) VALUES
  ('Tom', 'Sleep, Give paw', '2017-02-03', 1),
  ('Alex', 'Meow, Sleep', '2018-04-05', 1),
  ('Keks', 'Meow', '2019-06-07', 1),
  ('Oscar', 'Sleep, Jump', '2020-08-09', 1),
  ('Barsik', 'Play', '2021-10-11', 1);

-- Заполняем таблицу "hamsters"
INSERT INTO `human_friends`.`hamsters` (`name`, `ability`, `birthday`, `animal_id`) VALUES
  ('Ron', 'Chew', '2022-12-13', 1),
  ('Puh', 'Gnaw', '2022-01-14', 1),
  ('Sherlok', 'Chew', '2021-02-15', 1),
  ('Guffy', 'Chew, Gnaw', '2021-03-16', 1),
  ('Watson', 'Chew', '2024-01-12', 1);

-- Заполняем таблицу "horses"
INSERT INTO `human_friends`.`horses` (`name`, `ability`, `birthday`, `animal_id`) VALUES
  ('Appolon', 'Run, Jump', '2010-01-10', 2),
  ('Buran', 'Canter', '2012-02-20', 2),
  ('Vulkan', 'Run gallop', '2011-03-30', 2),
  ('Eros', 'Run gallop, Jump', '2015-04-14', 2),
  ('Zakat', 'Trot, Run', '2005-06-09', 2);

-- Заполняем таблицу "camels"
INSERT INTO `human_friends`.`camels` (`name`, `ability`, `birthday`, `animal_id`) VALUES
  ('Agata', 'Endurance', '1992-05-28', 2),
  ('Ida', 'Run', '2003-05-18', 2),
  ('Lancelot', 'Chew', '1998-01-05', 2),

-- Заполняем таблицу "donkeys"
INSERT INTO `human_friends`.`donkeys` (`name`, `ability`, `birthday`, `animal_id`) VALUES
  ('Boris', 'Stupid', '1991-12-25', 2),
  ('Bond', 'Obstinate', '2011-06-07', 2),
  ('Petr', 'Carry load', '2015-12-12', 2),
  ('Crank', 'Lose tail', '2008-08-08', 2),

-- Удаляем из таблицы верблюдов, т.к. верблюдов решили перевезти в другой питомник на зимовку.
  DROP TABLE `human_friends`.`camels`;

-- Объединяем таблицы лошади, и ослы в одну таблицу.
-- Создаем новую таблицу "horses_and_donkeys" для объединения "horses" и "donkeys"
CREATE TABLE `horses_and_donkeys` (
   id INT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE,
  `name` VARCHAR(50) NOT NULL,
  `ability` VARCHAR(100) NOT NULL,
  `birthday` DATE NOT NULL,
  `animal_id` INT UNSIGNED NOT NULL,
  `species` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`id`)
);

-- Вставляем данные из "horses" в таблицу "horses_and_donkeys"
INSERT INTO `horses_and_donkeys` (`name`, `ability`, `birthday`, `animal_id`, `species`)
SELECT `name`, `ability`, `birthday`, `animal_id`, 'Horse' AS `species`
FROM `horses`;

-- Вставляем данные из "donkeys" в таблицу "horses_and_donkeys"
INSERT INTO `horses_and_donkeys` (`name`, `ability`, `birthday`, `animal_id`, `species`)
SELECT `name`, `ability`, `birthday`, `animal_id`, 'Donkey' AS `species`
FROM `donkeys`;

-- Создаем новую таблицу "young_animals"
CREATE TABLE `young_animals` (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `name` VARCHAR(50) NOT NULL,
  `species` VARCHAR(20) NOT NULL,
  `age` INT NOT NULL
);

-- Вставляем данные из таблиц `dogs`, `cats`, `donkeys`, `hamsters`, и `horses` в таблицу `young_animals`,
-- в которую попадут все животные старше 1 года, но младше 3 лет
INSERT INTO `young_animals` (`name`, `species`, `age`)
SELECT `name`, 'Dog' AS `species`, TIMESTAMPDIFF(MONTH, `birthday`, CURDATE()) AS `age`
FROM `dogs`
WHERE `birthday` <= DATE_SUB(CURDATE(), INTERVAL 1 YEAR) AND `birthday` >= DATE_SUB(CURDATE(), INTERVAL 3 YEAR);

INSERT INTO `young_animals` (`name`, `species`, `age`)
SELECT `name`, 'Cat' AS `species`, TIMESTAMPDIFF(MONTH, `birthday`, CURDATE()) AS `age`
FROM `cats`
WHERE `birthday` <= DATE_SUB(CURDATE(), INTERVAL 1 YEAR) AND `birthday` >= DATE_SUB(CURDATE(), INTERVAL 3 YEAR);

INSERT INTO `young_animals` (`name`, `species`, `age`)
SELECT `name`, 'Donkey' AS `species`, TIMESTAMPDIFF(MONTH, `birthday`, CURDATE()) AS `age`
FROM `donkeys`
WHERE `birthday` <= DATE_SUB(CURDATE(), INTERVAL 1 YEAR) AND `birthday` >= DATE_SUB(CURDATE(), INTERVAL 3 YEAR);

INSERT INTO `young_animals` (`name`, `species`, `age`)
SELECT `name`, 'Hamster' AS `species`, TIMESTAMPDIFF(MONTH, `birthday`, CURDATE()) AS `age`
FROM `hamsters`
WHERE `birthday` <= DATE_SUB(CURDATE(), INTERVAL 1 YEAR) AND `birthday` >= DATE_SUB(CURDATE(), INTERVAL 3 YEAR);

INSERT INTO `young_animals` (`name`, `species`, `age`)
SELECT `name`, 'Horse' AS `species`, TIMESTAMPDIFF(MONTH, `birthday`, CURDATE()) AS `age`
FROM `horses`
WHERE `birthday` <= DATE_SUB(CURDATE(), INTERVAL 1 YEAR) AND `birthday` >= DATE_SUB(CURDATE(), INTERVAL 3 YEAR);

-- Объединяем все таблицы в одну, при этом сохраняя поля, указывающие на прошлую принадлежность к старым таблицам.
-- Создаем новую таблицу "all_animals"
CREATE TABLE `all_animals` (
   id INT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE,
  `name` VARCHAR(50) NOT NULL,
  `ability` VARCHAR(100) NOT NULL,
  `birthday` DATE NOT NULL,
  `animal_id` INT UNSIGNED NOT NULL,
  `source_table` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`id`)
);

-- Вставляем данные из таблиц `dogs`, `cats`, `donkeys`, `hamsters`, и `horses` в таблицу `all_animals`
INSERT INTO `all_animals` (`name`, `ability`, `birthday`, `animal_id`, `source_table`)
SELECT `name`, `ability`, `birthday`, `animal_id`, 'dogs' AS `source_table`
FROM `dogs`;

INSERT INTO `all_animals` (`name`, `ability`, `birthday`, `animal_id`, `source_table`)
SELECT `name`, `ability`, `birthday`, `animal_id`, 'cats' AS `source_table`
FROM `cats`;

INSERT INTO `all_animals` (`name`, `ability`, `birthday`, `animal_id`, `source_table`)
SELECT `name`, `ability`, `birthday`, `animal_id`, 'donkeys' AS `source_table`
FROM `donkeys`;

INSERT INTO `all_animals` (`name`, `ability`, `birthday`, `animal_id`, `source_table`)
SELECT `name`, `ability`, `birthday`, `animal_id`, 'hamsters' AS `source_table`
FROM `hamsters`;

INSERT INTO `all_animals` (`name`, `ability`, `birthday`, `animal_id`, `source_table`)
SELECT `name`, `ability`, `birthday`, `animal_id`, 'horses' AS `source_table`
FROM `horses`;
