MariaDB [(none)]> use kriti
Database changed
MariaDB [kriti]> SELECT E.ENAME, D.DNAME
    -> FROM EMPLOYEE E
    -> JOIN DEPARTMENT D
    -> ON E.DeptNo = D.DeptNo;
+-------+----------+
| ENAME | DNAME    |
+-------+----------+
| SMITH | RESEARCH |
| JONES | RESEARCH |
| ALLEN | SALES    |
| WARD  | SALES    |
+-------+----------+
4 rows in set (0.216 sec)

MariaDB [kriti]> SELECT E.ENAME AS EMP_NAME, M.ENAME AS MGR_NAME
    -> FROM EMPLOYEE E
    -> JOIN EMPLOYEE M
    -> ON E.MGR = M.EMPNO
    -> WHERE M.ENAME = "JONES";
Empty set (0.090 sec)

MariaDB [kriti]> SELECT E.ENAME AS EMP_NAME, M.ENAME AS MGR_NAME
    -> FROM EMPLOYEE E
    -> JOIN EMPLOYEE M
    -> WHERE M.ENAME = 'JONES'
    -> ;
+----------+----------+
| EMP_NAME | MGR_NAME |
+----------+----------+
| SMITH    | JONES    |
| ALLEN    | JONES    |
| WARD     | JONES    |
| JONES    | JONES    |
+----------+----------+
4 rows in set (0.007 sec)

MariaDB [kriti]> SELECT E.ENAME, E.JOB, D.DNAME, M.ENAME AS MANAGER_NAME, S.GRADE
    -> FROM EMPLOYEE E
    -> JOIN DEPARTMENT D ON E.DEPTNO = D.DEPTNO
    -> LEFT JOIN EMPLOYEE M ON E.MGR = M.EMPNO
    -> JOIN SALGRADE S ON E.SAL BETWEEN S.LOSAL AND S.HISAL
    -> ORDER BY D.NAME;
ERROR 1054 (42S22): Unknown column 'D.NAME' in 'order clause'
MariaDB [kriti]> SELECT E.ENAME, E.JOB, D.DNAME, M.ENAME AS MANAGER_NAME, S.GRADE
    -> FROM EMPLOYEE E
    -> JOIN DEPARTMENT D ON E.DEPTNO = D.DEPTNO
    -> LEFT JOIN EMPLOYEE M ON E.MGR = M.EMPNO
    -> JOIN SALGRADE S ON E.SAL BETWEEN S.LOSAL AND S.HISAL
    -> ORDER BY D.DNAME;
+-------+----------+----------+--------------+-------+
| ENAME | JOB      | DNAME    | MANAGER_NAME | GRADE |
+-------+----------+----------+--------------+-------+
| SMITH | CLERK    | RESEARCH | NULL         | A     |
| JONES | MANAGER  | RESEARCH | NULL         | D     |
| SMITH | CLERK    | RESEARCH | NULL         | A     |
| JONES | MANAGER  | RESEARCH | NULL         | D     |
| WARD  | SALESMAN | SALES    | NULL         | B     |
| ALLEN | SALESMAN | SALES    | NULL         | C     |
| ALLEN | SALESMAN | SALES    | NULL         | C     |
| WARD  | SALESMAN | SALES    | NULL         | B     |
+-------+----------+----------+--------------+-------+
8 rows in set (0.071 sec)

MariaDB [kriti]> ALTER TABLE DEPARTMENT ADD LOCATION VARCHAR(10);
ERROR 1060 (42S21): Duplicate column name 'LOCATION'
MariaDB [kriti]> SELECT E.ENAME, E.JOB, M.ENAME AS MANAGER_NAME
    -> FROM EMPLOYEE E
    -> FROM JOIN EMPLOYEE M
    -> ON M.MGR = E.EMPNO;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'FROM JOIN EMPLOYEE M
ON M.MGR = E.EMPNO' at line 3
MariaDB [kriti]> SELECT E.ENAME, E.JOB, M.ENAME AS MANAGER_NAME
    -> FROM EMPLOYEE E
    -> LEFT JOIN EMPLOYEE M
    -> ON M.MGR = E.EMPNO;
