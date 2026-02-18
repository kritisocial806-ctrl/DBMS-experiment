EXP_6.sql
MariaDB [(none)]> SHOW Databases;
+--------------------+
| Database           |
+--------------------+
| company            |
| emp_db             |
| iilm               |
| information_schema |
| kriti              |
| mysql              |
| performance_schema |
| phpmyadmin         |
| student_info       |
| test               |
+--------------------+
10 rows in set (0.070 sec)

MariaDB [(none)]> USE kriti;
Database changed
MariaDB [kriti]> USE TABLES;
ERROR 1049 (42000): Unknown database 'tables'
MariaDB [kriti]> show tables;
+-----------------+
| Tables_in_kriti |
+-----------------+
| department      |
| emp             |
| employee        |
+-----------------+
3 rows in set (0.002 sec)

MariaDB [kriti]>   SELECT*FROM DEPARTMENT;
+--------+------------+
| DEPTNO | DNAME      |
+--------+------------+
|     10 | RESEARCH   |
|     20 | ACCOUNTING |
|     30 | SALES      |
|     40 | OPERATIONS |
+--------+------------+
4 rows in set (0.133 sec)

MariaDB [kriti]> SELECT EMPNO,ENAME,
    -> CASE DEPTNO
    -> WHEN 10 THEN 'RESEARCH'
    -> WHEN 20 THEN 'ACCOUNTING'
    -> WHEN 30 THEN ' SALES'
    -> WHEN 40 THEN 'OPERATION'
    -> END AS DEPARTMENT_NAMES
    -> FROM EMPLOYEE;
+-------+--------+------------------+
| EMPNO | ENAME  | DEPARTMENT_NAMES |
+-------+--------+------------------+
|  7369 | SMITH  | ACCOUNTING       |
|  7499 | ALLEN  |  SALES           |
|  7521 | WARD   |  SALES           |
|  7566 | JONES  | ACCOUNTING       |
|  7654 | MARTIN |  SALES           |
|  7698 | BLAKE  |  SALES           |
|  7782 | CLARK  | RESEARCH         |
|  7788 | SCOTT  | ACCOUNTING       |
|  7839 | KING   | RESEARCH         |
|  7844 | TURNER |  SALES           |
|  7876 | ADAMS  | ACCOUNTING       |
|  7900 | JAMES  |  SALES           |
|  7902 | FORD   | ACCOUNTING       |
|  7934 | MILLER | RESEARCH         |
+-------+--------+------------------+
14 rows in set (0.058 sec)

MariaDB [kriti]> SELECT DATEDIFF(CURDATE(), "2005-02-27");
+-----------------------------------+
| DATEDIFF(CURDATE(), "2005-02-27") |
+-----------------------------------+
|                              7661 |
+-----------------------------------+
1 row in set (0.006 sec)

MariaDB [kriti]> SELECT TIMESTAMPPDIFF((MONTH,'2005-02-27',CURDATE())AS age_in_months;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near '' at line 1
MariaDB [kriti]> SELECT TIMESTAMPDIFF(MONTH, "2005-02-27" , CURDATE())) AS DOB_IN_MONTHS;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near ') AS DOB_IN_MONTHS' at line 1
MariaDB [kriti]> SELECT CURDATE();
+------------+
| CURDATE()  |
+------------+
| 2026-02-18 |
+------------+
1 row in set (0.014 sec)

MariaDB [kriti]> SELECT CURTIME();
+-----------+
| CURTIME() |
+-----------+
| 10:45:25  |
+-----------+
1 row in set (0.009 sec)

MariaDB [kriti]> SELECT TIMESTAMPDIFF(DAY, "2005-02-27" , CURDATE())) AS DOB_IN_DAY;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near ') AS DOB_IN_DAY' at line 1
MariaDB [kriti]> SELECT CURDATE();
+------------+
| CURDATE()  |
+------------+
| 2026-02-18 |
+------------+
1 row in set (0.001 sec)

MariaDB [kriti]> SELECT CURTIME();
+-----------+
| CURTIME() |
+-----------+
| 10:52:47  |
+-----------+
1 row in set (0.001 sec)

