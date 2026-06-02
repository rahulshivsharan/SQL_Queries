

create table EmployeeTbl(
	emp_id number(2) primary key,
	emp_name varchar(100),
	age number(2),
	salary number(6),
	manager_id number(2) references EmployeeTbl
);


insert into EmployeeTbl (emp_id, emp_name, age, salary, manager_id) values (1, 'Vicktor Kingsley' , 54, 35000, null);
insert into EmployeeTbl (emp_id, emp_name, age, salary, manager_id) values (2, 'Timothy Kimberly' , 37, 67000, null);
insert into EmployeeTbl (emp_id, emp_name, age, salary, manager_id) values (3, 'Mike Jagger' , 41, 87000, null);
insert into EmployeeTbl (emp_id, emp_name, age, salary, manager_id) values (4, 'Igor Langer' , 45, 46000, null);
insert into EmployeeTbl (emp_id, emp_name, age, salary, manager_id) values (5, 'Peter Parker' , 38, 81000, null);

insert into EmployeeTbl (emp_id, emp_name, age, salary, manager_id) values (6, 'Amar Pratajapati' , 24, 5000, 1);
insert into EmployeeTbl (emp_id, emp_name, age, salary, manager_id) values (7, 'Dinesh Paal' , 27, 7000, 1);
insert into EmployeeTbl (emp_id, emp_name, age, salary, manager_id) values (8, 'Sumit Dey' , 37, 6000, 1);
insert into EmployeeTbl (emp_id, emp_name, age, salary, manager_id) values (9, 'Amit Rohidas' , 29, 5000, 1);
insert into EmployeeTbl (emp_id, emp_name, age, salary, manager_id) values (10, 'Roopkumar Pandey' , 26, 3000, 1);


insert into EmployeeTbl (emp_id, emp_name, age, salary, manager_id) values (11, 'Nagesh Kumawat' , 23, 5000, 2);
insert into EmployeeTbl (emp_id, emp_name, age, salary, manager_id) values (12, 'Dayanand Upadhyaya' , 30, 11000, 2);
insert into EmployeeTbl (emp_id, emp_name, age, salary, manager_id) values (13, 'Suraj Singh' , 29, 13000, 2);
insert into EmployeeTbl (emp_id, emp_name, age, salary, manager_id) values (14, 'Gopal Ojha' , 25, 11000, 2);
insert into EmployeeTbl (emp_id, emp_name, age, salary, manager_id) values (15, 'Ramprasad Vishwas' , 28, 17000, 2);


insert into EmployeeTbl (emp_id, emp_name, age, salary, manager_id) values (16, 'Sharad Rathod' , 32, 15000, 3);
insert into EmployeeTbl (emp_id, emp_name, age, salary, manager_id) values (17, 'Dinkar Kulkarni' , 33, 16000, 3);


insert into EmployeeTbl (emp_id, emp_name, age, salary, manager_id) values (18, 'Satish Naidu' , 31, 21000, 4);
insert into EmployeeTbl (emp_id, emp_name, age, salary, manager_id) values (19, 'Gajendra Narayanan' , 29, 22000, 4);
insert into EmployeeTbl (emp_id, emp_name, age, salary, manager_id) values (20, 'Ravi Ramakrishnan' , 30, 27000, 4);


select emp.emp_name as 'manager_name',
       manager.total_emp_reporting as 'total_emp_reporting' 
from EmployeeTbl emp,
(
     select manager_id as 'manager_id', 
            count(manager_id) as 'total_emp_reporting' 
            from EmployeeTbl  
            group by (manager_id) having manager_id is not null
     Union      
     select emp_id as 'manager_id', 
            0 as 'total_emp_reporting' 
     from EmployeeTbl where emp_id not in (
            select manager_id as 'emp_id'            
            from EmployeeTbl  
            group by (manager_id) having manager_id is not null
     ) and manager_id is null
) manager
where emp.emp_id = manager.manager_id 	




select manager.emp_name as 'manager_name',
       count(employee.emp_id) as 'employees_reporting'
       from 		EmployeeTbl manager 
	   left join 	EmployeeTbl employee 
				on 	manager.emp_id = employee.manager_id 
       where manager.emp_id in (
				select distinct manager_id from EmployeeTbl 
       ) 
       or manager.emp_id in (
				select emp_id from EmployeeTbl where manager_id is null
       )
	   group by manager.emp_id, manager.emp_name	
