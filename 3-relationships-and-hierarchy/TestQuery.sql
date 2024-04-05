SELECT * FROM (
    SELECT
        LPAD(' ', (LEVEL - 1) * 4) || '[' || c."id" || '] ' || c."name" || '(' || c."age" || ')' AS CAT_INFO,
        c."master_id",
        LEVEL
    FROM "Cats" c
    WHERE c."master_id" IS NOT NULL
    START WITH c."id" = 1
    CONNECT BY NOCYCLE PRIOR c."id" = c."parent_id"
    ORDER SIBLINGS BY c."name", c."id"
) c_h
JOIN "PetMasters" pm ON pm."id" = c_h."master_id";
