 CREATE TABLE STUDENTS (
    s_id NUMBER(10) CONSTRAINT s_pk PRIMARY KEY,
    s_pwd VARCHAR(20),
    s_major VARCHAR(20),
    s_addr VARCHAR(30),
    s_email VARCHAR(50)
 );
 
 CREATE TABLE PROFESSOR (
    p_id NUMBER(10) CONSTRAINT p_pk PRIMARY KEY,
    p_pwd VARCHAR(20),
    p_major VARCHAR(20),
    p_email VARCHAR(50)
 );
 
 CREATE TABLE COURSE (
    c_id VARCHAR(4),
    c_id_no NUMBER(2),
    c_unit NUMBER(1),
    c_name VARCHAR(30),
    CONSTRAINT c_pk PRIMARY KEY(c_id, c_id_no) 
 );
 
CREATE TABLE teach (
    c_id VARCHAR(4),
    c_id_no NUMBER(2) ,
    p_id NUMBER(10),
    t_year NUMBER(4),
    t_semester VARCHAR(1),
    t_time NUMBER(2),--��/��, ȭ,��, �� ����
    t_day NUMBER(1), --1 : ��/��, 2: ȭ/��, 3: ��
    t_max NUMBER(3),
    t_where VARCHAR(20),
    CONSTRAINT t_c_id_fk FOREIGN KEY (c_id,c_id_no) REFERENCES COURSE(c_id,c_id_no),
    CONSTRAINT t_p_id_fk FOREIGN KEY (p_id) REFERENCES PROFESSOR(p_id),
    CONSTRAINT t_pk PRIMARY KEY(p_id, t_time, t_year, t_semester)
 );
 
 CREATE TABLE ENROLL (
    s_id NUMBER(10) ,
    c_id VARCHAR(4),
    c_id_no NUMBER(2),
    e_year NUMBER(4),
    e_semester NUMBER(1),
    CONSTRAINT e_s_id_pk FOREIGN KEY (s_id) REFERENCES STUDENTS(s_id),
    CONSTRAINT e_c_id_pk FOREIGN KEY (c_id,c_id_no) REFERENCES COURSE(c_id,c_id_no),
    CONSTRAINT e_pk PRIMARY KEY(e_year, e_semester, s_id, c_id)
 );