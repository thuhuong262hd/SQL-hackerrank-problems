/*
SELECT company_code, founder name, total number of lead managers, total number of senior managers, total number of managers, total number of employees
FROM Company, Lead_Manager, Senior_Manager, Manager, Employee

-- Contain duplicated => SELECT DISTINCT on each table
*/
SELECT 

cc.company_code, 
cc.founder, 
COUNT(DISTINCT lm.lead_manager_code) AS lead_manager_code,
COUNT(DISTINCT sm.senior_manager_code) AS senior_manager_code, 
COUNT(DISTINCT mn.manager_code) AS manager_code, 
COUNT(DISTINCT em.employee_code) AS employee_code

FROM 

Company AS cc
RIGHT JOIN Lead_Manager AS lm ON cc.company_code = lm.company_code

RIGHT JOIN Senior_Manager AS sm ON (cc.company_code = sm.company_code AND lm.lead_manager_code = sm.lead_manager_code)

RIGHT JOIN Manager AS mn ON (cc.company_code = mn.company_code AND lm.lead_manager_code = mn.lead_manager_code AND sm.senior_manager_code = mn.senior_manager_code)

RIGHT JOIN Employee AS em ON (cc.company_code = em.company_code AND lm.lead_manager_code = em.lead_manager_code AND sm.senior_manager_code = em.senior_manager_code AND mn.manager_code = em.manager_code)

GROUP BY 
cc.company_code, 
cc.founder