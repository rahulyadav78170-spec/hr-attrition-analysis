BQ1: Overall attrition rate
SELECT
        COUNT(*)                              AS total_employees,
        SUM(attrition)                        AS employees_left,
        ROUND(AVG(attrition) * 100, 1)        AS attrition_rate_pct
    FROM employees;

BQ2: Attrition by department
SELECT
        department,
        COUNT(*)                           AS total,
        SUM(attrition)                     AS left_count,
        ROUND(AVG(attrition) * 100, 1)     AS attrition_rate_pct
    FROM employees
    GROUP BY department
    ORDER BY attrition_rate_pct DESC;

 BQ3: Attrition by salary bucket
SELECT
        CASE
            WHEN monthlyincome <= 3000  THEN '1. Low (<=3000)'
            WHEN monthlyincome <= 6000  THEN '2. Mid (3001-6000)'
            WHEN monthlyincome <= 10000 THEN '3. High (6001-10000)'
            ELSE                             '4. Very High (10000+)'
        END                                AS salary_bucket,
        COUNT(*)                           AS total,
        SUM(attrition)                     AS left_count,
        ROUND(AVG(attrition) * 100, 1)     AS attrition_rate_pct
    FROM employees
    GROUP BY salary_bucket
    ORDER BY salary_bucket;

 BQ4: Attrition by age group
  SELECT
        CASE
            WHEN age <= 25 THEN '1. Under 25'
            WHEN age <= 35 THEN '2. 26 to 35'
            WHEN age <= 45 THEN '3. 36 to 45'
            ELSE                '4. Above 45'
        END                                AS age_group,
        COUNT(*)                           AS total,
        SUM(attrition)                     AS left_count,
        ROUND(AVG(attrition) * 100, 1)     AS attrition_rate_pct
    FROM employees
    GROUP BY age_group
    ORDER BY age_group;

BQ5: Overtime vs attrition
 SELECT
        CASE WHEN overtime = 1 THEN 'Works Overtime'
             ELSE 'No Overtime' END        AS overtime_status,
        COUNT(*)                           AS total,
        SUM(attrition)                     AS left_count,
        ROUND(AVG(attrition) * 100, 1)     AS attrition_rate_pct
    FROM employees
    GROUP BY overtime
    ORDER BY attrition_rate_pct DESC;

 BQ6: Attrition by job role
SELECT
        jobrole,
        COUNT(*)                           AS total,
        SUM(attrition)                     AS left_count,
        ROUND(AVG(attrition) * 100, 1)     AS attrition_rate_pct
    FROM employees
    GROUP BY jobrole
    ORDER BY attrition_rate_pct DESC;
