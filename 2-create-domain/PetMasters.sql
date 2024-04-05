DROP TABLE "PetMasters";

CREATE TABLE "PetMasters" (
    "id"             NUMBER GENERATED ALWAYS AS IDENTITY,
    "fullname"       VARCHAR2(100),
    "age"            NUMBER(3,0),
    "address"        VARCHAR2(255),
    "phone_number"   VARCHAR2(20),
    "date_of_birth"  DATE,

    CONSTRAINT "pk_PetMasters" PRIMARY KEY ("id")
);
