
create table tbl_department(dept_id int primary key, dept_name varchar);
create table tbl_employee( emp_id int primary key,  emp_name varchar, dept_id int, salary int, foreign key (dept_id) references tbl_department);




insert into tbl_department(dept_id,dept_name) values(123, 'Human Resource')
insert into tbl_department(dept_id,dept_name) values(134, 'Technology')
insert into tbl_department(dept_id,dept_name) values(174, 'Finance')
insert into tbl_department(dept_id,dept_name) values(194, 'Operations')


insert into tbl_employee(emp_id, emp_name, dept_id, salary) values (324,'Tom Hanks', 194, 21000)
insert into tbl_employee(emp_id, emp_name, dept_id, salary) values (524,'Christina Sims', 174, 11000)
insert into tbl_employee(emp_id, emp_name, dept_id, salary) values (981,'Vincent Jacobs', 123, 51000)
insert into tbl_employee(emp_id, emp_name, dept_id, salary) values (851,'Jim Crank', 134, 35000)


insert into tbl_employee(emp_id, emp_name, dept_id, salary) values (124,'Linda Vaughan', 194, 45000)
insert into tbl_employee(emp_id, emp_name, dept_id, salary) values (134,'Simon Lamar', 174, 14500)
insert into tbl_employee(emp_id, emp_name, dept_id, salary) values (191,'Victor McClan', 123, 11450)
insert into tbl_employee(emp_id, emp_name, dept_id, salary) values (171,'Denzel Carlos', 134, 16780)


insert into tbl_employee(emp_id, emp_name, dept_id, salary) values (214,'Chris Martin', 194, 32000)
insert into tbl_employee(emp_id, emp_name, dept_id, salary) values (413,'Jack Nickholson', 174, 32100)
insert into tbl_employee(emp_id, emp_name, dept_id, salary) values (901,'Tom Cruize', 123, 12300)
insert into tbl_employee(emp_id, emp_name, dept_id, salary) values (940,'Jim Carry', 134, 64700)


insert into tbl_employee(emp_id, emp_name, dept_id, salary) values (102,'John Williams', 194, 35800)
insert into tbl_employee(emp_id, emp_name, dept_id, salary) values (302,'Mathew Sampson', 174, 21300)
insert into tbl_employee(emp_id, emp_name, dept_id, salary) values (161,'Rick Turner', 123, 62000)
insert into tbl_employee(emp_id, emp_name, dept_id, salary) values (638,'Willy Carlton', 134, 26900)


-- number of employee per department
select d.dept_name, count(*) from tbl_employee as e, tbl_department as d where e.dept_id = d.dept_id  group by e.dept_id

-- maximum salary per department
select d.dept_name, max(e.salary) from tbl_employee as e, tbl_department as d where e.dept_id = d.dept_id 
group by e.dept_id 


--- Second hightest salary per department
select e.dept_id, e.salary from tbl_employee as e,  
(
	select dept_id as 'dept_id' , max(salary) as 'salary' from tbl_employee
	group by dept_id
) as d 
where 	e.dept_id = d.dept_id 
		group by (e.dept_id) 
		having e.salary < d.salary  


-- select the department name and employee's second highest salary
select d.dept_name,x.salary from tbl_department as d,
(
	select e.dept_id as 'dept_id', e.salary as 'salary' from tbl_employee as e,  
	(
		select dept_id as 'dept_id' , max(salary) as 'salary' from tbl_employee
		group by dept_id
	) as d 
	where 	e.dept_id = d.dept_id 
			group by (e.dept_id) having e.salary < d.salary   
) as x where d.dept_id = x.dept_id

drop table tbl_employee
drop table tbl_employee
