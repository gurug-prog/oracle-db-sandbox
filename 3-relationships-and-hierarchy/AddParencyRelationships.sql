CREATE OR REPLACE PROCEDURE ADD_PARENCY_RELATIONSHIPS(max_children NUMBER) AS
    cats_count NUMBER;
    assigning_children_count NUMBER;
    child_id_counter NUMBER;
    potential_child_cat_parrent_id NUMBER;
    immediate_stop BOOLEAN;
BEGIN
    immediate_stop := FALSE;
    child_id_counter := 1;

    -- Getting cats count
    SELECT COUNT(*) INTO cats_count FROM "Cats";

    -- Iterate all cats
    FOR i IN 1..cats_count LOOP
        -- Generating children count for current cat
        assigning_children_count := ROUND(DBMS_RANDOM.VALUE(0, max_children));
        IF assigning_children_count = 0 THEN
            CONTINUE;
        END IF;

        FOR j IN 1..assigning_children_count LOOP
            child_id_counter := child_id_counter + 1;
            IF child_id_counter > cats_count THEN
                immediate_stop := TRUE;
                EXIT;
            END IF;

            SELECT "parent_id" INTO potential_child_cat_parrent_id
                FROM "Cats" WHERE "id" = child_id_counter;

            IF potential_child_cat_parrent_id IS NULL THEN
                UPDATE "Cats" SET "parent_id" = i WHERE "id" = child_id_counter;
            END IF;
        END LOOP;

        EXIT WHEN immediate_stop;
    END LOOP;
END ADD_PARENCY_RELATIONSHIPS;