MariaDB [kriti]> SELECT DATEDIFF((CURDATE(), "2005-02-27");
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near '' at line 1
MariaDB [kriti]> SELECT DATEDIFF(CURDATE(), "2005-02-27");
+-----------------------------------+
| DATEDIFF(CURDATE(), "2005-02-27") |
+-----------------------------------+
|                              7661 |
+-----------------------------------+
1 row in set (0.011 sec)

MariaDB [kriti]> SELECT TIMESTAMPDIFF(DAY, "2005-02-27", CURDATE()) AS DOB_IN_DAYS;
+-------------+
| DOB_IN_DAYS |
+-------------+
|        7661 |
+-------------+
1 row in set (0.003 sec)

MariaDB [kriti]> SELECT TIMESTAMPDIFF(MONTHS, "2005-02-27", CURDATE()) AS DOB_IN_MONTHS;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'MONTHS, "2005-02-27", CURDATE()) AS DOB_IN_MONTHS' at line 1
MariaDB [kriti]> SELECT TIMESTAMPDIFF(MONTH, "2005-02-27", CURDATE()) AS DOB_IN_MONTH;
+--------------+
| DOB_IN_MONTH |
+--------------+
|          251 |
+--------------+
1 row in set (0.002 sec)

MariaDB [kriti]> SELECT DATE_FORMAT(CURDATE(),
    -> '%W %D %M %Y')
    -> As formatted_date;
+------------------------------+
| formatted_date               |
+------------------------------+
| Wednesday 18th February 2026 |
+------------------------------+
1 row in set (0.007 sec)

MariaDB [kriti]> SELECT CONCAT(ENAME,
    -> 'has joined the company on',
    -> DATE_FORMATE (HIREDATE, '%W %D %M %Y')
    -> ) AS Required_Format
    -> FROM EMPLOYEE;
ERROR 1305 (42000): FUNCTION kriti.DATE_FORMATE does not exist
MariaDB [kriti]> SELECT CONCAT(
    -> ENAME,
    -> 'has joined the company on',
    -> DATE_FORMAT(HIREDATE, '%W %D %M %Y')
    -> ) AS Required_Format
    -> FROM EMPLOYEE;
+------------------------------------------------------------+
| Required_Format                                            |
+------------------------------------------------------------+
| SMITHhas joined the company onWednesday 17th December 1980 |
| ALLENhas joined the company onFriday 20th February 1981    |
| WARDhas joined the company onSunday 22nd February 1981     |
| JONEShas joined the company onThursday 2nd April 1981      |
| MARTINhas joined the company onMonday 28th September 1981  |
| BLAKEhas joined the company onFriday 1st May 1981          |
| CLARKhas joined the company onTuesday 9th June 1981        |
| SCOTThas joined the company onThursday 9th December 1982   |
| KINGhas joined the company onTuesday 17th November 1981    |
| TURNERhas joined the company onTuesday 8th September 1981  |
| ADAMShas joined the company onWednesday 12th January 1983  |
| JAMEShas joined the company onThursday 3rd December 1981   |
| FORDhas joined the company onThursday 3rd December 1981    |
| MILLERhas joined the company onSaturday 23rd January 1982  |
+------------------------------------------------------------+
14 rows in set (0.032 sec)

MariaDB [kriti]> SELECT DATE_FORMAT(CURDATE(), '%D %M %W %Y');
+---------------------------------------+
| DATE_FORMAT(CURDATE(), '%D %M %W %Y') |
+---------------------------------------+
| 18th February Wednesday 2026          |
+---------------------------------------+
1 row in set (0.005 sec)

MariaDB [kriti]> SELECT CONCAT(
    ->  ENAME,
    -> 'has joined the company on',
    -> DATE_FORMAT(HIREDATE, '%W %D %M %Y')
    -> ) AS message
    -> FROM EMPLOYEE;
+------------------------------------------------------------+
| message                                                    |
+------------------------------------------------------------+
| SMITHhas joined the company onWednesday 17th December 1980 |
| ALLENhas joined the company onFriday 20th February 1981    |
| WARDhas joined the company onSunday 22nd February 1981     |
| JONEShas joined the company onThursday 2nd April 1981      |
| MARTINhas joined the company onMonday 28th September 1981  |
| BLAKEhas joined the company onFriday 1st May 1981          |
| CLARKhas joined the company onTuesday 9th June 1981        |
| SCOTThas joined the company onThursday 9th December 1982   |
| KINGhas joined the company onTuesday 17th November 1981    |
| TURNERhas joined the company onTuesday 8th September 1981  |
| ADAMShas joined the company onWednesday 12th January 1983  |
| JAMEShas joined the company onThursday 3rd December 1981   |
| FORDhas joined the company onThursday 3rd December 1981    |
| MILLERhas joined the company onSaturday 23rd January 1982  |
+------------------------------------------------------------+
14 rows in set (0.044 sec)

MariaDB [kriti]> SELECT date_add(
    -> CURDATE(),
    -> interval (5- weekday(curdate())) day
    -> )As next_saturday;
+---------------+
| next_saturday |
+---------------+
| 2026-02-21    |
+---------------+
1 row in set (0.012 sec)

MariaDB [kriti]> SELECT CURTIME()AS Current_time;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'Current_time' at line 1
MariaDB [kriti]>  SELECT CURTIME()AS CurrentTime;
+-------------+
| CurrentTime |
+-------------+
| 14:39:41    |
+-------------+
1 row in set (0.003 sec)

MariaDB [kriti]> SELECT DATE_SUB(
    -> CURDATE(),INTERVAL 3 MONTH) AS THREE_MONTH_BEFORE;
+--------------------+
| THREE_MONTH_BEFORE |
+--------------------+
| 2025-11-18         |
+--------------------+
1 row in set (0.001 sec)

MariaDB [kriti]> SELECT DATE_ADD(
    -> CURDATE(), INTERVAL 3 MONTH) AS THREE_MONTH_AFTER;
+-------------------+
| THREE_MONTH_AFTER |
+-------------------+
| 2026-05-18        |
+-------------------+
1 row in set (0.003 sec)

MariaDB [kriti]>    SELECT ENAME
    -> FROM EMPLOYEE
    -> WHERE MONTH(HIREDATE) = 12;
+-------+
| ENAME |
+-------+
| SMITH |
| SCOTT |
| JAMES |
| FORD  |
+-------+
4 rows in set (0.033 sec)

MariaDB [kriti]> SELECT *
    -> FROM EMPLOYEE
    -> WHERE DAY(HIREDATE) = RIGHT(SAL, 2);
Empty set (0.006 sec)

MariaDB [kriti]> SELECT *
    -> FROM EMPLOYEE
    -> WHERE (SAL * 0.10) = YEAR(HIREDATE);
Empty set (0.003 sec)

MariaDB [kriti]> SELECT *
    -> FROM EMPLOYEE
    -> WHERE DAY(HIREDATE) <15;
+-------+--------+----------+------+------------+---------+------+--------+
| EMPNO | ENAME  | JOB      | MGR  | HIREDATE   | SAL     | COMM | DEPTNO |
+-------+--------+----------+------+------------+---------+------+--------+
|  7566 | JONES  | MANAGER  | 7839 | 1981-04-02 | 2975.00 | NULL |     20 |
|  7698 | BLAKE  | MANAGER  | 7839 | 1981-05-01 | 2850.00 | NULL |     30 |
|  7782 | CLARK  | MANAGER  | 7839 | 1981-06-09 | 2450.00 | NULL |     10 |
|  7788 | SCOTT  | ANALYST  | 7566 | 1982-12-09 | 3000.00 | NULL |     20 |
|  7844 | TURNER | SALESMAN | 7698 | 1981-09-08 | 1500.00 | 0.00 |     30 |
|  7876 | ADAMS  | CLERK    | 7788 | 1983-01-12 | 1100.00 | NULL |     20 |
|  7900 | JAMES  | CLERK    | 7698 | 1981-12-03 |  950.00 | NULL |     30 |
|  7902 | FORD   | ANALYST  | 7566 | 1981-12-03 | 3000.00 | NULL |     20 |
+-------+--------+----------+------+------------+---------+------+--------+
8 rows in set (0.001 sec)

MariaDB [kriti]> SELECT *
    -> FROM EMPLOYEE
    -> WHERE DAY(HIREDATE) >15;
+-------+--------+-----------+------+------------+---------+---------+--------+
| EMPNO | ENAME  | JOB       | MGR  | HIREDATE   | SAL     | COMM    | DEPTNO |
+-------+--------+-----------+------+------------+---------+---------+--------+
|  7369 | SMITH  | CLERK     | 7902 | 1980-12-17 |  800.00 |    NULL |     20 |
|  7499 | ALLEN  | SALESMAN  | 7698 | 1981-02-20 | 1600.00 |  300.00 |     30 |
|  7521 | WARD   | SALESMAN  | 7698 | 1981-02-22 | 1250.00 |  500.00 |     30 |
|  7654 | MARTIN | SALESMAN  | 7698 | 1981-09-28 | 1250.00 | 1400.00 |     30 |
|  7839 | KING   | PRESIDENT | NULL | 1981-11-17 | 5000.00 |    NULL |     10 |
|  7934 | MILLER | CLERK     | 7782 | 1982-01-23 | 1300.00 |    NULL |     10 |
+-------+--------+-----------+------+------------+---------+---------+--------+
6 rows in set (0.001 sec)

MariaDB [kriti]> SELECT *
    -> FROM EMPLOYEE
    -> WHERE DAY(HIREDATE) = DEPTNO;
Empty set (0.001 sec)