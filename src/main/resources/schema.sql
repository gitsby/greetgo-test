DROP SEQUENCE IF EXISTS "student_id_seq" CASCADE;
CREATE SEQUENCE "student_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 16
 CACHE 1;
SELECT setval('"public"."student_id_seq"', 16, true);

-- ----------------------------
-- Sequence structure for study_mode_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "study_mode_id_seq" CASCADE;
CREATE SEQUENCE "study_mode_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 2
 CACHE 1;
SELECT setval('"public"."study_mode_id_seq"', 2, true);

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS "student" cascade;
CREATE TABLE "student" (
"id" int4 DEFAULT nextval('student_id_seq'::regclass) NOT NULL,
"name" varchar(255) COLLATE "default",
"surname" varchar(255) COLLATE "default",
"group_" varchar(255) COLLATE "default",
"study_mode_id" int4,
"is_del" bool DEFAULT false
);


-- ----------------------------
-- Table structure for study_mode
-- ----------------------------
DROP TABLE IF EXISTS "study_mode" cascade;
CREATE TABLE "study_mode" (
"id" int4 DEFAULT nextval('study_mode_id_seq'::regclass) NOT NULL,
"name" varchar(255) COLLATE "default"
);


-- ----------------------------
-- Alter Sequences Owned By
-- ----------------------------
ALTER SEQUENCE "student_id_seq" OWNED BY "student"."id";
ALTER SEQUENCE "study_mode_id_seq" OWNED BY "study_mode"."id";

-- ----------------------------
-- Primary Key structure for table student
-- ----------------------------
ALTER TABLE "student" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table study_mode
-- ----------------------------
ALTER TABLE "study_mode" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Foreign Key structure for table "student"
-- ----------------------------
ALTER TABLE "student" ADD FOREIGN KEY ("study_mode_id") REFERENCES "study_mode" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
