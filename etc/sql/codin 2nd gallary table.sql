create table gallary(
	gall_no int primary key,
    gall_writer varchar(20),
    gall_title varchar(30),
    gall_content varchar(600),
    gall_reg_date datetime,
    gall_view_cnt int
);
create table gall_file(
	file_no int not null,
    file_ori_name varchar(50),
    file_server_name varchar(50),
    file_path varchar(100),
    file_size int,
    gall_no int
    
);
create table gall_comment(
	gall_no int,
    gall_com_no int not null,
    gall_com_writer varchar(20),
    gall_com_content varchar(300),
    gall_com_reg_date datetime
); 
create table gall_like(
    gall_like_no int not null,
    gall_no int,
    like_id varchar(50)
);

select * from gallary;
select * from gall_file;
select * from gall_comment;
select * from gall_like;