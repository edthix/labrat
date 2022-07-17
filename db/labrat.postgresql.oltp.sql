CREATE SCHEMA labrat_oltp;

SET search_path TO labrat_oltp;

CREATE TYPE user_role AS ENUM ('normal', 'admin');
CREATE TYPE user_status AS ENUM ('active', 'banned');

CREATE TABLE "users" (
  "id" int,
  "email" varchar UNIQUE NOT NULL,
  "full_name" varchar NOT NULL,
  "password" varchar NOT NULL,
  "description" text,
  "status" user_status DEFAULT 'active',
  "role" user_role DEFAULT 'normal',
  "created_at" timestamp,
  "updated_at" timestamp,
  "deleted_at" timestamp,
  "created_by" int,
  "updated_by" int,
  "deleted_by" int,
  PRIMARY KEY ("id")
);

CREATE TABLE "posts" (
  "id" int,
  "title" varchar NOT NULL,
  "body" text,
  "created_at" timestamp,
  "updated_at" timestamp,
  "deleted_at" timestamp,
  "created_by" int,
  "updated_by" int,
  "deleted_by" int,
  PRIMARY KEY ("id")
);

CREATE TABLE "post_likes" (
  "id" int,
  "user_id" int,
  "post_id" int,
  "created_at" timestamp,
  "updated_at" timestamp,
  "deleted_at" timestamp,
  "created_by" int,
  "updated_by" int,
  "deleted_by" int,
  PRIMARY KEY ("id")
);

CREATE UNIQUE INDEX ON "users" ("email");

CREATE INDEX ON "users" ("full_name");

CREATE INDEX ON "users" ("status");

CREATE INDEX ON "users" ("created_at");

CREATE INDEX ON "users" ("updated_at");

CREATE INDEX ON "users" ("deleted_at");

CREATE INDEX ON "posts" ("title");

CREATE INDEX ON "posts" ("created_at");

CREATE INDEX ON "posts" ("updated_at");

CREATE INDEX ON "posts" ("deleted_at");

CREATE UNIQUE INDEX ON "post_likes" ("user_id", "post_id");

CREATE INDEX ON "post_likes" ("created_at");

CREATE INDEX ON "post_likes" ("updated_at");

CREATE INDEX ON "post_likes" ("deleted_at");

ALTER TABLE "post_likes" ADD FOREIGN KEY ("post_id") REFERENCES "posts" ("id");

ALTER TABLE "post_likes" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "users" ADD FOREIGN KEY ("created_by") REFERENCES "users" ("id");

ALTER TABLE "users" ADD FOREIGN KEY ("updated_by") REFERENCES "users" ("id");

ALTER TABLE "users" ADD FOREIGN KEY ("deleted_by") REFERENCES "users" ("id");

ALTER TABLE "posts" ADD FOREIGN KEY ("created_by") REFERENCES "users" ("id");

ALTER TABLE "posts" ADD FOREIGN KEY ("updated_by") REFERENCES "users" ("id");

ALTER TABLE "posts" ADD FOREIGN KEY ("deleted_by") REFERENCES "users" ("id");

ALTER TABLE "post_likes" ADD FOREIGN KEY ("created_by") REFERENCES "users" ("id");

ALTER TABLE "post_likes" ADD FOREIGN KEY ("updated_by") REFERENCES "users" ("id");

ALTER TABLE "post_likes" ADD FOREIGN KEY ("deleted_by") REFERENCES "users" ("id");
