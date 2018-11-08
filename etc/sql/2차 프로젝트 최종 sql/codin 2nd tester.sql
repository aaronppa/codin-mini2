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

select * from member;