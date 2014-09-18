/*
 * The below tutorial is about fetching employees having highest salary in companies they are working.
 */

create table Company_Tbl_One(
	company_Id int primary key,
	company_name varchar(100)
)

create table Employee_Tbl_One(
	employee_Id int primary key,
	employee_name varchar(100),
	company int references Company_Tbl_One
)

alter table Employee_Tbl_One add salary int

insert into Company_Tbl_One values(12,'Facebook Inc');
insert into Company_Tbl_One values(11,'Google Inc');
insert into Company_Tbl_One values(10,'Yahoo Inc');
insert into Company_Tbl_One values(14,'AOL Inc');

insert into EMPLOYEE_TBL_ONE(employee_Id,employee_name,company,salary) values(1, 'Tom Jackson',12,1000);
insert into EMPLOYEE_TBL_ONE(employee_Id,employee_name,company,salary) values(2, 'Jimmy John',12,200);
insert into EMPLOYEE_TBL_ONE(employee_Id,employee_name,company,salary) values(3, 'Samual Jackson',11,2000);
insert into EMPLOYEE_TBL_ONE(employee_Id,employee_name,company,salary) values(4, 'Sam Raime',10,3000);
insert into EMPLOYEE_TBL_ONE(employee_Id,employee_name,company,salary) values(5, 'Tidy Mann',14,5000);
insert into EMPLOYEE_TBL_ONE(employee_Id,employee_name,company,salary) values(6, 'Oliver Stone',14,5300);
insert into EMPLOYEE_TBL_ONE(employee_Id,employee_name,company,salary) values(7, 'Falcon Gonzalies',10,3300);
insert into EMPLOYEE_TBL_ONE(employee_Id,employee_name,company,salary) values(8, 'Ister Jack',11,2300);

select e.employee_name, c.company_name
from 	EMPLOYEE_TBL_ONE e,
		COMPANY_TBL_ONE c,
		(select max(salary) as SALARY,
				company as COMPANY_ID 
				from EMPLOYEE_TBL_ONE group by COMPANY) x
where 	c.company_Id = x.COMPANY_ID 
and   	e.salary = x.SALARY
and   	e.company = c.company_Id


/*
 * you will get result as employee name from each company having hightest salary 
 */






