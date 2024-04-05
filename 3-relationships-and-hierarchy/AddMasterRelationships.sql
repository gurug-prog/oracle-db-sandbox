CREATE OR REPLACE PROCEDURE ADD_MASTER_RELATIONSHIPS(n NUMBER, s NUMBER) AS
  cat_id NUMBER;
  randomizity NUMBER;
BEGIN
  FOR i IN 1..(n / s) LOOP
    FOR j IN 0..(s - 1) LOOP
      cat_id := s * (i - 1) + j;
      randomizity := ROUND(DBMS_RANDOM.VALUE(0, 1));
      IF randomizity != 0
        AND cat_id != 0
        AND cat_id != 1
        AND cat_id < n THEN
            UPDATE "Cats" SET "master_id" = i WHERE "id" = cat_id;
      END IF;
    END LOOP;
  END LOOP;
  COMMIT;
END ADD_MASTER_RELATIONSHIPS;
