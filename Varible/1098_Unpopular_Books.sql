
-- Solution 2: Subquery, Variable 

-- Solution 2 is better in terms of automation. 
-- You could update the variable to any date you want or GETDATE(), and then same analysis will be done for the new date 
DECLARE @d date; 
SET @d = '2019-06-23'

SELECT Books.book_id, name
FROM Books
LEFT JOIN Orders
ON Books.book_id = Orders.book_id AND dispatch_date BETWEEN '2018-06-23' AND '2019-06-23'
WHERE available_from <= DATEADD(M,-1,@d)
GROUP BY Books.book_id, name
HAVING SUM(quantity) < 10 OR SUM(quantity) IS NULL
