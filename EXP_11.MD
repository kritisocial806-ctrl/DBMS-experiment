MariaDB [kriti]> SELECT M.ENAME
    -> FROM EMPLOYEE M
    -> WHERE M.JOB = 'MANAGER'
    -> AND M.SAL > (
    -> SELECT AVG(E.SAL)
    -> FROM EMPLOYEE E
    -> WHERE E.MGR = M.EMPNO
    -> );
+-------+
| ENAME |
+-------+
| BLAKE |
| CLARK |
+-------+
2 rows in set (0.055 sec)

MariaDB [kriti]> SELECT ENAME
    -> FROM EMPLOYEE
    -> WHERE JOB = 'MANAGER'
    -> AND SAL > (
    -> SELECT AVG(SAL)
    -> FROM EMPLOYEE
    -> );
+-------+
| ENAME |
+-------+
| JONES |
| BLAKE |
| CLARK |
+-------+
3 rows in set (0.001 sec)

MariaDB [kriti]> SELECT D.DNAME
    -> FROM DEPARTMENT D
    -> JOIN EMPLOYEE E
    -> ON D.DEPTNO = E.DEPTNO
    -> GROUP BY D.DNAME
    -> HAVING COUNT(*) > 3;
+----------+
| DNAME    |
+----------+
| RESEARCH |
| SALES    |
+----------+
2 rows in set (0.012 sec)

MariaDB [kriti]> SELECT ENAME, SAL
    -> FROM EMPLOYEE
    -> WHERE SAL = (
    -> (
    -> (SELECT MAX(SAL) FROM EMPLOYEE) +
    -> (SELECT MIN(SAL) FROM EMPLOYEE)
    -> ) / 2
    -> );
Empty set (0.051 sec)

MariaDB [kriti]> SELECT ENAME, SAL
    -> FROM EMPLOYEE
    -> ORDER BY SAL DESC
    -> LIMIT 1;
+-------+---------+
| ENAME | SAL     |
+-------+---------+
| KING  | 5000.00 |
+-------+---------+
1 row in set (0.006 sec)

MariaDB [kriti]>  SELECT ENAME, SAL
    -> FROM EMPLOYEE
    -> ORDER BY SAL DESC
    -> LIMIT 5;
+-------+---------+
| ENAME | SAL     |
+-------+---------+
| KING  | 5000.00 |
| FORD  | 3000.00 |
| SCOTT | 3000.00 |
| JONES | 2975.00 |
| BLAKE | 2850.00 |
+-------+---------+
5 rows in set (0.041 sec)

MariaDB [kriti]> SELECT E.ENAME, E.SAL
    -> FROM EMPLOYEE E
    -> JOIN SALGRADE S
    -> ON E.SAL BETWEEN S.LOSAL AND S.HISAL
    -> WHERE E.ENAME = 'FORD'
    -> AND E.SAL = (
    -> SELECT MAX(E2.SAL)
    -> FROM EMPLOYEE E2
    -> JOIN SALGRADE S2
    -> ON E2.SAL BETWEEN S2.LOSAL AND S2.HISAL
    -> WHERE S2.GRADE = S.GRADE
    -> );
+-------+---------+
| ENAME | SAL     |
+-------+---------+
| FORD  | 3000.00 |
+-------+---------+
1 row in set (0.028 sec)

MariaDB [kriti]> SELECT E.ENAME, D.DNAME, E.JOB, D.LOCATION
    -> FROM EMPLOYEE E
    -> JOIN DEPARTMENT D
    -> ON E.DEPTNO = D.DEPTNO
    -> WHERE E.JOB = 'MANAGER';
+-------+------------+---------+-----------+
| ENAME | DNAME      | JOB     | LOCATION  |
+-------+------------+---------+-----------+
| JONES | RESEARCH   | MANAGER | CHENNAI   |
| BLAKE | SALES      | MANAGER | HYDERABAD |
| CLARK | ACCOUNTING | MANAGER | MUMBAI    |
+-------+------------+---------+-----------+
3 rows in set (0.046 sec)

MariaDB [kriti]> DELETE FROM EMPLOYEE
    -> WHERE HIREDATE < '1982-12-31'
    -> AND DEPTNO IN (
    -> SELECT DEPTNO
    -> FROM DEPARTMENT
    -> WHERE LOCATION IN ('MUMBAI','DELHI')
    -> );
Query OK, 3 rows affected (0.026 sec)

MariaDB [kriti]> SELECT ENAME, SAL, COMM,
    -> (SAL + IFNULL(COMM,0)) AS NET_PAY
    -> FROM EMPLOYEE
    -> WHERE (SAL + IFNULL(COMM,0)) >= ANY (
    -> SELECT SAL
    -> FROM EMPLOYEE
    -> );
+--------+---------+---------+---------+
| ENAME  | SAL     | COMM    | NET_PAY |
+--------+---------+---------+---------+
| SMITH  |  800.00 |    NULL |  800.00 |
| ALLEN  | 1600.00 |  300.00 | 1900.00 |
| WARD   | 1250.00 |  500.00 | 1750.00 |
| JONES  | 2975.00 |    NULL | 2975.00 |
| MARTIN | 1250.00 | 1400.00 | 2650.00 |
| BLAKE  | 2850.00 |    NULL | 2850.00 |
| SCOTT  | 3000.00 |    NULL | 3000.00 |
| TURNER | 1500.00 |    0.00 | 1500.00 |
| ADAMS  | 1100.00 |    NULL | 1100.00 |
| JAMES  |  950.00 |    NULL |  950.00 |
| FORD   | 3000.00 |    NULL | 3000.00 |
+--------+---------+---------+---------+
11 rows in set (0.002 sec)