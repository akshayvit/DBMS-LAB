1 row created.

SQL> insert into sailors values(20,'barun',1010,33);

1 row created.

SQL> insert into sailors values(30,'karun',1011,43);

1 row created.

SQL> insert into boats values(1,'dhum','red');

1 row created.

SQL> insert into boats values(2,'bhum','yellow');

1 row created.

SQL> insert into boats values(3,'ghum','green');

1 row created.

SQL> insert into reserves values(1,20,'monday');
insert into reserves values(1,20,'monday')
*
ERROR at line 1:
ORA-02291: integrity constraint (CSEROLL21.SYS_C0012707) violated - parent key
not found


SQL> insert into reserves values(1,10,'monday');
insert into reserves values(1,10,'monday')
*
ERROR at line 1:
ORA-02291: integrity constraint (CSEROLL21.SYS_C0012707) violated - parent key
not found


SQL> insert into reserves values(10,1,'monday');

1 row created.

SQL> insert into reserves values(30,2,'monday');

1 row created.

SQL> insert into reserves values(20,3,'sunday');

1 row created.

SQL> select color from boats where b_id=reserves.b_id and reserves.s_id=(select s_id from sailors where sname='tarun');
select color from boats where b_id=reserves.b_id and reserves.s_id=(select s_id from sailors where sname='tarun')
                                                     *
ERROR at line 1:
ORA-00904: "RESERVES"."S_ID": invalid identifier


SQL> select color from boats,reserves where b_id=reserves.b_id and reserves.s_id=(select s_id from sailors where sname='tarun');
select color from boats,reserves where b_id=reserves.b_id and reserves.s_id=(select s_id from sailors where sname='tarun')
                                       *
ERROR at line 1:
ORA-00918: column ambiguously defined


SQL> select color from boats,reserves where boats.b_id=reserves.b_id and reserves.s_id=(select s_id from sailors where sname='tarun');

COLOR
----------
red

SQL> select s_id,sname from sailors,reserves where sailors.s_id=reserves.s_id and reserves.da7y='monday';
select s_id,sname from sailors,reserves where sailors.s_id=reserves.s_id and reserves.da7y='monday'
                                                                             *
ERROR at line 1:
ORA-00904: "RESERVES"."DA7Y": invalid identifier


SQL> select s_id,sname from sailors,reserves where sailors.s_id=reserves.s_id and reserves.day='monday';
select s_id,sname from sailors,reserves where sailors.s_id=reserves.s_id and reserves.day='monday'
       *
ERROR at line 1:
ORA-00918: column ambiguously defined


SQL> select sailors.s_id,sailors.sname from sailors,reserves where sailors.s_id=reserves.s_id and reserves.day='monday';

      S_ID SNAME
---------- --------------------
        10 tarun
        30 karun

SQL> select b_id,name from boats where colors in ('red','green');
select b_id,name from boats where colors in ('red','green')
                                  *
ERROR at line 1:
ORA-00904: "COLORS": invalid identifier


SQL> select b_id,name from boats where color in ('red','green');

      B_ID NAME
---------- --------------------
         1 dhum
         3 ghum

SQL> select * from sailors;

      S_ID SNAME                    RATING        AGE
---------- -------------------- ---------- ----------
        10 tarun                      1009         23
        20 barun                      1010         33
        30 karun                      1011         43

SQL> delete from sailors where age>=40;
delete from sailors where age>=40
*
ERROR at line 1:
ORA-02292: integrity constraint (CSEROLL21.SYS_C0012706) violated - child
record found


SQL> delete from sailors where age>40;
delete from sailors where age>40
*
ERROR at line 1:
ORA-02292: integrity constraint (CSEROLL21.SYS_C0012706) violated - child
record found


SQL> delete from sailors where age>60;

0 rows deleted.

SQL> delete from sailors where age>30;
delete from sailors where age>30
*
ERROR at line 1:
ORA-02292: integrity constraint (CSEROLL21.SYS_C0012706) violated - child
record found


