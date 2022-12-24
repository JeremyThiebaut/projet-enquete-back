-- On démarre une transaction afin de s'assurer de la cohérence globale de la BDD
BEGIN;
-- Nous supprimerons ensuite les tables 'si elles existent', pour pouvoir à chaque fois retravailler sur une base saine.
DROP TABLE IF EXISTS
"place",
"motive",
"weapon",
"character",
"chapter",
"situation",
"question",
"situation_character",
"storytelling",
"user";


-- Ensuite on la (re)crée
CREATE TABLE IF NOT EXISTS "place" (
"id" serial NOT NULL PRIMARY KEY,
-- INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY
"name" TEXT NOT NULL DEFAULT '',
"picture" TEXT NOT NULL DEFAULT ''
);
CREATE TABLE IF NOT EXISTS "motive" (
"id" serial NOT NULL PRIMARY KEY,
-- INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY
"description" TEXT NOT NULL DEFAULT ''
);
CREATE TABLE IF NOT EXISTS "weapon" (
"id" serial NOT NULL PRIMARY KEY,
-- INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY
"name" TEXT NOT NULL DEFAULT ''
);
CREATE TABLE IF NOT EXISTS "character" (
"id" serial NOT NULL PRIMARY KEY,
-- INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY
"name" TEXT NOT NULL DEFAULT '',
"picture" TEXT NOT NULL DEFAULT '',
"is_guilty" BOOLEAN NOT NULL,
"is_suspect" BOOLEAN NOT NULL,
"alibi" TEXT NOT NULL DEFAULT '',
"motive_id" INTEGER REFERENCES motive("id") ON DELETE CASCADE,
"weapon_id" INTEGER REFERENCES weapon("id") ON DELETE CASCADE
);
CREATE TABLE IF NOT EXISTS "chapter" (
"id" serial NOT NULL PRIMARY KEY,
-- INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY
"name" TEXT NOT NULL DEFAULT ''
);

CREATE TABLE IF NOT EXISTS "situation" (
"id" serial NOT NULL PRIMARY KEY,
-- INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY
"chapter_id" INTEGER NOT NULL REFERENCES chapter("id") ON DELETE CASCADE,
"place_id" INTEGER NOT NULL REFERENCES place("id") ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS "question" (
"id" serial NOT NULL PRIMARY KEY,
-- INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY
"description" TEXT NOT NULL DEFAULT '',
"answer" TEXT NOT NULL,
"character_id" INTEGER NOT NULL REFERENCES character("id") ON DELETE CASCADE,
"situation_id" INTEGER NOT NULL REFERENCES situation("id") ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS "situation_character" (
"id" serial NOT NULL PRIMARY KEY,
-- INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY
"situation_id" INTEGER NOT NULL REFERENCES situation("id") ON DELETE CASCADE,
"character_id" INTEGER REFERENCES character("id") ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS "storytelling" (
"id" serial NOT NULL PRIMARY KEY,
-- INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY
"sentence" TEXT NOT NULL DEFAULT '',
"chapter_id" INTEGER NOT NULL REFERENCES chapter("id") ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS "user" (
"id" serial NOT NULL PRIMARY KEY,
-- INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY
"pseudo" TEXT NOT NULL,
"pwd" TEXT NOT NULL,
"mail" TEXT NOT NULL,
"allChapter" INT NOT NULL,
"chapterCounter" INT NOT NULL,
"storyCounter" INT NOT NULL,
"questionCounter" INT NOT NULL,
"situationCounter" INT NOT NULL,
"shouldDisplayQuestion" BOOLEAN NOT NULL,
"shouldDisplayChapter" BOOLEAN NOT NULL
);

COMMIT;