CREATE TABLE kayttajataulu (
    ID INT(255) AUTO_INCREMENT PRIMARY KEY,
    NIMI CHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci,
    RYHMAID CHAR(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci
) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci;

// Lisää tietokantaan kayttajataulu, johon tulee kentät: ID, NIMI, RYHMAID

ALTER DATABASE kayttajatietokanta CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci;

// Lisää tietokantaan kayttajaryhmataulu, johon tulee kentät: RYHMAID, RYHMANIMI

CREATE TABLE kayttajaryhmataulu(
    RYHMAID CHAR(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci,
    RYHMANIMI CHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci
) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci;

/* 
Lisää tietokantaan kayttajaoikeustaulu, johon tulee kentät OIKEUSID, RYHMAID, OHJELMAN_OSA, KÄYTTOOIKEUDEN_NIMI
*/

CREATE TABLE kayttajaoikeustaulu(
    OIKEUSID INT(4),
    RYHMAID CHAR(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci,
    OHJELMAN_OSA CHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci,
    KAYTTOOIKEUDEN_NIMI CHAR(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci
) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci;

/* 
Lisää Käyttäjätauluun ID, Oma nimesi (huomioi, 
ttä luot myöhemmin ryhmaid:n samalla numerolla. Voit tehdä myös päivityksen bonus)
Lisää vielä kolme muuta käyttäjää ensimmäisiin kahteen ensimmäinen ryhmaid 
ja kolmanteen toinen ryhmaid ja tiedot samalla tavalla kuin edellä.
*/

INSERT INTO kayttajatietokanta (NIMI) VALUES (Lauri Liukkonen);

// Lisää kaksi kayttajaryhmätauluun ensimmäinen on pääkäyttäjä ja toinen on loppukäyttäjä

INSERT INTO kayttajaryhmataulu (RYHMAID, RYHMANIMI)
VALUES ('001', 'Pääkäyttäjä');

/* 
Lisää Kayttajaoikeustauluun oikeuksia siten, että pääkäyttäjällä on oikeutena haku, lisäys, muutos, poisto 
Lisää Kayttajaoikeustauluun oikeuksia siten, että loppukäyttäjällä on oikeutena haku ja muutos.

*/
UPDATE kayttajatietokanta SET RYHMAID = '001' WHERE NIMI = 'Lauri Liukkonen';


kayttajataulu
+----+-----------------+---------+
| ID | NIMI            | RYHMAID |
+----+-----------------+---------+
|  1 | Lauri Liukkonen | 001     |
|  2 | Teppo Tulppu    | 001     |
|  3 | Aku Ankka       | 001     |
|  4 | Pelle Peloton   | 002     |
+----+-----------------+---------+
kayttajaryhmataulu
+---------+---------------+
| RYHMAID | RYHMANIMI     |
+---------+---------------+
| 001     | Pääkäyttäjä   |
| 002     | Loppukäyttäjä |
+---------+---------------+
kayttajaoikeustaulu
+----------+---------+--------------+---------------------+
| OIKEUSID | RYHMAID | OHJELMAN_OSA | KAYTTOOIKEUDEN_NIMI |
+----------+---------+--------------+---------------------+
|     1001 | 001     | NULL         | Haku                |
|     1002 | 001     | NULL         | Lisäys              |
|     1003 | 001     | NULL         | Muutos              |
|     1004 | 001     | NULL         | Poisto              |
|     2005 | 002     | NULL         | Haku                |
|     2006 | 002     | NULL         | Muutos              |
+----------+---------+--------------+---------------------+


SELECT * FROM kayttajataulu, kayttajaryhmataulu, kayttajaoikeustaulu
WHERE Kayttajataulu.ID=kayttajaryhmataulu.KAYTTAJAID 
   AND   Kayttajaryhmataulu.RYHMAID=Kayttajaoikeustaulu.RYHMAID
   AND   Kayttajaoikeustaulu.KAYTTOOIKEUDEN_NIMI = ’Haku’;

SELECT * FROM kayttajataulu, kayttajaryhmataulu, kayttajaoikeustaulu 
WHERE kayttajataulu.RYHMAID=kayttajaryhmataulu.RYHMAID
    AND kayttajaryhmataulu.RYHMAID=kayttajaoikeustaulu.RYHMAID
    AND kayttajaoikeustaulu.KAYTTOOIKEUDEN_NIMI = 'Haku';


CREATE DATABASE IF NOT EXISTS ravitietokanta
CHARACTER SET utf8mb4
COLLATE utf8mb4_swedish_ci;

Radan_tunnus // 1 // AI int
Radan_nimi // KUOPIO, Sorsasalo // Katso alta!

DELIMITER $$

CREATE TRIGGER before_insert_or_update_radan_nimi
BEFORE INSERT ON Radan_nimi
FOR EACH ROW
BEGIN
    SET NEW.nimi_string = CONCAT(
        UPPER(LEFT(NEW.nimi_string, LOCATE(',', NEW.nimi_string) - 1)),
        ', ',
        CONCAT(
            UPPER(SUBSTRING(NEW.nimi_string, LOCATE(',', NEW.nimi_string) + 2, 1)),
            LOWER(SUBSTRING(NEW.nimi_string, LOCATE(',', NEW.nimi_string) + 3))
        )
    );
END$$

DELIMITER $$
CREATE TRIGGER before_insert_or_update_Omistajan_nimi
BEFORE INSERT ON Hevoset
FOR EACH ROW
BEGIN





DELIMITER ;
Radan_omistaja // Kuopion Ravirata Oy // char(255)
Katuosoite // Sorsasalo char(255) capitalize
Postinumero // 70420 // int(5)
Postitoimipaikka // Kuopio // char(255) capitalize
Sijainti // Ravirata sijaitsee 5 km:n päässä Kuopion keskustasta





CREATE TABLE Raviradat (
    Radan_tunnus INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Radan_nimi CHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci COMMENT 'Trigger split, capitalize + collate',
    Radan_omistaja CHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci COMMENT 'Trigger capitalize',
    Postinumero INT(5),
    Postitoimipaikka CHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci COMMENT 'Trigger capitalize',
    Sijainti CHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci
) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci;


CREATE TABLE Raviradat (
    Radan_tunnus INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Radan_nimi CHAR(255) COMMENT 'Trigger split, capitalize + collate',
    Radan_omistaja CHAR(255) COMMENT 'Trigger capitalize',
    Postinumero INT(5),
    Postitoimipaikka CHAR(255) COMMENT 'Trigger capitalize',
    Sijainti CHAR(255)
) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci;


ALTER TABLE Raviradat
MODIFY Postinumero CHAR(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci;

ALTER TABLE Raviradat MODIFY Postinumero CHAR(5);


ALTER TABLE Raviradat
MODIFY Postinumero CHAR(5) COMMENT 'REGEXP 5 NUMERIC',
ADD CONSTRAINT chk_postinumero_numeric CHECK (Postinumero REGEXP '^[0-9]{5}$');


HEPS, Morjenttes

DELIMITER $$

CREATE TRIGGER before_insert_or_update_Radan_nimi
BEFORE INSERT ON Raviradat
FOR EACH ROW
BEGIN
    DECLARE comma_pos INT DEFAULT 0;
    DECLARE len INT DEFAULT 0;
    DECLARE transformed_name VARCHAR(255) DEFAULT '';
    DECLARE part_before_comma VARCHAR(255);
    DECLARE part_after_comma VARCHAR(255);

    -- Find the position of the first comma
    SET comma_pos = LOCATE(',', NEW.Radan_nimi);
    SET len = CHAR_LENGTH(NEW.Radan_nimi);

    -- If there is a comma in the string
    IF comma_pos > 0 THEN
        -- Extract and transform the part before the comma
        SET part_before_comma = UPPER(LEFT(NEW.Radan_nimi, comma_pos - 1));
        -- Extract and transform the part after the comma
        SET part_after_comma = CONCAT(
            UPPER(SUBSTRING(NEW.Radan_nimi, comma_pos + 2, 1)),
            LOWER(SUBSTRING(NEW.Radan_nimi, comma_pos + 3))
        );
        -- Concatenate the transformed parts
        SET transformed_name = CONCAT(part_before_comma, ', ', part_after_comma);
    ELSE
        -- If there is no comma, just capitalize the entire string
        SET transformed_name = UPPER(NEW.Radan_nimi);
    END IF;

    -- Set the transformed value to the NEW.Radan_nimi
    SET NEW.Radan_nimi = transformed_name;
END$$

DELIMITER ;


DELIMITER $$

CREATE TRIGGER before_insert_or_update_Radan_omistaja
BEFORE INSERT ON Raviradat
FOR EACH ROW
BEGIN
    DECLARE first_letter VARCHAR(1);
    DECLARE rest_of_name VARCHAR(255);
    
    SET first_letter = UPPER(LEFT(NEW.Radan_omistaja, 1));
    SET rest_of_name = LOWER(SUBSTRING(NEW.Radan_omistaja, 2));

    SET NEW.Radan_omistaja = CONCAT(first_letter, rest_of_name);
END$$

DELIMITER ;

DELIMITER $$
CREATE TRIGGER before_insert_or_update_Katuosoite
BEFORE INSERT ON Raviradat
FOR EACH ROW
BEGIN
    DECLARE first_letter VARCHAR(1);
    DECLARE rest_of_name VARCHAR(255);
    SET first_letter = UPPER(LEFT(NEW.Katuosoite, 1));
    SET rest_of_name = LOWER(SUBSTRING(NEW.Katuosoite, 2));
    SET NEW.Katuosoite = CONCAT(first_letter, rest_of_name);    
END$$

+------------------+-----------+------+-----+---------+----------------+
| Field            | Type      | Null | Key | Default | Extra          |
+------------------+-----------+------+-----+---------+----------------+
| Radan_tunnus     | int       | NO   | PRI | NULL    | auto_increment |
| Radan_nimi       | char(255) | YES  |     | NULL    |                |
| Radan_omistaja   | char(255) | YES  |     | NULL    |                |
| Katuosoite       | char(255) | YES  |     | NULL    |                |
| Postinumero      | char(5)   | YES  |     | NULL    |                |
| Postitoimipaikka | char(255) | YES  |     | NULL    |                |
| Sijainti         | char(255) | YES  |     | NULL    |                |
+------------------+-----------+------+-----+---------+----------------+
ALTER TABLE Raviradat
ADD COLUMN Katuosoite CHAR(255) AFTER Radan_omistaja;

adan_tunnus Radan_nimi
Radan_omistaja
Katuosoite Postinumero Postitoimipaikka Sijainti
1 KUOPIO, Sorsasalo
Kuopion Ravirata Oy Sorsasalo
70420
Kuopio
2 FORSSA, Pilvenmäki Forssan Seudun Hippos Pilvenmäki
30420
Forssa
Ravirata sijaitsee 5 km:n päässä Kuopion keskusta...
Ravirata sijaitsee 2 km:n päässä Forssan keskusta
3 HELSINKI, Vermo
Vermon Ravirata Oy Mäkkylä
00370
Helsinki
4 JYVÄSKYLÄ, Killerjärvi Keski-Suomen Ravirata Killerjärvi
40630
Jyväskylä
Ravirata sijaitsee 8 km Helsingin keskustasta
Ravirata sijaitsee 3 km Jyväskylän keskustasta
5 OULU, Äimärautio
Pohjolan Hevosystävät Äimärautio
90401
Oulu
3 km keskustasta etelään vanhan nelostien varrella


INSERT INTO Raviradat (Radan_nimi, Radan_omistaja, Katuosoite, Postinumero, Postitoimipaikka, Sijainti) 
VALUES ('forssa, pilvenmäki', 'Forssan Seudun Hippos', 'pilvenmäki', '30420', 'Forssa', 'Ravirata sijaitsee 2 km:n päässä Forssan keskustasta.');
INSERT INTO Raviradat (Radan_nimi, Radan_omistaja, Katuosoite, Postinumero, Postitoimipaikka, Sijainti) 
VALUES ('helsinki, vermo', 'Vermon Ravirata Oy', 'mäkkylä', '00370', 'helsinki', 'Ravirata sijaitsee 8 km:n Helsingin keskustasta.');
INSERT INTO Raviradat (Radan_nimi, Radan_omistaja, Katuosoite, Postinumero, Postitoimipaikka, Sijainti) 
VALUES ('jyväskylä, killerjärvi', 'Keski-Suomen Ravirata', 'Killerjärvi', '40630', 'jyväskylä', 'Ravirata sijaitsee 3 km:n Jyväskylän keskustasta.');
INSERT INTO Raviradat (Radan_nimi, Radan_omistaja, Katuosoite, Postinumero, Postitoimipaikka, Sijainti) 
VALUES ('oulu, äimärautio', 'Pohjolan Hevosystävät', 'äimärautio', '90401', 'oulu', '3km keskustasta etelään vanhan nelostien varrella.');
INSERT INTO Raviradat (Radan_nimi, Radan_omistaja, Katuosoite, Postinumero, Postitoimipaikka, Sijainti) 
VALUES (', ', '', '', '', '', '');
INSERT INTO Raviradat (Radan_nimi, Radan_omistaja, Katuosoite, Postinumero, Postitoimipaikka, Sijainti) 
VALUES (', ', '', '', '', '', '');
INSERT INTO Raviradat (Radan_nimi, Radan_omistaja, Katuosoite, Postinumero, Postitoimipaikka, Sijainti) 
VALUES (', ', '', '', '', '', '');


hevoset

Radan_tunnus INT
Nimi CHAR(255) // capitalize
Rotu CHAR(255) // uppercase
Emanisa CHAR(255) // capitalize
Isanisa CHAR(255) // capitalize
Syntynyt DATE 
Omistajan_nimi CHAR(255) // both uppercase
Omistajan_katuosoite // CHAR(255) uppercase
Omistajan_postinumero // CHAR(5) REGEXP
Omistajan_postitoimipaikka CHAR(255) uppercase
Ostohinta // DECIMAL(50, 2) 

CREATE TABLE Hevoset (
    Radan_tunnus INT NOT NULL PRIMARY KEY,
    Nimi CHAR(255) COMMENT 'Trigger capitalize all',
    Rotu CHAR(255) COMMENT 'Trigger first uppercase',
    Emanisa CHAR(255) COMMENT 'Trigger capitalize all',
    Isanisa CHAR(255) COMMENT 'Trigger capitalize all',
    Syntynyt DATE,
    Omistajan_nimi CHAR(255) COMMENT 'Trigger first- and surname first uppercase',
    Omistajan_katuosoite CHAR(255) COMMENT 'Trigger first uppercase',
    Omistajan_postinumero CHAR(5) COMMENT 'Regexp postal',
    Omistajan_postitoimipaikka CHAR(255) COMMENT 'First uppercase',
    Ostohinta DECIMAL(50, 2)
) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci;



-- DATANSYÖTTÖLAUSEKKEET

INSERT INTO Hevoset (Radan_tunnus, Nimi, Rotu, Emanisa, Isanisa, Syntynyt, Omistajan_nimi, Omistajan_katuosoite, Omistajan_postinumero, Omistajan_postitoimipaikka, Ostohinta) 
VALUES ('34', 'suskan tyttö', 'suomen', 'topi-kössi', 'salmer', '1995-12-21', 'tuija pakkanen', 'vesitie 4', '04200', 'kerava', '500.0') ;
INSERT INTO Hevoset (Radan_tunnus, Nimi, Rotu, Emanisa, Isanisa, Syntynyt, Omistajan_nimi, Omistajan_katuosoite, Omistajan_postinumero, Omistajan_postitoimipaikka, Ostohinta) 
VALUES ('87', 'tähti-vippe', 'suomen', 'ville-vilkas', 'b. vilunki', '1997-03-03', 'jaana mikkonen', 'saimaankatu 12', '15140', 'lahti', '1200.0') ;
INSERT INTO Hevoset (Radan_tunnus, Nimi, Rotu, Emanisa, Isanisa, Syntynyt, Omistajan_nimi, Omistajan_katuosoite, Omistajan_postinumero, Omistajan_postitoimipaikka, Ostohinta) 
VALUES ('125', 'rule the', 'lämmin', 'zumurrud', 'flashy', '2000-05-02', 'mark miettinen', 'mikontie 4', '15610', 'korpilahti', '1300.0') ;
INSERT INTO Hevoset (Radan_tunnus, Nimi, Rotu, Emanisa, Isanisa, Syntynyt, Omistajan_nimi, Omistajan_katuosoite, Omistajan_postinumero, Omistajan_postitoimipaikka, Ostohinta) 
VALUES ('145', 'dikko', 'suomen', 'm.a niku', 'turtle', '2000-12-05', 'jouko heimala', 'kotikatu 12', '15610', 'lahti', '1200.0') ;
INSERT INTO Hevoset (Radan_tunnus, Nimi, Rotu, Emanisa, Isanisa, Syntynyt, Omistajan_nimi, Omistajan_katuosoite, Omistajan_postinumero, Omistajan_postitoimipaikka, Ostohinta) 
VALUES ('165', 'speedy texas', 'lämmin', 'sorenza', 'diamond', '1997-03-09', 'pekka korpinen', 'sammonkatu 8', '15140', 'lahti', '5000.0') ;
INSERT INTO Hevoset (Radan_tunnus, Nimi, Rotu, Emanisa, Isanisa, Syntynyt, Omistajan_nimi, Omistajan_katuosoite, Omistajan_postinumero, Omistajan_postitoimipaikka, Ostohinta) 
VALUES ('235', 'excellent', 'lämmin', 'janet lee', 'popular kemp', '1999-04-16', 'marjut nieminen', 'ravitie 16', '14560', 'korpilahti', '2300.0') ;




+----------------------------+---------------+------+-----+---------+-------+
| Field                      | Type          | Null | Key | Default | Extra |
+----------------------------+---------------+------+-----+---------+-------+
| Radan_tunnus               | int           | NO   | PRI | NULL    |       |
| Nimi                       | char(255)     | YES  |     | NULL    |       |
| Rotu                       | char(255)     | YES  |     | NULL    |       |
| Emanisa                    | char(255)     | YES  |     | NULL    |       |
| Isanisa                    | char(255)     | YES  |     | NULL    |       |
| Syntynyt                   | date          | YES  |     | NULL    |       |
| Omistajan_nimi             | char(255)     | YES  |     | NULL    |       |
| Omistajan_katuosoite       | char(255)     | YES  |     | NULL    |       |
| Omistajan_postinumero      | char(5)       | YES  |     | NULL    |       |
| Omistajan_postitoimipaikka | char(255)     | YES  |     | NULL    |       |
| Ostohinta                  | decimal(50,2) | YES  |     | NULL    |       |
+----------------------------+---------------+------+-----+---------+-------+

-- TRIGGEREIDEN TARKISTUS
SELECT TRIGGER_NAME, EVENT_MANIPULATION, EVENT_OBJECT_TABLE, ACTION_STATEMENT, ACTION_TIMING
FROM information_schema.TRIGGERS
WHERE EVENT_OBJECT_TABLE = 'Hevoset' AND TRIGGER_SCHEMA = 'Ravitietokanta';

-- TRIGGERIN DROPPAUS (POISTO)
DROP TRIGGER triggerin_Nimi;


-- NIMI KOKO HÖSKÄ UPPERCASE TRIGGER
DELIMITER $$

CREATE TRIGGER before_insert_or_update_Nimi
BEFORE INSERT ON Hevoset
FOR EACH ROW
BEGIN
    SET NEW.Nimi = UPPER(NEW.Nimi);
END$$

DELIMITER;

-- ROTU EKA KIRJAIN ISO TRIGGER

DELIMITER $$
CREATE TRIGGER before_insert_or_update_Rotu
BEFORE INSERT ON Hevoset
FOR EACH ROW
BEGIN
    DECLARE first_letter VARCHAR(1);
    DECLARE rest_of_name VARCHAR(255);
    SET first_letter = UPPER(LEFT(NEW.Rotu, 1));
    SET rest_of_name = LOWER(SUBSTRING(NEW.Rotu, 2));
    SET NEW.Rotu = CONCAT(first_letter, rest_of_name);    
END$$
DELIMITER;

-- EMANISA KOKO HÖSKÄ UPPERCASE TRIGGER
DELIMITER $$

CREATE TRIGGER before_insert_or_update_Emanisa
BEFORE INSERT ON Hevoset
FOR EACH ROW
BEGIN
    SET NEW.Emanisa = UPPER(NEW.Emanisa);
END$$

DELIMITER ;


-- ISANISA KOKO HÖSKÄ UPPERCASE TRIGGER
DELIMITER $$

CREATE TRIGGER before_insert_or_update_Isanisa
BEFORE INSERT ON Hevoset
FOR EACH ROW
BEGIN
    SET NEW.Isanisa = UPPER(NEW.Isanisa);
END$$

DELIMITER ;

-- Omistajan nimi molemmat isoiksi alkukirjaimiksi

DELIMITER $$

CREATE TRIGGER before_insert_or_update_Omistajan_nimi
BEFORE INSERT ON Hevoset
FOR EACH ROW
BEGIN
    DECLARE first_name VARCHAR(255);
    DECLARE last_name VARCHAR(255);
    DECLARE full_name VARCHAR(255);

    -- Extract and capitalize the first name
    SET first_name = CONCAT(UPPER(LEFT(SUBSTRING_INDEX(NEW.Omistajan_nimi, ' ', 1), 1)), 
                            LOWER(SUBSTRING(SUBSTRING_INDEX(NEW.Omistajan_nimi, ' ', 1), 2)));

    -- Extract and capitalize the last name
    SET last_name = CONCAT(UPPER(LEFT(SUBSTRING_INDEX(NEW.Omistajan_nimi, ' ', -1), 1)), 
                           LOWER(SUBSTRING(SUBSTRING_INDEX(NEW.Omistajan_nimi, ' ', -1), 2)));

    -- Combine first name and last name
    SET full_name = CONCAT(first_name, ' ', last_name);

    -- Set the capitalized full name to the column
    SET NEW.Omistajan_nimi = full_name;
END$$

DELIMITER ;
-- Katuosoite eka kirjain iso

DELIMITER $$
CREATE TRIGGER before_insert_or_update_Omistajan_katuosoite
BEFORE INSERT ON Hevoset
FOR EACH ROW
BEGIN
    DECLARE first_letter VARCHAR(1);
    DECLARE rest_of_name VARCHAR(255);
    SET first_letter = UPPER(LEFT(NEW.Omistajan_katuosoite, 1));
    SET rest_of_name = LOWER(SUBSTRING(NEW.Omistajan_katuosoite, 2));
    SET NEW.Omistajan_katuosoite = CONCAT(first_letter, rest_of_name);    
END$$

-- Postiosoite REGEXP
ALTER TABLE Hevoset
MODIFY Omistajan_postinumero CHAR(5) COMMENT 'REGEXP 5 NUMERIC',
ADD CONSTRAINT chk_omistajan_postinumero_numeric CHECK (Omistajan_postinumero REGEXP '^[0-9]{5}$');

-- Rajoitteiden tarkistus
-- LISÄÄN MYÖHEMMIN
-- :)

-- Postitoimipaikka iso alkukirjain

DELIMITER $$
CREATE TRIGGER before_insert_or_update_Omistajan_postitoimipaikka
BEFORE INSERT ON Hevoset
FOR EACH ROW
BEGIN
    DECLARE first_letter VARCHAR(1);
    DECLARE rest_of_name VARCHAR(255);
    SET first_letter = UPPER(LEFT(NEW.Omistajan_postitoimipaikka, 1));
    SET rest_of_name = LOWER(SUBSTRING(NEW.Omistajan_postitoimipaikka, 2));
    SET NEW.Omistajan_postitoimipaikka = CONCAT(first_letter, rest_of_name);    
END$$



-- Tietojen päivitys
UPDATE Hevoset
SET Omistajan_nimi = 'Tuija Pakkanen'
WHERE Omistajan_nimi = 'Tpakkanen Ptuija';


// TAULUKON TYHJENNYS // NOLLAA SAMALLA AUTO_INCREMENT
TRUNCATE TABLE table_name; 


DELIMITER $$

CREATE TRIGGER before_insert_or_update_Omistajan_nimi
BEFORE INSERT ON hevoset
FOR EACH ROW
BEGIN
    DECLARE temp_name VARCHAR(255);
    DECLARE capitalized_name VARCHAR(255);  -- Adjust the size as needed
    
    SET temp_name = LOWER(NEW.Omistajan_nimi); -- Convert the whole name to lowercase
    SET capitalized_name = ''; -- Initialize the capitalized name variable
    
    -- Loop through each word in the name
    WHILE LENGTH(temp_name) > 0 DO
        IF LEFT(temp_name, 1) = ' ' THEN
            SET capitalized_name = CONCAT(capitalized_name, ' '); -- Append space if the character is a space
            SET temp_name = SUBSTRING(temp_name, 2); -- Remove the leading space
        ELSE
            -- Capitalize the first letter of the word and append it to the capitalized name
            SET capitalized_name = CONCAT(capitalized_name, UPPER(LEFT(temp_name, 1)), SUBSTRING(temp_name, 2));
            -- Move to the next word by finding the next space
            SET temp_name = SUBSTRING(temp_name, LOCATE(' ', temp_name) + 1);
        END IF;
    END WHILE;

    -- Truncate the capitalized name if it exceeds the maximum length allowed for the column
    IF LENGTH(capitalized_name) > 255 THEN
        SET capitalized_name = SUBSTRING(capitalized_name, 1, 255);
    END IF;

    SET NEW.Omistajan_nimi = capitalized_name; -- Set the capitalized name for the new row
END$$

-- TARKASTAA KAIKKI TRIGGERIT
SELECT TRIGGER_NAME, EVENT_MANIPULATION, EVENT_OBJECT_TABLE, ACTION_STATEMENT, ACTION_TIMING
FROM information_schema.TRIGGERS
WHERE EVENT_OBJECT_TABLE = 'hevoset' AND TRIGGER_SCHEMA = 'ravitietokanta';




-- TEHTÄVÄ 3
-- SUSKAN TYTÖN omistaja muuttaa, päivitä osoitetiedot.
-- Vesitie 4, postinumero 04200, postitoimipaikka Kerava. Tarkista muutoksen onnistuminen

+--------------+--------------+--------+--------------+--------------+------------+-----------------+----------------------+-----------------------+----------------------------+-----------+
| Radan_tunnus | Nimi         | Rotu   | Emanisa      | Isanisa      | Syntynyt   | Omistajan_nimi  | Omistajan_katuosoite | Omistajan_postinumero | Omistajan_postitoimipaikka | Ostohinta |
+--------------+--------------+--------+--------------+--------------+------------+-----------------+----------------------+-----------------------+----------------------------+-----------+
|           34 | SUSKAN TYTTÖ | Suomen | TOPI-KÖSSI   | SALMER       | 1995-12-21 | Tuija Pakkanen  | Vesitie 4            | 04200                 | Kerava                     |    500.00 |
|           87 | TÄHTI-VIPPE  | Suomen | VILLE-VILKAS | B. VILUNKI   | 1997-03-03 | Jaana Mikkonen  | Saimaankatu 12       | 15140                 | Lahti                      |   1200.00 |
|          125 | RULE THE     | Lämmin | ZUMURRUD     | FLASHY       | 2000-05-02 | Mark Miettinen  | Mikontie 4           | 15610                 | Korpilahti                 |   1300.00 |
|          145 | DIKKO        | Suomen | M.A NIKU     | TURTLE       | 2000-12-05 | Jouko Heimala   | Kotikatu 12          | 15610                 | Lahti                      |   1200.00 |
|          165 | SPEEDY TEXAS | Lämmin | SORENZA      | DIAMOND      | 1997-03-09 | Pekka Korpinen  | Sammonkatu 8         | 15140                 | Lahti                      |   5000.00 |
|          235 | EXCELLENT    | Lämmin | JANET LEE    | POPULAR KEMP | 1999-04-16 | Marjut Nieminen | Ravitie 16           | 14560                 | Korpilahti                 |   2300.00 |
+--------------+--------------+--------+--------------+--------------+------------+-----------------+----------------------+-----------------------+----------------------------+-----------+

-- TEHTÄVÄ 4

-- Tietojen päivityslauseke (joka on sinänsä melko turha koska samat tiedot mitä ennenkin)
UPDATE Hevoset
SET Omistajan_katuosoite = 'Vesitie 4', Omistajan_postinumero = '04200', Omistajan_postitoimipaikka = 'Kerava'
WHERE Radan_tunnus = 34;

--TEHTÄVÄ 5
-- Valitse kaikki tiedot taulusta
SELECT * FROM hevoset;

-- Tulos:
+--------------+--------------+--------+--------------+--------------+------------+-----------------+----------------------+-----------------------+----------------------------+-----------+
| Radan_tunnus | Nimi         | Rotu   | Emanisa      | Isanisa      | Syntynyt   | Omistajan_nimi  | Omistajan_katuosoite | Omistajan_postinumero | Omistajan_postitoimipaikka | Ostohinta |
+--------------+--------------+--------+--------------+--------------+------------+-----------------+----------------------+-----------------------+----------------------------+-----------+
|           34 | SUSKAN TYTTÖ | Suomen | TOPI-KÖSSI   | SALMER       | 1995-12-21 | Tuija Pakkanen  | Vesitie 4            | 04200                 | Kerava                     |    500.00 |
|           87 | TÄHTI-VIPPE  | Suomen | VILLE-VILKAS | B. VILUNKI   | 1997-03-03 | Jaana Mikkonen  | Saimaankatu 12       | 15140                 | Lahti                      |   1200.00 |
|          125 | RULE THE     | Lämmin | ZUMURRUD     | FLASHY       | 2000-05-02 | Mark Miettinen  | Mikontie 4           | 15610                 | Korpilahti                 |   1300.00 |
|          145 | DIKKO        | Suomen | M.A NIKU     | TURTLE       | 2000-12-05 | Jouko Heimala   | Kotikatu 12          | 15610                 | Lahti                      |   1200.00 |
|          165 | SPEEDY TEXAS | Lämmin | SORENZA      | DIAMOND      | 1997-03-09 | Pekka Korpinen  | Sammonkatu 8         | 15140                 | Lahti                      |   5000.00 |
|          235 | EXCELLENT    | Lämmin | JANET LEE    | POPULAR KEMP | 1999-04-16 | Marjut Nieminen | Ravitie 16           | 14560                 | Korpilahti                 |   2300.00 |
+--------------+--------------+--------+--------------+--------------+------------+-----------------+----------------------+-----------------------+----------------------------+-----------+

--TEHTÄVÄ 6
-- Valitse tiedot aliaksilla

SELECT
    Omistajan_nimi AS Omistaja,
    Omistajan_postitoimipaikka AS Kunta,
    Nimi
FROM Hevoset;

-- Tulos
+-----------------+------------+--------------+
| Omistaja        | Kunta      | Nimi         |
+-----------------+------------+--------------+
| Tuija Pakkanen  | Kerava     | SUSKAN TYTTÖ |
| Jaana Mikkonen  | Lahti      | TÄHTI-VIPPE  |
| Mark Miettinen  | Korpilahti | RULE THE     |
| Jouko Heimala   | Lahti      | DIKKO        |
| Pekka Korpinen  | Lahti      | SPEEDY TEXAS |
| Marjut Nieminen | Korpilahti | EXCELLENT    |
+-----------------+------------+--------------+

-- TEHTÄVÄ 7 
-- The SELECT DISTINCT statement is used to return only distinct (different) values.
-- Erittelevä haku, eli SELECT DISTINCT lauseketta käytetään palauttaakseen ainoastaan eriävät arvot
-- Taas AGGREGATE:lla voidaan määrittää näkyvyydet vain kertaalleen
-- Aggregate function

SELECT
    MAX(Omistajan_nimi) AS Omistaja,
    Omistajan_postitoimipaikka AS Kunta,
    MAX(Nimi) AS Nimi
FROM Hevoset
GROUP BY Omistajan_postitoimipaikka;

-- TEHTÄVÄ 8
-- ORDER BY FUNKTIO

-- RAKENENE
-- SELECT
-- data_mita_selektoidaan1,
-- data_mita_selektoidaan2
-- FROM taulukko
-- GROUP BY data_mita_selektoidaan1, *.*2 jne (groupataan data)
-- ORDER BY data_minka_mukaan_jarjestys DESC(tai ASC)

SELECT
    Omistajan_nimi,
    Omistajan_postitoimipaikka,
    Nimi
FROM Hevoset
GROUP BY Omistajan_nimi, Omistajan_postitoimipaikka, Nimi
ORDER BY Omistajan_postitoimipaikka DESC;