+-------+----------+--------------+
| ENAME | JOB      | MANAGER_NAME |
+-------+----------+--------------+
| SMITH | CLERK    | NULL         |
| ALLEN | SALESMAN | NULL         |
| WARD  | SALESMAN | NULL         |
| JONES | MANAGER  | NULL         |
+-------+----------+--------------+
4 rows in set (0.006 sec)

MariaDB [kriti]> SELECT* FROM TABLE DEPARTMENT;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'TABLE DEPARTMENT' at line 1
MariaDB [kriti]> SELECT FROM TABLE Department;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'FROM TABLE Department' at line 1
MariaDB [kriti]> SELECT * FROM TABLE Department;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'TABLE Department' at line 1
MariaDB [kriti]> SELECT * Department;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'Department' at line 1
MariaDB [kriti]> SELECT * FROM Department;
+--------+------------+-----------+
| DEPTNO | DNAME      | LOCATION  |
+--------+------------+-----------+
|     10 | ACCOUNTING | Mumbai    |
|     20 | RESEARCH   | Chennai   |
|     30 | SALES      | Hyderabad |
|     40 | OPERATIONS | Delhi     |
+--------+------------+-----------+
4 rows in set (0.009 sec)

MariaDB [kriti]> SELECT E.ENAME, E.JOB, D.DNAME, E.SAL, S.GRADE
    -> FROM EMPLOYEE E
    -> JOIN DEPARTMENT D
    -> ON E.DEPTNO = D.DEPTNO
    -> JOIN SALGRADE S
    -> ON E.SAL BETWEEN LOSAL AND HISAL
    -> WHERE E.JOB <> 'CLERK'ORDER BY E.SAL DESC;
+-------+----------+----------+---------+-------+
| ENAME | JOB      | DNAME    | SAL     | GRADE |
+-------+----------+----------+---------+-------+
| JONES | MANAGER  | RESEARCH | 2975.00 | D     |
| JONES | MANAGER  | RESEARCH | 2975.00 | D     |
| ALLEN | SALESMAN | SALES    | 1600.00 | C     |
| ALLEN | SALESMAN | SALES    | 1600.00 | C     |
| WARD  | SALESMAN | SALES    | 1250.00 | B     |
| WARD  | SALESMAN | SALES    | 1250.00 | B     |
+-------+----------+----------+---------+-------+
6 rows in set (0.062 sec)

MariaDB [kriti]> SELECT E.ENAME, E.JOB, E.SAL*12 AS ANNUAL_SAL, D.DEPTNO, D.DNAME, S.GRADE
    -> FROM EMPLOYEE E
    -> JOIN DEPARTMENT D
    -> ON E.DEPTNO = D.DEPTNO
    -> JOIN SALGRADE S ON
    -> E.SAL BETWEEN S.LOSAL AND S.HISAL
    -> WHERE E.SAL*12 = 36000 OR JOB <> 'CLERK';
+-------+----------+------------+--------+----------+-------+
| ENAME | JOB      | ANNUAL_SAL | DEPTNO | DNAME    | GRADE |
+-------+----------+------------+--------+----------+-------+
| ALLEN | SALESMAN |   19200.00 |     30 | SALES    | C     |
| ALLEN | SALESMAN |   19200.00 |     30 | SALES    | C     |
| WARD  | SALESMAN |   15000.00 |     30 | SALES    | B     |
| WARD  | SALESMAN |   15000.00 |     30 | SALES    | B     |
| JONES | MANAGER  |   35700.00 |     20 | RESEARCH | D     |
| JONES | MANAGER  |   35700.00 |     20 | RESEARCH | D     |
+-------+----------+------------+--------+----------+-------+
6 rows in set (0.106 sec)

