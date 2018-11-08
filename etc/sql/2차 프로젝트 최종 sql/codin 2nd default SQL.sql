-- Bitcamp 응용SW 엔지니어링 과정 Codin 2차 프로젝트 각 테이블 별 최종 사항 SQL

-- ------------------------------------------------------------------------------
-- 담당자 : 유병욱
-- 담당 기능 : ticket
CREATE TABLE ticket (
	ticket_no INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	ticket_title VARCHAR(100) NOT NULL,
	ticket_sender INT NOT NULL,
	ticket_difficulty CHAR(1) NOT NULL,
	ticket_start datetime NOT NULL, 
	ticket_end datetime NOT NULL, 
	ticket_text VARCHAR(10000),
	ticket_progress INT default 0 NOT NULL,
	ticket_date datetime default now() NOT NULL
);

CREATE TABLE ticket_group (
	group_no INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	ticket_no INT NOT NULL, 
	group_member INT  NOT NULL
);

CREATE TABLE ticket_skill (
	skill_no INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	ticket_no INT NOT NULL, 
	skill_code INT NOT NULL
);

CREATE TABLE skill (
	skill_code INT NOT NULL PRIMARY KEY,
	skill_name varchar(50) NOT NULL
);
-- ------------------------------------------------------------------------------
-- 담당자 : 최원영
-- 담당 기능 : message
CREATE TABLE message (
	msg_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
	type_id char(2) NOT NULL,
	from_user_no INT NOT NULL, 
	subject VARCHAR(50), 
	message_body VARCHAR(1000),
	date_sent datetime default now(),
	thread INT, 
	trash_writer int default 0
);

CREATE TABLE msg_type (
	type_id char(2) NOT NULL PRIMARY KEY, 
	type VARCHAR(100) NOT NULL 
);

CREATE TABLE recipients (
	msg_id INT NOT NULL, 
	to_user_no INT NOT NULL, 
	date_read datetime,
	trash_recipient int default 0
);

CREATE TABLE thread (
	thread_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	msg_id INT
);
-- ------------------------------------------------------------------------------
-- 담당자 : 이경
-- 담당 기능 : member
CREATE TABLE member (
	member_no INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
	member_id VARCHAR(50) NOT NULL unique, 
	member_password VARCHAR(50) NOT NULL, 
	member_email VARCHAR(50) NOT NULL, 
	member_name VARCHAR(50) NOT NULL, 
	member_grade char(1) default '1' NOT NULL,
	member_reg_date datetime default now() NOT NULL,
	member_age INT, 
	member_gender char(1)
);

CREATE TABLE member_career (
	career_no INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
	member_no INT NOT NULL, 
	career_company VARCHAR(50), 
	career_position varchar(20), 
	career_department varchar(30),
	career_start DATE,
	career_end Date,
	career_job varchar(50)
);

CREATE TABLE member_skill (
	member_skill_no INT, 
	member_no INT references member(member_no), 
	skill_code INT
);
-- ------------------------------------------------------------------------------
-- 담당자 : 최창유
-- 담당 기능 : board
CREATE TABLE board (
	board_no INT NOT NULL AUTO_INCREMENT PRIMARY KEY,  
	board_title VARCHAR(50) NOT NULL,
	board_content varchar(4000) NOT NULL,
	board_id varchar(50) NOT NULL, 
	board_date datetime default now() NOT NULL, 
    board_view_cnt int default 0,
	category_no INT
);

CREATE TABLE board_comment (
	comment_no INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
	comment_id VARCHAR(50) NOT NULL, 
	comment_content VARCHAR(500) NOT NULL, 
	comment_date datetime default now() NOT NULL,
	board_no INT NOT NULL 
);

CREATE TABLE board_category (
	category_no INT NOT NULL PRIMARY KEY, 
	category_name VARCHAR(50) NOT NULL
);
-- ------------------------------------------------------------------------------
-- 담당자 : 조용제
-- 담당 기능 : gallary
create table gallary(
	gall_no int primary key auto_increment,
    gall_writer varchar(20) not null,
    gall_title varchar(30) not null,
    gall_content varchar(600) not null,
    gall_reg_date datetime default now(),
    gall_view_cnt int default 0
);
create table gall_file(
	file_no int primary key auto_increment,
    file_ori_name varchar(50) not null,
    file_server_name varchar(50) not null,
    file_path varchar(100) not null,
    file_size int not null,
    gall_no int not null
    
);
create table gall_comment(
	gall_no int not null,
    gall_com_no int primary key auto_increment,
    gall_com_writer varchar(20) not null,
    gall_com_content varchar(300) not null,
    gall_com_reg_date datetime default now()
); 
create table gall_like(
    gall_like_no int primary key auto_increment,
    gall_no int not null,
    like_id varchar(50) not null
);
-- ------------------------------------------------------------------------------

-- 테스트 용 코드
-- ------------------------------------------------------------------------------
	-- 테스트용 계정
-- ------------------------------------------------------------------------------
insert into member (member_id, member_password, member_email, member_name, member_grade, member_reg_date, member_age, member_gender)
values
('admin', 'codin1226', 'codin@codin.co.kr', '관리자', 'a', sysdate(), 0, 1);

insert into member (member_id, member_password, member_email, member_name, member_grade, member_reg_date, member_age, member_gender)
values
('test1', 'tester1', 'test1@codin.co.kr', '테스터1', '1', sysdate(), 27, 1);

insert into member (member_id, member_password, member_email, member_name, member_grade, member_reg_date, member_age, member_gender)
values
('test2', 'tester2', 'test2@codin.co.kr', '테스터2', '1', sysdate(), 28, 2);

insert into member (member_id, member_password, member_email, member_name, member_grade, member_reg_date, member_age, member_gender)
values
('test3', 'tester3', 'test3@codin.co.kr', '테스터3', '2', sysdate(), 30, 1);
-- ------------------------------------------------------------------------------
	-- 테스트용 skill
-- ------------------------------------------------------------------------------
insert into skill (skill_code, skill_name) values (1, 'Java');

insert into skill (skill_code, skill_name) values (2, 'HTML');

insert into skill (skill_code, skill_name) values (3, 'JSP');

insert into skill (skill_code, skill_name) values (4, 'Oracle');

insert into skill (skill_code, skill_name) values (5, 'MySQL');

insert into skill (skill_code, skill_name) values (6, 'JQuery');

insert into skill (skill_code, skill_name) values (7, 'NodeJS');
