+--------------+--------------+--------+--------------+--------------+------------+-----------------+----------------------+-----------------------+----------------------------+-----------+
| Radan_tunnus | Nimi         | Rotu   | Emanisa      | Isanisa      | Syntynyt   | Omistajan_nimi  | Omistajan_katuosoite | Omistajan_postinumero | Omistajan_postitoimipaikka | Ostohinta |
+--------------+--------------+--------+--------------+--------------+------------+-----------------+----------------------+-----------------------+----------------------------+-----------+
|           34 | Suskan tyttö | Suomen | TOPI-KÖSSI   | SALMER       | 1995-12-21 | Tuija Pakkanen  | Vesitie 4            | 04200                 | Kerava                     |    500.00 |
|           87 | Tähti-vippe  | Suomen | VILLE-VILKAS | B. VILUNKI   | 1997-03-03 | Jaana Mikkonen  | Saimaankatu 12       | 15140                 | Lahti                      |   1200.00 |
|          125 | Rule the     | Lämmin | ZUMURRUD     | FLASHY       | 2000-05-02 | Mark Miettinen  | Mikontie 4           | 15610                 | Korpilahti                 |   1300.00 |
|          145 | Dikko        | Suomen | M.A NIKU     | TURTLE       | 2000-12-05 | Jouko Heimala   | Kotikatu 12          | 15610                 | Lahti                      |   1200.00 |
|          165 | Speedy texas | Lämmin | SORENZA      | DIAMOND      | 1997-03-09 | Pekka Korpinen  | Sammonkatu 8         | 15140                 | Lahti                      |   5000.00 |
|          235 | Excellent    | Lämmin | JANET LEE    | POPULAR KEMP | 1999-04-16 | Marjut Nieminen | Ravitie 16           | 14560                 | Korpilahti                 |   2300.00 |
+--------------+--------------+--------+--------------+--------------+------------+-----------------+----------------------+-----------------------+----------------------------+-----------+

| before_insert_or_update_Nimi                       | INSERT             | hevosetbackup      | BEGIN
    DECLARE first_letter VARCHAR(1);
    DECLARE rest_of_name VARCHAR(255);
    SET first_letter = UPPER(LEFT(NEW.Nimi, 1));
    SET rest_of_name = LOWER(SUBSTRING(NEW.Nimi, 2));
    SET NEW.Nimi = CONCAT(first_letter, rest_of_name);
END

                                                                                                           | BEFORE        |
| before_insert_or_update_Rotu                       | INSERT             | hevosetbackup      | BEGIN
    DECLARE first_letter VARCHAR(1);
    DECLARE rest_of_name VARCHAR(255);
    SET first_letter = UPPER(LEFT(NEW.Rotu, 1));
    SET rest_of_name = LOWER(SUBSTRING(NEW.Rotu, 2));
    SET NEW.Rotu = CONCAT(first_letter, rest_of_name);
END

                                                                                                           | BEFORE        |
| before_insert_or_update_Emanisa                    | INSERT             | hevosetbackup      | BEGIN
    SET NEW.Emanisa = UPPER(NEW.Emanisa);
END


                                                                                              | BEFORE        |
| before_insert_or_update_Isanisa                    | INSERT             | hevosetbackup      | BEGIN
    SET NEW.Isanisa = UPPER(NEW.Isanisa);
END


                                                                                              | BEFORE        |
| before_insert_or_update_Omistajan_katuosoite       | INSERT             | hevosetbackup      | BEGIN
    DECLARE first_letter VARCHAR(1);
    DECLARE rest_of_name VARCHAR(255);
    SET first_letter = UPPER(LEFT(NEW.Omistajan_katuosoite, 1));
    SET rest_of_name = LOWER(SUBSTRING(NEW.Omistajan_katuosoite, 2));
    SET NEW.Omistajan_katuosoite = CONCAT(first_letter, rest_of_name);
END

                                                           | BEFORE        |
| before_insert_or_update_Omistajan_postitoimipaikka | INSERT             | hevosetbackup      | BEGIN
    DECLARE first_letter VARCHAR(1);
    DECLARE rest_of_name VARCHAR(255);
    SET first_letter = UPPER(LEFT(NEW.Omistajan_postitoimipaikka, 1));
    SET rest_of_name = LOWER(SUBSTRING(NEW.Omistajan_postitoimipaikka, 2));
    SET NEW.Omistajan_postitoimipaikka = CONCAT(first_letter, rest_of_name);
END

                                         | BEFORE        |
| before_insert_or_update_Omistajan_nimi             | INSERT             | hevosetbackup      | BEGIN
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