MariaDB [kriti]> SELECT E.ENAME , E.JOB, E.SAL*12, D.DNAME, D.DEPTNO, S.GRADE
    -> FROM EMPLOYEE E
    -> JOIN DEPARTMENT D ON
    -> E.DEPTNO = D.DEPTNO
    -> JOIN SALGRADE S ON
    -> E.SAL BETWEEN S.LOSAL AND S.HISAL
    -> WHERE E.SAL*12>= 30000 AND JOB<> 'CLERK';
+-------+---------+----------+----------+--------+-------+
| ENAME | JOB     | E.SAL*12 | DNAME    | DEPTNO | GRADE |
+-------+---------+----------+----------+--------+-------+
| JONES | MANAGER | 35700.00 | RESEARCH |     20 | D     |
| JONES | MANAGER | 35700.00 | RESEARCH |     20 | D     |
+-------+---------+----------+----------+--------+-------+
2 rows in set (0.093 sec)

MariaDB [kriti]> SELECT
    -> E.EMPNO,
    -> E.ENAME,
    -> IFNULL(CAST(M.EMPNO AS CHAR), 'NO MANAGER') AS MGR_NAME
    -> FROM EMPLOYEE E
    -> LEFT JOIN EMPOLYEE M
    -> ON E.MGR = M.EMPNO;
ERROR 1146 (42S02): Table 'kriti.empolyee' doesn't exist
MariaDB [kriti]> SELECT
    -> E.EMPNO,
    -> E.ENAME,
    -> IFNULL(CAST(M.EMPNO AS CHAR), 'NO MANAGER') AS MGR_NO,
    -> IFNULL(M.ENAME, 'NO MANAGER') AS MGR_NAME
    -> FROM EMPLOYEE E
    -> LEFT JOIN EMPOLYEE M
    -> ON E.MGR = M.EMPNO;
ERROR 1146 (42S02): Table 'kriti.empolyee' doesn't exist
MariaDB [kriti]> SELECT
    -> E.EMPNO,
    -> E.ENAME,
    -> IFNULL(CAST(M.EMPNO AS CHAR), 'NO MANAGER') AS MGR_NO,
    -> IFNULL(M.ENAME, 'NO MANAGER') AS MGR_NAME
    -> FROM EMPLOYEE E
    -> LEFT JOIN EMPLOYEE M
    -> ON E.MGR = M.EMPNO;
+-------+-------+------------+------------+
| EMPNO | ENAME | MGR_NO     | MGR_NAME   |
+-------+-------+------------+------------+
|  7369 | SMITH | NO MANAGER | NO MANAGER |
|  7499 | ALLEN | NO MANAGER | NO MANAGER |
|  7521 | WARD  | NO MANAGER | NO MANAGER |
|  7566 | JONES | NO MANAGER | NO MANAGER |
+-------+-------+------------+------------+
4 rows in set (0.009 sec)

MariaDB [kriti]> SELECT EMPNO, ENAME, MGR
    -> FROM EMPLOYEE;
+-------+-------+------+
| EMPNO | ENAME | MGR  |
+-------+-------+------+
|  7369 | SMITH | 7902 |
|  7499 | ALLEN | 7698 |
|  7521 | WARD  | 7698 |
|  7566 | JONES | 7839 |
+-------+-------+------+
4 rows in set (0.064 sec)

MariaDB [kriti]> INSERT INTO EMPLOYEE (EMPNO, ENAME, JOB, MGR, SAL)
    -> VALUES
    -> (7839,'KING','PRESIDENT',NULL,5000),
    -> (7698,'BLAKE','MANAGER',7839,2850),
    -> (7902,'FORD','ANALYST',7566,3000);
Query OK, 3 rows affected (0.024 sec)
Records: 3  Duplicates: 0  Warnings: 0

MariaDB [kriti]> UPDATE EMPLOYEE SET MGR = 7902 WHERE EMPNO = 7369;
Query OK, 0 rows affected (0.007 sec)
Rows matched: 1  Changed: 0  Warnings: 0

MariaDB [kriti]> UPDATE EMPLOYEE SET MGR = 7698 WHERE EMPNO = 7499;
Query OK, 0 rows affected (0.002 sec)
Rows matched: 1  Changed: 0  Warnings: 0

