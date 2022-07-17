SET search_path TO labrat_oltp;

CREATE ROLE labrat_anon nologin;

GRANT USAGE ON SCHEMA labrat_oltp TO labrat_anon;
GRANT SELECT ON labrat_oltp.users TO labrat_anon;

CREATE ROLE postgrest_auth noinherit login password 'password';
GRANT labrat_anon TO postgrest_auth;
