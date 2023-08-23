CREATE DATABASE IF NOT EXISTS hw5;
USE hw5;

CREATE TABLE cars
(
	id INT NOT NULL PRIMARY KEY,
    name VARCHAR(45),
    cost INT
);

INSERT cars
VALUES
	(1, "Audi", 52642),
    (2, "Mercedes", 57127 ),
    (3, "Skoda", 9000 ),
    (4, "Volvo", 29000),
	(5, "Bentley", 350000),
    (6, "Citroen ", 21000 ), 
    (7, "Hummer", 41400), 
    (8, "Volkswagen ", 21600);
    
CREATE VIEW cars_view AS
(
	SELECT *
    FROM cars
    WHERE cost < 25000
);

SELECT * FROM cars_view;

ALTER VIEW cars_view AS
(
	SELECT *
    FROM cars
    WHERE cost < 30000
);

SELECT * FROM cars_view;

CREATE VIEW cars_view2 AS
(
	SELECT *
    FROM cars
    WHERE name IN ("Skoda", "Audi")
);

SELECT * FROM cars_view2;