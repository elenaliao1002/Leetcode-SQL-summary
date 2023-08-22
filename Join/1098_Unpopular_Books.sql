SELECT Books.book_id, name
FROM Books
LEFT JOIN Orders
ON Books.book_id = Orders.book_id AND dispatch_date BETWEEN '2018-06-23' AND '2019-06-23'
WHERE available_from <= '2019-05-23'
GROUP BY Books.book_id
HAVING SUM(quantity) < 10 OR SUM(quantity) IS NULL
