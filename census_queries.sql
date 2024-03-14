show databases;
use census;



select * from county_mertics;
select * from county_median_house_hold_income;
select * from county_poverty;
select * from county_race;

alter table county_mertics rename column country_name to state_name;
describe county_mertics;

create table county_mertics (
B01001_001E varchar(255),
B01001_002E varchar(255),
B19013_001E varchar(255),
B19301_001E varchar(255),
B17001_001E varchar(255),
B02001_001E varchar(255),
B02001_002E varchar(255),
state	varchar(255),
county	varchar(255),
county_name	varchar(255),
country_name varchar(255)  );



ALTER TABLE county_mertics MODIFY COLUMN B02001_002E INT;
desc county_mertics;

alter table county_mertics rename column B01001_001E to population;
alter table county_mertics rename column B01001_002E to population_male;
alter table county_mertics rename column B19013_001E to median_household_income;
alter table county_mertics rename column B19301_001E to per_capita_income;
alter table county_mertics rename column B17001_001E to poverty_by_sex_by_age;
alter table county_mertics rename column B02001_001E to race;
alter table county_mertics rename column B02001_002E to race_white_alone;






describe county_mertics;


create table county_race (
B02001_001E varchar(255),
B02001_002E varchar(255),
B02001_003E varchar(255),
B02001_004E varchar(255),
B02001_005E varchar(255),
state	varchar(255),
county	varchar(255),
county_name	varchar(255),
state_name varchar(255)  );

describe county_race;
select * from county_race;
ALTER TABLE county_race MODIFY COLUMN B02001_005E INT;

alter table county_race rename column B02001_001E to total;
alter table county_race rename column B02001_002E to white_alone;
alter table county_race rename column B02001_003E to black_african_amrican;
alter table county_race rename column B02001_004E to american_indian_alaska_native;
alter table county_race rename column B02001_005E to asian_alone;



#B17001_001E,B17001_002E,B17001_003E,B17001_017E,B17001_031E,B17001_032E

create table county_poverty (
B17001_001E varchar(255),
B17001_002E varchar(255),
B17001_003E varchar(255),
B17001_017E varchar(255),
B17001_031E varchar(255),
B17001_032E varchar(255),
state	varchar(255),
county	varchar(255),
county_name	varchar(255),
state_name varchar(255)  );

desc county_poverty;
alter table county_poverty rename column B17001_001E to total;
alter table county_poverty rename column B17001_002E to total_income_below_poverty;
alter table county_poverty rename column B17001_003E to male_total_income_below_poverty;
alter table county_poverty rename column B17001_017E to female_total_income_below_poverty;
alter table county_poverty rename column B17001_031E to total_income_at_above_poverty;
alter table county_poverty rename column B17001_032E to male_total_income_at_above_poverty;

ALTER TABLE county_poverty MODIFY COLUMN B17001_032E INT;

select * from county_poverty;

#B19019_001E,B19019_002E,B19019_003E,B19019_004E,B19019_005E,B19019_006E,B19019_007E,B19019_008E,B19025_001E

create table county_median_house_hold_income (
B19019_001E varchar(255),
B19019_002E varchar(255),
B19019_003E varchar(255),
B19019_004E varchar(255),
B19019_005E varchar(255),
B19019_006E varchar(255),
B19019_007E varchar(255),
B19019_008E varchar(255),
B19025_001E varchar(255),
state	varchar(255),
county	varchar(255),
county_name	varchar(255),
state_name varchar(255)  );

select * from county_median_house_hold_income;
desc county_median_house_hold_income;

alter table county_median_house_hold_income rename column B19019_001E to total;
alter table county_median_house_hold_income rename column B19019_002E to one_person_households;
alter table county_median_house_hold_income rename column B19019_003E to two_person_households;
alter table county_median_house_hold_income rename column B19019_004E to three_person_households;
alter table county_median_house_hold_income rename column B19019_005E to four_person_households;
alter table county_median_house_hold_income rename column B19019_006E to five_person_households;
alter table county_median_house_hold_income rename column B19019_007E to six_person_households;
alter table county_median_house_hold_income rename column B19019_008E to aggregate_household_oncome;

ALTER TABLE county_median_house_hold_income MODIFY COLUMN B19019_008E INT;


select * from county_mertics;










