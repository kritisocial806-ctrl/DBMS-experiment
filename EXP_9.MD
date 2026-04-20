EXP9.MD
MariaDB [kriti]> SELECT ENAME
    -> FROM EMPLOYEE
    -> WHERE DEPTNO = (
    ->     SELECT DEPTNO
    ->     FROM DEPARTMENT
    ->     WHERE LOCATION = 'MUMBAI'
    -> );
+--------+
| ENAME  |
+--------+
| CLARK  |
| KING   |
| MILLER |
+--------+
3 rows in set (0.012 sec)

MariaDB [kriti]> SELECT ENAME
    -> FROM EMPLOYEE
    -> WHERE SAL = (SELECT MAX(SAL) FROM EMPLOYEE);
+-------+
| ENAME |
+-------+
| KING  |
+-------+
1 row in set (0.048 sec)

MariaDB [kriti]> SELECT EMPNO, ENAME
    -> FROM EMPLOYEE
    -> WHERE JOB = 'CLERK'
    -> AND SAL = (
    -> SELECT MAX(SAL)
    -> FROM EMPLOYEE
    -> WHERE JOB = 'CLERK'
    -> );
+-------+--------+
| EMPNO | ENAME  |
+-------+--------+
|  7934 | MILLER |
+-------+--------+
1 row in set (0.012 sec)

MariaDB [kriti]> SELECT ENAME
    -> FROM EMPLOYEE
    -> WHERE JOB = 'SALESMAN'
    -> AND SAL > (
    -> SELECT MAX(SAL)
    -> FROM EMPLOYEE
    -> WHERE JOB = 'CLERK'
    -> );
+--------+
| ENAME  |
+--------+
| ALLEN  |
| TURNER |
+--------+
2 rows in set (0.001 sec)

MariaDB [kriti]> MariaDB [kriti]> SELECT ENAME
    ->     -> FROM EMPLOYEE
    ->     -> WHERE JOB = 'CLERK'
    ->     -> AND SAL > (SELECT SAL FROM EMPLOYEE WHERE ENAME = 'JAMES')
    ->     -> AND SAL < (SELECT SAL FROM EMPLOYEE WHERE ENAME = 'SCOTT');
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'MariaDB [kriti]> SELECT ENAME
    -> FROM EMPLOYEE
    -> WHERE JOB = 'CLERK'...' at line 1
MariaDB [kriti]> SELECT ENAME
    -> FROM EMPLOYEE
    -> WHERE SAL > (
    -> SELECT SAL
    -> FROM EMPLOYEE
    -> WHERE ENAME = 'JAMES'
    -> )
    -> OR SAL > (
    -> SELECT SAL
    -> FROM EMPLOYEE
    -> WHERE ENAME = 'SCOTT'
    -> );
+--------+
| ENAME  |
+--------+
| ALLEN  |
| WARD   |
| JONES  |
| MARTIN |
| BLAKE  |
| CLARK  |
| SCOTT  |
| KING   |
| TURNER |
| ADAMS  |
| FORD   |
| MILLER |
+--------+
12 rows in set (0.078 sec)

MariaDB [kriti]> SELECT ENAME
    -> FROM EMPLOYEE
    -> WHERE JOB = 'CLERK'
    -> AND SAL > (
    -> SELECT SAL
    -> FROM EMPLOYEE
    -> WHERE ENAME = 'JAMES'
    -> ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near '' at line 7
MariaDB [kriti]> SELECT ENAME
    -> FROM EMPLOYEE
    -> WHERE JOB = 'CLERK'
    -> AND SAL > (
    -> SELECT MAX(SAL)
    -> FROM EMPLOYEE
    -> WHERE ENAME = 'JAMES'
    -> )
    -> AND SAL < (
    -> SELECT MAX(SAL)
    -> FROM EMPLOYEE
    -> WHERE ENAME = 'SCOTT'
    -> );
+--------+
| ENAME  |
+--------+
| ADAMS  |
| MILLER |
+--------+
2 rows in set (0.038 sec)

MariaDB [kriti]> SELECT ENAME
    -> FROM EMPLOYEE E
    -> WHERE SAL = (
    -> SELECT MAX(SAL)
    -> FROM EMPLOYEE
    -> WHERE DEPTNO = E.DEPTNO
    -> );
+-------+
| ENAME |
+-------+
| BLAKE |
| SCOTT |
| KING  |
| FORD  |
+-------+
4 rows in set (0.020 sec)

MariaDB [kriti]> SELECT ENAME
    -> FROM EMPLOYEE E
    -> WHERE SAL = (
    -> SELECT MAX(SAL)
    -> FROM EMPLOYEE
    -> WHERE JOB = E.JOB
    -> );
+--------+
| ENAME  |
+--------+
| ALLEN  |
| JONES  |
| SCOTT  |
| KING   |
| FORD   |
| MILLER |
+--------+
6 rows in set (0.010 sec)

MariaDB [kriti]> SELECT ENAME
    -> FROM EMPLOYEE
    -> WHERE DEPTNO IN (
    -> SELECT DEPTNO
    -> FROM DEPARTMENT
    -> WHERE DNAME = 'ACCOUNTING'
    -> );
+--------+
| ENAME  |
+--------+
| CLARK  |
| KING   |
| MILLER |
+--------+
3 rows in set (0.016 sec)

MariaDB [kriti]> SELECT ENAME
    -> FROM EMPLOYEE
    -> WHERE DEPTNO IN (
    -> SELECT DEPTNO
    -> FROM DEPARTMENT
    -> WHERE LOCATION = 'MUMBAI'
    -> );
+--------+
| ENAME  |
+--------+
| CLARK  |
| KING   |
| MILLER |
+--------+
3 rows in set (0.001 sec)

MariaDB [kriti]> SELECT JOB, SUM(SAL) AS TOTAL_SALARY
    -> FROM EMPLOYEE
    -> GROUP BY JOB
    -> HAVING SUM(SAL) > (
    -> SELECT MAX(SAL)
    -> FROM EMPLOYEE
    -> WHERE JOB = 'MANAGER'
    -> );
+-----------+--------------+
| JOB       | TOTAL_SALARY |
+-----------+--------------+
| ANALYST   |      6000.00 |
| CLERK     |      4150.00 |
| MANAGER   |      8275.00 |
| PRESIDENT |      5000.00 |
| SALESMAN  |      5600.00 |
+-----------+--------------+
5 rows in set (0.010 sec)

MariaDB [kriti]>