# Solution: Subquery, Join
WITH A AS (
SELECT 
    b.name AS Department,
    a.name AS Employee,
    # Max function partition by department name
    MAX(salary) OVER(PARTITION BY b.name) AS HIGH,
    a.salary AS Salary
FROM Employee as a 
LEFT JOIN Department as b
ON a.departmentId = b.id
)

SELECT
    Department,
    Employee,
    Salary
FROM A
WHERE HIGH = Salary