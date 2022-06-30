--�������, ��� ����� ��������� ��� ������
CREATE TABLE PPLE (
	surname varchar(255),
	name varchar(255),
	patronymic varchar(255)
);
--������������� ������� ��� ����������������
CREATE TABLE Pds (
	title varchar(255),
	WidgetID int identity(1,1) not null,
	Namee varchar(255)
);
--���� ������ �� ������ ������� �� 1 ����
insert into Pds(Namee)
SELECT value FROM STRING_SPLIT('�������� ���� ����������', ' ');
/*
insert into Pds(Name)
SELECT value FROM STRING_SPLIT('���� ������ ���������', ' ');
*/
--������������ ID ��� �������� ���� �����
update Pds
set title = 'surname'
where WidgetID = '1'
update Pds
set title = 'name'
where WidgetID = '2'
update Pds
set title = 'patronymic'
where WidgetID = '3'
--�������� ID �� �������������
ALTER TABLE Pds DROP COLUMN WidgetID;
GO
--���� � ������� "PPLE" ����������������� �������
insert into PPLE (surname, name, patronymic)
SELECT *  
	FROM Pds
PIVOT  
(  
max([namee]) FOR [title] IN ([surname], [name], [patronymic])  
) AS PivotTable;

SELECT name, surname, patronymic FROM PPLE;
--�������� ������������� �������
DROP TABLE Pds