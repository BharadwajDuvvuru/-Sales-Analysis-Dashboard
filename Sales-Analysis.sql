UNLOCK TABLES;


select*
from  sales.customers;


-- customers based high spenders --

WITH Customer_Transactions AS (
    SELECT 
        customers.custmer_name,
        transactions.*
    FROM 
        customers
    JOIN 
        transactions
    ON 
        customers.customer_code = transactions.customer_code
)

SELECT * 
FROM Customer_Transactions
where sales_amount > 100000
order by sales_amount desc;


-- customers based Frequent buyers --

WITH Frequent_buyer AS (
    SELECT customers.custmer_name,
           transactions.*
    FROM customers
    JOIN transactions
    ON customers.customer_code = transactions.customer_code
)

SELECT customer_code,
       COUNT(*) AS buyer
FROM Frequent_buyer
GROUP BY customer_code
ORDER BY buyer DESC ;

-- Sales Trend Analysis -- 

SELECT date_format(order_date,'%y-%m') as sales_month,
       sum(sales_qty) as total_sales_qty,
       sum(sales_amount) as  total_sales_amount
 FROM sales.transactions
 group by sales_month
 order by total_sales_qty desc ;
 
 -- Average Revenue Per Customer (ARPC)-- 
 
 SELECT  customer_code,
         avg(sales_amount) as avg_sales_amount
 FROM sales.transactions 
 group by customer_code
 order by total_sales_amount desc;
 
 



