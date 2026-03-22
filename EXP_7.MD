MariaDB [(none)]> use kriti;
Database changed
MariaDB [kriti]> SELECT DATEDIFF(
    ->         STR_TO_DATE(CONCAT(YEAR(CURDATE()),'-12-31'),'%Y-%m-%d'),
    ->         CURDATE()
    ->        ) AS days_remaining;
+----------------+
| days_remaining |
+----------------+
|            284 |
+----------------+
1 row in set (0.046 sec)

MariaDB [kriti]> SELECT
    -> MAX(sal) AS highest_salary,
    -> MIN(sal) AS lowest_salary,
    -> MAX(sal) - MIN(sal) AS salary_difference
    -> FROM emp;
ERROR 1146 (42S02): Table 'kriti.emp' doesn't exist
MariaDB [kriti]> SELECT
    -> MAX(sal) AS highest_salary,
    -> MIN(sal) AS lowest_salary,
    -> MAX(sal) - MIN(sal) AS salary_difference
    -> FROM employee;
+----------------+---------------+-------------------+
| highest_salary | lowest_salary | salary_difference |
+----------------+---------------+-------------------+
|        2975.00 |        800.00 |           2175.00 |
+----------------+---------------+-------------------+
1 row in set (0.038 sec)

MariaDB [kriti]> SELECT ename, sal, comm
    -> FROM emp
    -> WHERE comm > sal * 0.25;
ERROR 1146 (42S02): Table 'kriti.emp' doesn't exist
MariaDB [kriti]> SELECT ename, sal, comm
    -> FROM employee
    -> WHERE comm > sal * 0.25;
+-------+---------+--------+
| ename | sal     | comm   |
+-------+---------+--------+
| WARD  | 1250.00 | 500.00 |
+-------+---------+--------+
1 row in set (0.004 sec)

MariaDB [kriti]> SELECT ename, CONCAT('$', FORMAT(sal,2)) AS salary
    -> FROM employee;
+-------+-----------+
| ename | salary    |
+-------+-----------+
| SMITH | $800.00   |
| ALLEN | $1,600.00 |
| WARD  | $1,250.00 |
| JONES | $2,975.00 |
+-------+-----------+
4 rows in set (0.004 sec)

MariaDB [kriti]> SELECT
    -> job,
    -> SUM(CASE WHEN deptno = 10 THEN sal ELSE 0 END) AS Dept10,
    -> SUM(CASE WHEN deptno = 20 THEN sal ELSE 0 END) AS Dept20,
    -> SUM(CASE WHEN deptno = 30 THEN sal ELSE 0 END) AS Dept30,
    -> SUM(sal) AS Total_Salary
    -> FROM emp
    -> from employee
    -> GROUP BY job;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'from employee
GROUP BY job' at line 8
MariaDB [kriti]> SELECT
    -> job,
    -> SUM(CASE WHEN deptno = 10 THEN sal ELSE 0 END) AS Dept10,
    -> SUM(CASE WHEN deptno = 20 THEN sal ELSE 0 END) AS Dept20,
    -> SUM(CASE WHEN deptno = 30 THEN sal ELSE 0 END) AS Dept30,
    -> SUM(sal) AS Total_Salary
    -> FROM employee
    -> GROUP BY job;
+----------+--------+---------+---------+--------------+
| job      | Dept10 | Dept20  | Dept30  | Total_Salary |
+----------+--------+---------+---------+--------------+
| CLERK    |   0.00 |  800.00 |    0.00 |       800.00 |
| MANAGER  |   0.00 | 2975.00 |    0.00 |      2975.00 |
| SALESMAN |   0.00 |    0.00 | 2850.00 |      2850.00 |
+----------+--------+---------+---------+--------------+
3 rows in set (0.013 sec)

MariaDB [kriti]> SELECT
    -> COUNT(*) AS total_employees,
    -> SUM(YEAR(hiredate)=1980) AS hired_1980,
    -> SUM(YEAR(hiredate)=1981) AS hired_1981,
    -> SUM(YEAR(hiredate)=1982) AS hired_1982,
    -> SUM(YEAR(hiredate)=1983) AS hired_1983
    -> FROM employee;
+-----------------+------------+------------+------------+------------+
| total_employees | hired_1980 | hired_1981 | hired_1982 | hired_1983 |
+-----------------+------------+------------+------------+------------+
|               4 |          1 |          3 |          0 |          0 |
+-----------------+------------+------------+------------+------------+
1 row in set (0.005 sec)

MariaDB [kriti]> SELECT DATE_SUB(
    -> LAST_DAY(CURDATE()),
    -> INTERVAL (DAYOFWEEK(LAST_DAY(CURDATE())) - 1) DAY
    -> ) AS last_sunday;
+-------------+
| last_sunday |
+-------------+
| 2026-03-29  |
+-------------+
1 row in set (0.009 sec)

MariaDB [kriti]> SELECT deptno, COUNT(*) AS total_employees
    -> FROM employee
    -> GROUP BY deptno;
+--------+-----------------+
| deptno | total_employees |
+--------+-----------------+
|     20 |               2 |
|     30 |               2 |
+--------+-----------------+
2 rows in set (0.007 sec)

MariaDB [kriti]> SELECT job, COUNT(*) AS total_employees
    -> FROM employee
    -> GROUP BY job;
+----------+-----------------+
| job      | total_employees |
+----------+-----------------+
| CLERK    |               1 |
| MANAGER  |               1 |
| SALESMAN |               2 |
+----------+-----------------+
3 rows in set (0.002 sec)

MariaDB [kriti]> SELECT deptno, SUM(sal) AS total_salary
    -> FROM employee
    -> GROUP BY deptno;
+--------+--------------+
| deptno | total_salary |
+--------+--------------+
|     20 |      3775.00 |
|     30 |      2850.00 |
+--------+--------------+
2 rows in set (0.004 sec)

MariaDB [kriti]>