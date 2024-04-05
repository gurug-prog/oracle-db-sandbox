CREATE OR REPLACE FUNCTION generate_random_cat_data RETURN VARCHAR2 IS
    -- Arrays of possible values for generating random data
    TYPE name_array IS TABLE OF VARCHAR2(100);
    TYPE belt_number_array IS TABLE OF VARCHAR2(20);

    names name_array := name_array('Whiskers','Mittens','Tiger','Luna','Oreo','Simba','Smokey','Max','Bella','Lucy');
    belt_numbers belt_number_array := belt_number_array('1234','5678','9012','3456','7890','2345','6789','0123','4567','8901');

    -- Randomly selected values
    random_name VARCHAR2(100);
    random_age NUMBER;
    random_is_vaccinated CHAR(1);
    random_belt_number VARCHAR2(20);
BEGIN
    -- Generate random values
    random_name := names(TRUNC(DBMS_RANDOM.VALUE(1, names.COUNT)));
    random_age := TRUNC(DBMS_RANDOM.VALUE(1, 20)); -- Assuming maximum age of 20 for cats
    random_is_vaccinated := CASE WHEN DBMS_RANDOM.VALUE < 0.5 THEN 'Y' ELSE 'N' END;
    random_belt_number := belt_numbers(TRUNC(DBMS_RANDOM.VALUE(1, belt_numbers.COUNT)));

    -- Insert random data into table
    INSERT INTO "Cats" ("name", "age", "is_vaccinated", "belt_number")
    VALUES (random_name, random_age, random_is_vaccinated, random_belt_number);

    -- Return success message
    RETURN 'Data inserted successfully';
END generate_random_cat_data;
