/* Write your T-SQL query statement below */
WITH A AS (
SELECT MAX(salary) AS HIGHEST
FROM Employee
)
SELECT salary AS SecondHighestSalary
FROM A
WHERE salary < HIGHEST 
ORDER BY 1 
LIMIT 1 