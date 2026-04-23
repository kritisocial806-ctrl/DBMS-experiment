
MariaDB [(none)]> use kriti
Database changed
MariaDB [kriti]> SELECT E.ENAME
    -> FROM EMPLOYEE E
    -> JOIN EMPLOYEE M
    -> ON E.MGR = M.EMPNO
    -> WHERE E.SAL < M.SAL
    -> AND E.SAL > ANY (SELECT SAL FROM EMPLOYEE);
+--------+
| ENAME  |
+--------+
| ALLEN  |
| WARD   |
| MARTIN |
| TURNER |
| ADAMS  |
| JAMES  |
+--------+
6 rows in set (0.055 sec)

MariaDB [kriti]> SELECT COUNT(*) AS COUNT
    -> FROM EMPLOYEE E
    -> JOIN EMPLOYEE M
    -> ON E.MGR = M.EMPNO
    -> WHERE E.SAL > M.SAL;
+-------+
| COUNT |
+-------+
|     2 |
+-------+
1 row in set (0.000 sec)

MariaDB [kriti]> SELECT E.ENAME
    -> FROM EMPLOYEE E
    -> JOIN EMPLOYEE M
    -> ON E.MGR = M.EMPNO
    -> WHERE E.JOB = 'MANAGER'
    -> AND M.JOB <> 'PRESIDENT';
Empty set (0.001 sec)

MariaDB [kriti]> DELETE FROM DEPARTMENT
    -> WHERE DEPTNO NOT IN (SELECT DISTINCT DEPTNO FROM EMPLOYEE);
Query OK, 0 rows affected (0.002 sec)

MariaDB [kriti]> DELETE FROM EMPLOYEE
    -> WHERE DEPTNO NOT IN (SELECT DEPTNO FROM DEPARTMENT);
Query OK, 0 rows affected (0.000 sec)

MariaDB [kriti]> SELECT ENAME
    -> FROM EMPLOYEE
    -> WHERE SAL NOT BETWEEN
    -> (SELECT MIN(LOSAL) FROM SALGRADE)
    -> AND
    -> (SELECT MAX(HISAL) FROM SALGRADE);
Empty set (0.002 sec)

MariaDB [kriti]> SELECT ENAME, SAL, COMM,
    -> (SAL + IFNULL(COMM,0)) AS NET_PAY
    -> FROM EMPLOYEE
    -> WHERE (SAL + IFNULL(COMM,0)) =
    -> (
    ->     SELECT MAX(SAL + IFNULL(COMM,0)) FROM EMPLOYEE
    -> );
+-------+---------+------+---------+
| ENAME | SAL     | COMM | NET_PAY |
+-------+---------+------+---------+
| SCOTT | 3000.00 | NULL | 3000.00 |
| FORD  | 3000.00 | NULL | 3000.00 |
+-------+---------+------+---------+
2 rows in set (0.001 sec)

MariaDB [kriti]> SELECT ENAME
    -> FROM EMPLOYEE E
    -> JOIN DEPARTMENT D
    -> ON E.DEPTNO = D.DEPTNO
    -> WHERE D.DNAME IN ('SALES','RESEARCH');
+--------+
| ENAME  |
+--------+
| SMITH  |
| ALLEN  |
| WARD   |
| JONES  |
| MARTIN |
| BLAKE  |
| SCOTT  |
| TURNER |
| ADAMS  |
| JAMES  |
| FORD   |
+--------+
11 rows in set (0.001 sec)

MariaDB [kriti]> SELECT S.GRADE
    -> FROM EMPLOYEE E
    -> JOIN SALGRADE S
    -> ON E.SAL BETWEEN S.LOSAL AND S.HISAL
    -> WHERE E.ENAME = 'JONES';
+-------+
| GRADE |
+-------+
| D     |
+-------+
1 row in set (0.001 sec)

MariaDB [kriti]> SELECT D.DNAME
    -> FROM DEPARTMENT D
    -> WHERE LENGTH(D.DNAME) IN (
    ->     SELECT COUNT(*)
    ->     FROM EMPLOYEE
    ->     GROUP BY DEPTNO
    -> );
+-------+
| DNAME |
+-------+
| SALES |
+-------+
1 row in set (0.001 sec)

MariaDB [kriti]>








