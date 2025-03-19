SELECT a.stock_code
FROM price_today a
INNER JOIN price_tomorrow b ON a.stock_code = b.stock_code
WHERE b.price > a.price
ORDER BY a.stock_code asc;


-- alternative solution
select ptd.stock_code 
from price_today ptd INNER JOIN price_tomorrow ptw ON ptd.stock_code = ptw.stock_code
where ptw.price> pto.price 
order by stock_code asc;