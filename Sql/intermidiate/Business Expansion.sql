
SELECT 
    ua.id,
    ua.first_name,
    ua.last_name,
    cu.id AS customer_id,
    cu.customer_name,
    COUNT(cu.id) AS customer_count
FROM 
    customer as cu
JOIN 
    contact as c ON cu.id = c.customer_id
JOIN 
    user_account as ua ON c.user_account_id = ua.id
GROUP BY 
    ua.id,
    ua.first_name,
    ua.last_name,
    cu.id,
    cu.customer_name
HAVING 
    COUNT(cu.id) > 1;


-- alternative solution

SELECT 
     contact.user_account_id,
     user_account.first_name,
     user_account.last_name,
     contact.customer_id,
     customer.customer_name,
     count(*) as numbers
FROM contact as contact
JOIN user_account as user_account
ON contact.user_account_id = user_account.id
JOIN customer as customer
ON contact.customer_id = customer.id
WHERE (contact.user_account_id, contact.customer_id) IN (
    SELECT user_account_id, customer_id FROM contact GROUP BY user_account_id, customer_id HAVING count(*) > 1
)
GROUP BY 
    contact.user_account_id ,contact.customer_id, user_account.first_name, user_account.last_name, customer.customer_name;

