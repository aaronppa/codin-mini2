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
) charset=utf8;

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