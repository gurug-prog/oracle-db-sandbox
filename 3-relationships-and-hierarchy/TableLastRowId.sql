CREATE OR REPLACE FUNCTION TABLE_LAST_ROW_ID(table_name IN VARCHAR2) RETURN NUMBER IS
    last_id NUMBER;
BEGIN
    EXECUTE IMMEDIATE 'SELECT MAX("id") FROM ' || '"' || table_name || '"' INTO last_id;
    RETURN last_id;
END;