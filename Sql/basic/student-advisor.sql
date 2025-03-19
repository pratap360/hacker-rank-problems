
SELECT roll_number,name
FROM student_information a
INNER JOIN faculty_information b
ON a.advisor = b.employee_ID
WHERE (b.gender = 'M' and b.salary>15000) or (b.gender = 'F' and b.salary>20000);


select std.roll_number, std.name 
from student_information std, faculty_information fi 
where std.advisor = fi.employee_id and (fi.gender = 'M' and fi.salary > 15000 or fi.gender = 'F' and fi.salary > 20000) 


SELECT a.stock_code
FROM price_today a
INNER JOIN price_tomorrow b ON a.stock_code = b.stock_code
WHERE b.price > a.price
ORDER BY a.stock_code asc;

select ptd.stock_code 
from price_today ptd INNER JOIN price_tomorrow ptw ON ptd.stock_code = ptw.stock_code
where ptw.price> pto.price 
order by stock_code asc;
