DROP DATABASE IF EXISTS homework_lesson_6;
CREATE DATABASE IF NOT EXISTS homework_lesson_6;
USE homework_lesson_6;

/* 
Создайте процедуру, которая принимает кол-во сек и формат их в кол-во дней часов. 
Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds '
*/
DELIMITER //
CREATE PROCEDURE proc(num INT)
	BEGIN
		-- SELECT SEC_TO_TIME(num);
        SELECT 
			ROUND(num/60/60/24) AS Day, 
			ROUND(num/60/60 % 24) AS Hour,
			ROUND(num/60 % 60) AS Minute, 
			ROUND(num % 60) AS Second;
	END //
DELIMITER ;

CALL proc(123456);

/*
Создайте функцию, которая выводит только четные числа от 1 до 10. 
Пример: 2,4,6,8,10
*/
DELIMITER //
CREATE FUNCTION func()
RETURNS VARCHAR(50)
DETERMINISTIC
BEGIN
	DECLARE result VARCHAR(50) DEFAULT '';
	DECLARE i INT DEFAULT 2;
    WHILE i <= 10 DO
		SET result = CONCAT(result, i, ' '); 
		SET i = i + 2;
	END WHILE;
    RETURN result;
END //
DELIMITER ;

SELECT func() AS result;