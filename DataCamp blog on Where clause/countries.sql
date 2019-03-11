SELECT code, name, continent, region, surface_area, indep_year, local_name, 
       gov_form, capital, cap_long, cap_lat
  FROM countries;

select count(*) from countries;

select * from countries where code = 'AUS';

select * from countries where indep_year > 1901;

select count(*) from countries where indep_year > 1901;

select * from countries where continent = 'Asia' and indep_year > 1900;

select count(*) from countries where continent = 'Asia' and indep_year > 1900;

select * from countries where continent = 'Asia' or indep_year > 1900 or surface_area > 652090;

select count(*) from countries where continent = 'Asia' or indep_year > 1900 or surface_area > 652090;

select * from countries where continent = 'Asia' and indep_year > 1900 and surface_area > 652090;

select count(*) from countries where continent = 'Asia' and indep_year > 1900 and surface_area > 652090;

select * from countries where (continent = 'Europe' and indep_year > 1900) or (continent = 'Asia' and indep_year > 1900);

select count(*) from countries where (continent = 'Europe' and indep_year > 1900) or (continent = 'Asia' and indep_year > 1900);

select * from countries where indep_year = 1947 or indep_year = 1912;

select * from countries where surface_area in (select max(surface_area) from countries);

select * from countries where continent = 'Asia' or indep_year > 1900 or surface_area > 652090;

select * from countries where continent = 'Asia' and indep_year > 1900 and surface_area > 652090;