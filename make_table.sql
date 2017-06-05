/*
primary key랑 외래 키는 아직 추가 안했음!
*/
CREATE TABLE STUDENTS (
	s_id NUMBER(10),
	s_pwd VARCHAR(20)
);

CREATE TABLE PROFESSOR (
	p_id NUMBER(10),
	p_pwd VARCHAR(20)
);

CREATE TABLE COURSE (
	c_id VARCHAR(4),
	c_id_no NUMBER(2),
	c_unit NUMBER(1),
	c_name VARCHAR(30)
);

CREATE TABLE teach (
	c_id VARCHAR(4),
	c_id_no NUMBER(2),
	p_id NUMBER(10),
	t_year NUMBER(4),
	t_time NUMBER(2),
	t_where VARCHAR(10),
	t_semester VARCHAR(1)
);

CREATE TABLE ENROLL (
	s_id NUMBER(10),
	c_id VARCHAR(4),
	c_id_no NUMBER(2),
	e_year NUMBER(4),
	e_semester NUMBER(1)
);