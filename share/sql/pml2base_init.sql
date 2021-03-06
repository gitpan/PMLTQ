BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE "#PML"';
EXCEPTION
   WHEN OTHERS THEN
      IF SQLCODE != -942 THEN
         RAISE;
      END IF;
END;

BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE "#PMLTYPES"';
EXCEPTION
   WHEN OTHERS THEN
      IF SQLCODE != -942 THEN
         RAISE;
      END IF;
END;

BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE "#PMLTABLES"';
EXCEPTION
   WHEN OTHERS THEN
      IF SQLCODE != -942 THEN
         RAISE;
      END IF;
END;

BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE "#PML_USR_REL"';
EXCEPTION
   WHEN OTHERS THEN
      IF SQLCODE != -942 THEN
         RAISE;
      END IF;
END;

CREATE TABLE "#PML" (
  "root" VARCHAR(32 CHAR) UNIQUE, 
  "schema_file" VARCHAR(128 CHAR) UNIQUE, 
  "data_dir" VARCHAR(128 CHAR), 
  "schema" BLOB,
  "last_idx" INT,
  "last_node_idx" INT,
  "flags" INT
);
CREATE TABLE "#PMLTYPES" (
  "type" VARCHAR(32 CHAR) UNIQUE, 
  "root" VARCHAR(32 CHAR)
);
CREATE TABLE "#PMLTABLES" (
  "type" VARCHAR(128 CHAR) UNIQUE, 
  "table" VARCHAR(32 CHAR)
);
CREATE TABLE "#PML_USR_REL" (
  "relname" VARCHAR(32 CHAR) NOT NULL,
  "reverse" VARCHAR(32 CHAR),
  "node_type" VARCHAR(64 CHAR),
  "target_node_type" VARCHAR(64 CHAR),
  "tbl" VARCHAR(32 CHAR)
);
