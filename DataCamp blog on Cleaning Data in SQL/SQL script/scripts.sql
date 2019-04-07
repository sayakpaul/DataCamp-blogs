create table student_metadata(
id smallint,
name text,
dept_id smallint
);


create table department_details(
dept_id text,
dept_name text,
hod text
);

drop table department_details;

truncate table department_details;

insert into student_metadata(id, name, dept_id) values (1, 'Rick', 100);

insert into student_metadata(id, name, dept_id) values (2, 'Twinkle', 100);

insert into student_metadata(id, name, dept_id) values (3, 'Steve', 101);

insert into department_details(dept_id, dept_name, hod) values ('100', 'Computer Science', 'Chris Manning');

insert into department_details(dept_id, dept_name, hod) values ('101', 'Economics', 'Steve Harris');

select * from student_metadata;

select * from department_details;

select id, name, dept_name from
student_metadata s join department_details d
on s.dept_id = cast(d.dept_id as smallint);


create table entries(
name text,
weight_in_lbs float,
age_in_years smallint
);

truncate table entries;

insert into entries(name, weight_in_lbs, age_in_years) values('Gilbert', 100.3, 21);

insert into entries(name, weight_in_lbs) values('Christina', 80.6);

insert into entries(name, age_in_years) values('Matthews', 19);

select * from entries;

select avg(weight_in_lbs) as average_weight_in_lbs from entries;

select avg(COALESCE(weight_in_lbs,90.45)) as average_weight_in_lbs from entries;

select avg(corrected_weights) from
(select *, COALESCE(weight_in_lbs, 90.45) as corrected_weights from entries) as subquery;

create table student_details(
id smallint,
name text,
dept_name text
);

insert into student_details(id, name, dept_name) values (1, 'Sayak', 'I.T');
insert into student_details(id, name, dept_name) values (2, 'Hugo', 'Information Technology');
insert into student_details(id, name, dept_name) values (2, 'Stephen', 'i.t');

insert into student_details(id, name, dept_name) values (4, 'David', 'C.S.E');
insert into student_details(id, name, dept_name) values (5, 'Andrew', 'C.S.E');
insert into student_details(id, name, dept_name) values (6, 'Emily', 'E.C.E');

select * from student_details;

select dept_name, count(dept_name) as student_count
from student_details
group by dept_name;

select dept_name, count(dept_name) as student_count
from student_details
group by dept_name;

select upper(replace(dept_name, 'Information Technology', 'I.T')) as dept_cleaned, 
count(dept_name) as student_count
from student_details
group by dept_cleaned;

select * from student_details where dept_name='I.T';


create table employees(
employee_id smallint,
employee_name text,
dept_name text,
birthdate text
);

insert into employees(employee_id, employee_name, dept_name, birthdate) values(10, 'Ramesh', 'Retail', '1990-11-08');

insert into employees(employee_id, employee_name, dept_name, birthdate) values(15, 'Richard', 'Customer Acquisition', '1987-05-21');

insert into employees(employee_id, employee_name, dept_name, birthdate) values(15, 'Ricky', 'Data & Analyticss', '1995-01-23');

select * from employees;

select date_part('month', birthdate) from employees;


select date_part('month', CAST(birthdate AS date)) as birthday_months from employees;

create table band_details(
id smallint,
band_name text,
total_show_count smallint
);


create table some_festival_record(
band_id smallint,
year smallint,
performed smallint
);

insert into band_details(id, band_name, total_show_count) values(12, 'Band_1', 36);
insert into band_details(id, band_name, total_show_count) values(13, 'Band_2', 25);
insert into band_details(id, band_name, total_show_count) values(14, 'Band_3', 39);

insert into some_festival_record(band_id, year, performed) values (12, 2010, 3);
insert into some_festival_record(band_id, year, performed) values (12, 2011, 2);
insert into some_festival_record(band_id, year, performed) values (12, 2012, 1);
insert into some_festival_record(band_id, year, performed) values (13, 2010, 2);

select * from band_details;

select * from some_festival_record;

select band_name, sum(total_show_count) as total_shows, sum(performed) as total_times_performed
from band_details b join some_festival_record s
on b.id = s.band_id
group by band_name;

select band_name, total_show_count, sum(performed) as total_times_performed
from band_details b join some_festival_record s
on b.id = s.band_id
group by band_name, total_show_count;