SQL> delete from sailors where age>30;
delete from sailors where age>30
*
ERROR at line 1:
ORA-02292: integrity constraint (CSEROLL21.SYS_C0012706) violated - child
record found


SQL> drop sailors where age>30;
drop sailors where age>30
     *
ERROR at line 1:
ORA-00950: invalid DROP option


SQL> delete from sailors where age>30;
delete from sailors where age>30
*
ERROR at line 1:
ORA-02292: integrity constraint (CSEROLL21.SYS_C0012706) violated - child
record found


SQL> delete from reserves,sailors where reserves.s_id=(select s_id from sailors where age>=40);
delete from reserves,sailors where reserves.s_id=(select s_id from sailors where age>=40)
                    *
ERROR at line 1:
ORA-00933: SQL command not properly ended


SQL> delete from reserves where reserves.s_id=(select s_id from sailors where age>=40);

1 row deleted.

SQL> delete from sailors where age>=40;

1 row deleted.

SQL> select * from sailors;

      S_ID SNAME                    RATING        AGE
---------- -------------------- ---------- ----------
        10 tarun                      1009         23
        20 barun                      1010         33

SQL> create table teacher(tid number(10),name varchar(20),dept varchar(10));

Table created.

SQL> create table subject(subno number(10),subtitle varchar(20));

Table created.

SQL> create table taughtby(tid number(5) primary key,subno number(10) primary key);
create table taughtby(tid number(5) primary key,subno number(10) primary key)
                                                                 *
ERROR at line 1:
ORA-02260: table can have only one primary key


SQL> create table taughtby(tid number(5) primary key,subno number(10) foreign key references subject(subno));
create table taughtby(tid number(5) primary key,subno number(10) foreign key references subject(subno))
                                                                 *
ERROR at line 1:
ORA-00907: missing right parenthesis


SQL> create table taughtby(tid number(5) primary key,subno number(10), foreign key(subno) references subject(subno));
create table taughtby(tid number(5) primary key,subno number(10), foreign key(subno) references subject(subno))
                                                                                                        *
ERROR at line 1:
ORA-02270: no matching unique or primary key for this column-list


SQL> create table taughtby(tid number(5) primary key,subno number(10));

Table created.

SQL> create table rollno(rollno number(5) primary key,sname varchar(50),city varchar(20));

Table created.

SQL> insert into teacher values(56,'kju','cse');

1 row created.

SQL> insert into teacher values(45,'kjuert','Physics');

1 row created.

SQL> insert into subject values(78,'DBMS');

1 row created.

SQL> insert into subject values(98,'TTFS');

1 row created.

SQL> insert into taughtby values(107,78);

1 row created.

SQL> insert into taughtby values(109,98);

1 row created.

SQL> insert into student values(12,'aks','kolkata');
insert into student values(12,'aks','kolkata')
            *
ERROR at line 1:
ORA-00942: table or view does not exist


SQL> insert into rollno values(12,'aks','kolkata');

1 row created.

SQL> insert into rollno values(14,'bjs','howrah');

1 row created.

SQL> select teacher.name from teacher,subject,taughtby where teacher.dept='physics' and subject.subno=taughtby.subno and subject.subtitle='TTFS';


no rows selected

SQL> select teacher.name from teacher,subject,taughtby where teacher.dept='physics' and subject.subno=taughtby.subno and subject.subtitle='TTFS';


no rows selected

SQL> update subject set subtitle='RDBMS' where subtitle='DBMS';

1 row updated.

SQL> select sname from rollno where city='kolkata' and rollno between(10,13);
select sname from rollno where city='kolkata' and rollno between(10,13)
                                                                   *
ERROR at line 1:
ORA-00907: missing right parenthesis


SQL> select sname from rollno where city='kolkata' and rollno between 10 and 13;

SNAME
--------------------------------------------------
aks

SQL> select * from rollno where city='kolkata' order by rollno desc;

    ROLLNO SNAME
---------- --------------------------------------------------
CITY
--------------------
        12 aks
kolkata


SQL>