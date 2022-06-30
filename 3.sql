CREATE TABLE sales (
id1 int not null,
people_id int not null,
sale int not null,
price SMALLMONEY
PRIMARY KEY (id1),
FOREIGN KEY (people_id) REFERENCES people(id)
);

CREATE TABLE people (
id int not null,
names varchar(255) not null,
PRIMARY KEY (id)
);

--drop table sales
--drop table people
/*
insert into people values ( 1, 'Aleksandr');
insert into people values ( 2, 'Andrey');
insert into people values ( 3, 'Aleksey');
insert into people values ( 4, 'Egor');
insert into people values ( 5, 'Oleg');
insert into people values ( 6, 'Ivan');

insert into sales values ( 1, 1, 1, 3148);
insert into sales values ( 2, 2, 3, 1157);
insert into sales values ( 3, 1, 4, 2353);
insert into sales values ( 4, 1, 1, 993);
insert into sales values ( 5, 4, 1, 1348);
insert into sales values ( 6, 6, 1, 3211);
insert into sales values ( 7, 6, 5, 3468);
insert into sales values ( 8, 5, 6, 9543);
insert into sales values ( 9, 5, 8, 3123);
insert into sales values ( 10, 3, 6, 5753);
insert into sales values ( 11, 3, 1, 3218);
insert into sales values ( 12, 4, 3, 3218);
insert into sales values ( 13, 1, 5, 6785);
insert into sales values ( 14, 4, 2, 6331);
insert into sales values ( 15, 5, 2, 3216);
insert into sales values ( 16, 2, 1, 9654);
insert into sales values ( 17, 2, 9, 5423);
insert into sales values ( 18, 5, 3, 6243);
insert into sales values ( 19, 5, 1, 5553);
insert into sales values ( 20, 6, 4, 2334);
insert into sales values ( 21, 5, 2, 3218);
*/

select * from sales
select * from people

SELECT people.names, sum(sales.sale) as 'sale_count', RANK() over(order by sum(sales.sale) desc) sale_rank
FROM people join sales on people.id = sales.people_id
GROUP BY people.names 
SELECT SUM(sale) as 'общая сумма' from sales