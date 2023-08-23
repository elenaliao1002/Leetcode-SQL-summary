WITH SENIOR AS
(SELECT 
  project_id,
  MAX(experience_years) max_exp
FROM Project 
LEFT JOIN Employee 
ON Project.employee_id = Employee.employee_id
GROUP BY project_id)

SELECT PROJECT.project_id, Employee.employee_id
FROM PROJECT
  INNER JOIN SENIOR
  ON SENIOR.project_id = PROJECT.project_id
  INNER JOIN Employee 
  ON SENIOR.max_exp = Employee.experience_years 
    AND PROJECT.employee_id = Employee.employee_id
