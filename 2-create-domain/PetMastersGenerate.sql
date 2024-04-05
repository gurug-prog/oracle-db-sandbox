CREATE OR REPLACE FUNCTION generate_random_petmaster_data RETURN VARCHAR2 IS
    -- Arrays of possible values for generating random data
    TYPE fullname_array IS TABLE OF VARCHAR2(100);
    TYPE address_array IS TABLE OF VARCHAR2(255);
    TYPE phone_number_array IS TABLE OF VARCHAR2(20);

    fullnames fullname_array := fullname_array('John','Doe','Jane','Smith','Michael','Johnson','Sarah','Williams','David','Brown');
    addresses address_array := address_array('123 Main St','456 Elm St','789 Oak St','101 Pine St','202 Maple St','303 Cedar St','404 Walnut St','505 Birch St','606 Chestnut St','707 Spruce St');
    phone_numbers phone_number_array := phone_number_array('1234567890','2345678901','3456789012','4567890123','5678901234','6789012345','7890123456','8901234567','9012345678','0123456789');

    -- Date range for generating random date of birth
    min_date_of_birth DATE := TO_DATE('1950-01-01', 'YYYY-MM-DD');
    max_date_of_birth DATE := TO_DATE('2005-12-31', 'YYYY-MM-DD');

    -- Randomly selected values
    random_fullname VARCHAR2(100);
    random_age NUMBER(3,0);
    random_address VARCHAR2(255);
    random_phone_number VARCHAR2(20);
    random_date_of_birth DATE;
BEGIN
    -- Generate random values
    random_fullname := fullnames(TRUNC(DBMS_RANDOM.VALUE(1, fullnames.COUNT)));
    random_age := TRUNC(DBMS_RANDOM.VALUE(18, 100));
    random_address := addresses(TRUNC(DBMS_RANDOM.VALUE(1, addresses.COUNT)));
    random_phone_number := phone_numbers(TRUNC(DBMS_RANDOM.VALUE(1, phone_numbers.COUNT)));
    random_date_of_birth := TRUNC(min_date_of_birth + DBMS_RANDOM.VALUE * (max_date_of_birth - min_date_of_birth));

    -- Insert random data into table
    INSERT INTO "PetMasters" ("fullname", "age", "address", "phone_number", "date_of_birth")
    VALUES (random_fullname, random_age, random_address, random_phone_number, random_date_of_birth);

    -- Return success message
    RETURN 'Data inserted successfully';
END generate_random_petmaster_data;
