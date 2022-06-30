--Таблица, где будут храниться все данные
CREATE TABLE PPLE (
	surname varchar(255),
	name varchar(255),
	patronymic varchar(255)
);
--Промежуточная таблица для транспонирования
CREATE TABLE Pds (
	title varchar(255),
	WidgetID int identity(1,1) not null,
	Namee varchar(255)
);
--Ввод данных по одному запросу за 1 цикл
insert into Pds(Namee)
SELECT value FROM STRING_SPLIT('Васильев Петр Генадьевич', ' ');
/*
insert into Pds(Name)
SELECT value FROM STRING_SPLIT('Греф Герман Оскарович', ' ');
*/
--Присваивание ID для создания имен строк
update Pds
set title = 'surname'
where WidgetID = '1'
update Pds
set title = 'name'
where WidgetID = '2'
update Pds
set title = 'patronymic'
where WidgetID = '3'
--Удаление ID за ненадобностью
ALTER TABLE Pds DROP COLUMN WidgetID;
GO
--Ввод в таблицу "PPLE" транспонированной таблицы
insert into PPLE (surname, name, patronymic)
SELECT *  
	FROM Pds
PIVOT  
(  
max([namee]) FOR [title] IN ([surname], [name], [patronymic])  
) AS PivotTable;

SELECT name, surname, patronymic FROM PPLE;
--Удаление промежуточной таблицы
DROP TABLE Pds