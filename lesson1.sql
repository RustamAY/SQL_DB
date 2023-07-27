CREATE DATABASE IF NOT EXISTS lesson_1;

-- подключение к БД
USE lesson_1;

-- Создание таблицы Студент
DROP TABLE IF EXISTS student; -- удаляем таблицу со студентами если она существует
CREATE TABLE student
(
	id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(45),
    email VARCHAR(45) NOT NULL,
    phone VARCHAR(45)
);

-- Таблица заполняется магичискемти даными
INSERT student(first_name,email,phone)
VALUES
	("Андрей", "email@gmail.com", NULL),
    ("Антон", "fjwfjjqf@gmail.com", "6939926962"), -- id = 2
	("Артем", "fjwfjjqf@gmail.com", "+7-999-888-77-66"), -- id = 3
	("Алексей", "fjwfjjqf@gmail.com", "+7-999-888-77-66"), -- id = 4
	("Александр", "fjwfjjqf@gmail.com", "+7-999-888-77-66"), -- id = 5
	("Александра", "fjwfjjqf@gmail.com", "+7-999-888-77-66"), -- id = 6
	("Виктор", "fjwfjjqf@gmail.com", "+7-999-888-77-66"); -- id = 7
SELECT * FROM student;
-- получить информацию о студентах: имена и почты
SELECT first_name, email
FROM student;

-- получаем информацию о антоне б его почту и телефону 
SELECT email, phone, first_name
FROM student
WHERE first_name = "Антон";
    
-- Получаем данные обо всхех студентах кроме антона
SELECT email, phone, first_name
FROM student 
WHERE first_name != "Антон" -- <> и != одно и тоже

-- Найти инфо о студентахб имена которых начинаются на "А"
SELECT email, phone, first_name
FROM student
WHERE	first_name LIKE "а%";