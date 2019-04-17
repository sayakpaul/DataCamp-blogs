-- Database: census

-- DROP DATABASE census;

CREATE DATABASE census
  WITH OWNER = postgres
       ENCODING = 'UTF8'
       TABLESPACE = pg_default
       LC_COLLATE = 'English_United States.1252'
       LC_CTYPE = 'English_United States.1252'
       CONNECTION LIMIT = -1;

select country_name, sum(debt) as total_debt from international_debt group by country_name order by country_name;

CREATE MATERIALIZED VIEW rental_by_category
as
  select country_name, 
  sum(debt) as total_debt 
  from international_debt 
  group by country_name order by country_name;

CREATE MATERIALIZED VIEW country_total_debt_2
as
  select country_name, 
  sum(debt) as total_debt 
  from international_debt 
  group by country_name order by country_name
WITH NO DATA;

REFRESH MATERIALIZED VIEW country_total_debt_2;

select * from country_total_debt_2;

select max(total_debt) from country_total_debt_2;

CREATE VIEW country_total_debt_3
as
  select country_name, 
  sum(debt) as total_debt 
  from international_debt 
  group by country_name order by country_name;

select * from country_total_debt_3;

select max(total_debt) from country_total_debt_3;

Drop Materialized View country_total_debt_2;

select * from rental_by_category;