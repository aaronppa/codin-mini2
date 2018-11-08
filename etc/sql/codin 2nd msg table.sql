-- MSG (Message) Create Table
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

