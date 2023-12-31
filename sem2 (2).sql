-- 1. Создаем БД с именем lesson_2
CREATE DATABASE IF NOT EXISTS lesson_2;

-- 2. Использование БД
USE lesson_2;

-- 3. Создаем таблицу 
DROP TABLE IF EXISTS movie; -- `имя_объекта` - буква ё на англ. раскладке
CREATE TABLE movie
(
	`id` INT PRIMARY KEY AUTO_INCREMENT, -- PRIMARY KEY = UNIQUE NOT NULL
    `title` VARCHAR(45) NOT NULL,
    `title_eng` VARCHAR(45),
    `release_year`YEAR, -- YYYY: 2023
    `count_min` INT,
    `storyline` TEXT
);
INSERT INTO movie (title, title_eng, release_year, count_min, storyline)
VALUES 
	('Игры разума', 'A Beautiful Mind', 2001, 135, 'От всемирной известности до греховных глубин — все это познал на своей шкуре Джон Форбс Нэш-младший. Математический гений, он на заре своей карьеры сделал титаническую работу в области теории игр, которая перевернула этот раздел математики и практически принесла ему международную известность. Однако буквально в то же время заносчивый и пользующийся успехом у женщин Нэш получает удар судьбы, который переворачивает уже его собственную жизнь.'),
	('Форрест Гамп', 'Forrest Gump', 1994, 142, 'Сидя на автобусной остановке, Форрест Гамп — не очень умный, но добрый и открытый парень — рассказывает случайным встречным историю своей необыкновенной жизни. С самого малолетства парень страдал от заболевания ног, соседские мальчишки дразнили его, но в один прекрасный день Форрест открыл в себе невероятные способности к бегу. Подруга детства Дженни всегда его поддерживала и защищала, но вскоре дороги их разошлись.'),
	('Иван Васильевич меняет профессию', NULL, 1998, 128,'Инженер-изобретатель Тимофеев сконструировал машину времени, которая соединила его квартиру с далеким шестнадцатым веком - точнее, с палатами государя Ивана Грозного. Туда-то и попадают тезка царя пенсионер-общественник Иван Васильевич Бунша и квартирный вор Жорж Милославский. На их место в двадцатом веке «переселяется» великий государь. Поломка машины приводит ко множеству неожиданных и забавных событий...'),
	('Назад в будущее', 'Back to the Future', 1985, 116, 'Подросток Марти с помощью машины времени, сооружённой его другом-профессором доком Брауном, попадает из 80-х в далекие 50-е. Там он встречается со своими будущими родителями, ещё подростками, и другом-профессором, совсем молодым.'),
	('Криминальное чтиво', 'Pulp Fiction', 1994, 154, NULL);

SELECT * FROM movie;
--  DDL: CREATE, DROP, ALTER, RENAME, TRUNCATE(Очистка таблицы от данных, остаются только н-я столбцов)
--  DML: INSERT, DELETE, UPDATE, SELECT 

-- Переименовать таблицу: RENAME TABLE old_name TO new_name;
DROP TABLE IF EXISTS film;
RENAME TABLE movie TO film; -- movie теперь называется film

SHOW FULL TABLES; -- Посмотреть список всех таблиц в БД 


-- ALTER TABLE 
ALTER TABLE film
ADD test INT DEFAULT 100, -- Все строчки в столбце test равны значению 100
ADD price INT DEFAULT 250;

ALTER TABLE film
DROP test;


-- TRUNCATE TABLE film; 

-- UPDATE, DELETE 
UPDATE film
SET price = price + 150 -- 250 + 150; price = 400
WHERE title = "Иван Васильевич меняет профессию"; 

DELETE FROM film
WHERE title = "Криминальное чтиво"; 

SELECT * FROM film;

-- Добавлю новый столбец, в котором будет храниться статус оплаты: 1 - оплата на сайте, 0 - не оплатили онлайн
ALTER TABLE film
ADD payment_status INT;

UPDATE film
SET payment_status = RAND(); -- Диапазон от 0 до 1

SELECT * FROM film;
/*
SELECT FLOOR(RAND() * 100 - RAND() * RAND()*5); -- floor - в меньшую сторону
SELECT FLOOR(2.5);
SELECT ceiling(2.5); -- ceiling - в большую сторону
*/

SELECT 
	id AS "Номер фильма",
    title AS "Название",
    payment_status AS "Статус оплаты", -- Перед CASE ставится запятая 
CASE
	WHEN payment_status = 0 
		THEN "Заказ не оплачен, оплатите его"
	WHEN payment_status = 1 
		THEN "Заказ оплачен :)"
	ELSE "Ошибка оплаты" -- payment_status != 0 и payment_status != 1 
END AS "Комментарий"
FROM film;

-- IF (условие, знач_для_ист, знч_для_лжи)
SELECT IF(200 > 100, "+", "-") AS "результат";

-- Тип фильма: 
-- До 50 минут - короткометражка 
-- 50 - 140 минут - среднеметражка 
-- 141 - 150 - полнометражка 
-- 150+ - "в кино не идем" 

SELECT 
	title,
    count_min,
    IF(count_min < 50, "короткометражка",
		IF(count_min <= 140, "среднеметражка",
			IF(count_min <= 150,"полнометражка", "в кино не идем")))
	AS "Тип фильма"
FROM film;
            
ALTER TABLE movie
ADD COLUMN test INT,
ADD price INT DEFAULT 100;

SELECT * FROM movie;

ALTER TABLE movie
DROP test;

UPDATE movie
SET price = prce +150
WHERE title = "Иван Васильевич меняет профессию";

ALTER TABLE movie
ADD payment_status INT;

UPDATE movie
SET payment_status = RAND();
SELECT * FROM movie;

SELECT
	id AS "Nomer filma",
    title,
    payment_status,
    CASE
		WHEN payment_status = 1
			THEN "zakaz oplachen online"
		WHEN payment_status = 0
			THEN "zakaz online ne oplachen"
		ELSE "Error"
	END AS result
FROM movie;