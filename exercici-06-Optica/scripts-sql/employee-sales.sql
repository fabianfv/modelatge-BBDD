select concat(firstName, ' ', lastName) as 'Employee', count(*) as Sales
from employee e
inner join employee_glass eg
on e.idEmployee = eg.idEmployee
group by firstName, lastName
order by sales desc; 