MariaDB [kriti]> UPDATE EMPLOYEE SET MGR = 7698 WHERE EMPNO = 7521;
Query OK, 0 rows affected (0.001 sec)
Rows matched: 1  Changed: 0  Warnings: 0

MariaDB [kriti]> UPDATE EMPLOYEE SET MGR = 7839 WHERE EMPNO = 7566;
Query OK, 0 rows affected (0.001 sec)
Rows matched: 1  Changed: 0  Warnings: 0

MariaDB [kriti]> SELECT
    -> E.EMPNO,
    -> E.ENAME,
    -> IFNULL(CAST(M.EMPNO AS CHAR), 'NO MANAGER') AS MGR_NO,
    -> IFNULL(M.ENAME, 'NO MANAGER') AS MGR_NAME
    -> FROM EMPLOYEE E
    -> LEFT JOIN EMPLOYEE M
    -> ON E.MGR = M.EMPNO;
+-------+-------+------------+------------+
| EMPNO | ENAME | MGR_NO     | MGR_NAME   |
+-------+-------+------------+------------+
|  7369 | SMITH | 7902       | FORD       |
|  7499 | ALLEN | 7698       | BLAKE      |
|  7521 | WARD  | 7698       | BLAKE      |
|  7566 | JONES | 7839       | KING       |
|  7698 | BLAKE | 7839       | KING       |
|  7839 | KING  | NO MANAGER | NO MANAGER |
|  7902 | FORD  | 7566       | JONES      |
+-------+-------+------------+------------+
7 rows in set (0.013 sec)

MariaDB [kriti]> SELECT d.DEPTNO, d.DNAME,
    -> SUM(e.SAL) AS TOTAL_SAL
    -> FROM EMPLOYEE e
    -> JOIN DEPARTMENT d ON e.DEPTNO = d.DEPTNO
    -> GROUP BY d.DEPTNO;
+--------+----------+-----------+
| DEPTNO | DNAME    | TOTAL_SAL |
+--------+----------+-----------+
|     20 | RESEARCH |   3775.00 |
|     30 | SALES    |   2850.00 |
+--------+----------+-----------+
2 rows in set (0.093 sec)

MariaDB [kriti]> SELECT e.EMPNO, e.ENAME, d.LOCATION
    -> FROM EMPLOYEE e
    -> JOIN DEPARTMENT d ON e.DEPTNO = d.DEPTNO;
+-------+-------+-----------+
| EMPNO | ENAME | LOCATION  |
+-------+-------+-----------+
|  7369 | SMITH | Chennai   |
|  7499 | ALLEN | Hyderabad |
|  7521 | WARD  | Hyderabad |
|  7566 | JONES | Chennai   |
+-------+-------+-----------+
4 rows in set (0.002 sec)

MariaDB [kriti]> SELECT E.ENAME, D.DNAME
    -> FROM EMPLOYEE E
    -> JOIN DEPARTMENT D ON
    -> E.DEPTNO = D.DEPTNO;
+-------+----------+
| ENAME | DNAME    |
+-------+----------+
| SMITH | RESEARCH |
| ALLEN | SALES    |
| WARD  | SALES    |
| JONES | RESEARCH |
+-------+----------+
4 rows in set (0.074 sec)

MariaDB [kriti]> SELECT
    -> e.ENAME,
    -> e.JOB,
    -> IFNULL(m.ENAME, 'No Manager') AS MANAGER
    -> FROM EMPLOYEE e
    -> LEFT JOIN EMPLOYEE m
    -> ON e.MGR = m.EMPNO;
+-------+-----------+------------+
| ENAME | JOB       | MANAGER    |
+-------+-----------+------------+
| SMITH | CLERK     | FORD       |
| ALLEN | SALESMAN  | BLAKE      |
| WARD  | SALESMAN  | BLAKE      |
| JONES | MANAGER   | KING       |
| BLAKE | MANAGER   | KING       |
| KING  | PRESIDENT | No Manager |
| FORD  | ANALYST   | JONES      |
+-------+-----------+------------+
7 rows in set (0.024 sec)