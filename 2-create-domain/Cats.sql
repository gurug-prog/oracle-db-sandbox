DROP TABLE "Cats";

CREATE TABLE "Cats" (
    "id"            NUMBER GENERATED ALWAYS AS IDENTITY,
    "name"          VARCHAR2(100),
    "age"           NUMBER,
    "is_vaccinated" CHAR(1),
    "belt_number"   VARCHAR2(20),
    "master_id" NUMBER,
    "parent_id" NUMBER,

    CONSTRAINT "pk_Cats" PRIMARY KEY ("id"),
    CONSTRAINT "fk_Cats_PetMasters" FOREIGN KEY ("master_id") REFERENCES "PetMasters" ("id"),
    CONSTRAINT "fk_Cats_CatParents" FOREIGN KEY ("parent_id") REFERENCES "Cats" ("id")
);
