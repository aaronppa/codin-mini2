CREATE TABLE ticket (
	ticket_no INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	ticket_title VARCHAR(100) NOT NULL,
	ticket_sender INT NOT NULL,
	ticket_difficulty CHAR(1) NOT NULL,
	ticket_start datetime NOT NULL, 
	ticket_end datetime NOT NULL, 
	ticket_text VARCHAR(255),
	ticket_progress INT NOT NULL 
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

CREATE TABLE member (
	member_no INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
	member_id VARCHAR(50) NOT NULL, 
	member_password VARCHAR(50) NOT NULL, 
	member_email VARCHAR(50) NOT NULL, 
	member_name VARCHAR(50) NOT NULL, 
	member_grade char(1) NOT NULL,
	member_reg_date datetime NOT NULL,
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
	member_skill_no INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
	member_no INT, 
	skill_code INT
);

CREATE TABLE member_prog_lang (
	language_no INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
	member_no INT,
	language_grade INT,
	language_code INT 
);

CREATE TABLE language_code (
	language_code INT NOT NULL PRIMARY KEY,
	skill_name varchar(30)
);

CREATE TABLE message (
	msg_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
	type_id char(2) NOT NULL,
	from_user_no INT NOT NULL, 
	subject VARCHAR(50), 
	message_body VARCHAR(1000),
	date_sent datetime,
	thread INT
);

CREATE TABLE msg_type (
	type_id char(2) NOT NULL PRIMARY KEY, 
	type VARCHAR(100) NOT NULL 
);

CREATE TABLE RECIPIENTS (
	msg_id INT NOT NULL, 
	to_user_no INT NOT NULL, 
	date_read datetime 
);

CREATE TABLE thread (
	thread_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	msg_id INT
);

CREATE TABLE gallary (
	gall_no INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
	gall_writer VARCHAR(20), 
	gall_title VARCHAR(30),
	gall_content VARCHAR(600),
	gall_reg_date datetime, 
	gall_view_cnt INT
);

CREATE TABLE gall_file (
	file_no INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
	file_ori_name varchar(50), 
	file_server_name varchar(50),
	file_path VARCHAR(100), 
	file_size INT, 
	gall_no INT 
);

CREATE TABLE gall_comment (
	gall_com_no INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	gall_com_content VARCHAR(50),
	gall_no INT,
	gall_com_writer varchar(20),
	gall_com_reg_date datetime
);

CREATE TABLE gall_like (
	gall_like_no INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
	gall_no INT, 
	like_id VARCHAR(50)
);

CREATE TABLE board (
	board_no INT NOT NULL AUTO_INCREMENT PRIMARY KEY,  
	board_title VARCHAR(50) NOT NULL,
	board_content varchar(4000) NOT NULL,
	board_id varchar(50) NOT NULL, 
	board_date datetime NOT NULL, 
	category_no INT 
);

CREATE TABLE board_comment (
	comment_no INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
	comment_id VARCHAR(50) NOT NULL, 
	comment_content VARCHAR(500) NOT NULL, 
	comment_date datetime NOT NULL,
	board_no INT NOT NULL 
);

CREATE TABLE board_category (
	category_no INT NOT NULL PRIMARY KEY, 
	category_name VARCHAR(50) NOT NULL
);

