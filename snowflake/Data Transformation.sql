use database POWERBI;

select * from PBI_Dataset;

// Creating table agriculture which is a copy of pbi_dataset
create table agriculture as
select * from pbi_dataset;

select * from agriculture;

// rainfall has to be increased by 11%
update agriculture 
set rainfall = 1.1*rainfall;

// value present in are column to be reduced by 10%
update agriculture
set area = 0.9* area;

// Year Value 
// Year 2004 & 2009 - Y1
// Year 2010 & 2015 - Y2
// Year 2016 & 2019 - Y3

Alter table agriculture
add year_group string;

select * from agriculture;

//updating year_group columns with below conditions

update agriculture
set year_group = 'Y1'
where year >= 2004 and year <= 2009


update agriculture
set year_group = 'Y2'
where year >= 2010 and year <= 2015


update agriculture
set year_group = 'Y3'
where year >= 2016 and year <= 2019


select * from agriculture;




// Adding Rainfall groups depending on rainfall column

// rainfall 255 & 1200 - Low
// rainfall 1200 & 2800 - Medium 
// rainfall 2800 & 4103 - High

alter table agriculture
add rainfall_groups string;

select * from agriculture;

update agriculture 
set rainfall_groups = 'Low'
where rainfall >= 255 and rainfall <=1200

update agriculture 
set rainfall_groups = 'Medium'
where rainfall >= 1201 and rainfall <=2800

update agriculture 
set rainfall_groups = 'High'
where rainfall >= 2801 and rainfall <=4103

select * from agriculture;
