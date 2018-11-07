insert into message(type_id, from_user_no, subject, message_body) values
(1, 1, "memo-test", null),
(2, 1, "mailtest1", "mail - bodytest1"),
(3, 1, "accouncementtest2", "accouncement - bodytest2"),
(4, 1, "drafttest2", "draft - bodytest2"),
(5, 1, "writertrashtest2", "writertrash - bodytest2"),
(6, 1, "recipienttrashtest2", "recipienttrash - bodytest2");

insert into recipients(msg_id, to_user_no) values
(1, 2), (1, 3), (1, 4), (2, 2), (2, 3), (2, 4), (3, 2), (3, 3), (3, 4), (4, 3), (4, 2), (4, 4), (5, 2), (5, 3), (5, 4), (6, 4), (6,  2), (6, 3);


select *
		  from recipients
		inner join (select member_no, member_id as to_user_id, member_name as to_user_name
		              from member
		   ) as mem on mem.member_no = to_user_no
		 where msg_id = 2;
         
	select *
		  from message
		order by msg_id desc;

select *
		  from message
		where from_user_no = 2
		  and trash_writer = 1;

select *
		  from message as m
		inner join recipients as r on r.msg_id = m.msg_id
		where to_user_no =2
		  and trash_recipient = 1;

select *
		  from message as m
		inner join recipients as r on r.msg_id = m.msg_id
		where from_user_no = 2
		  and trash_writer = 1
		union all
		select *
		  from message as m
		inner join recipients as r on r.msg_id = m.msg_id
		where to_user_no =2
		  and trash_recipient = 1;
          
select *
		  from message as m
		inner join recipients as r on r.msg_id = m.msg_id
        inner join (select member_id as from_user_id, member_name as from_user_name, member_no as from_member_no
		               from member
		                    ) as mem on mem.from_member_no = m.from_user_no
		where from_user_no = 2
		  and trash_writer = 1
		union all
		select *
		  from message as m
		inner join recipients as r on r.msg_id = m.msg_id
        inner join (select member_id as from_user_id, member_name as from_user_name, member_no as from_member_no
		               from member
		                    ) as mem on mem.from_member_no = m.from_user_no
		where to_user_no = 2
		  and trash_recipient = 1;
          
update recipients
		   set trash_recipient = 1
		 where msg_id = 1
		   and to_user_no = 4;


(select *
		  from message as m
		inner join recipients as r on r.msg_id = m.msg_id
		inner join (select member_id as from_user_id, member_name as from_user_name, member_no as from_member_no
		               from member
		                    ) as mem on mem.from_member_no = m.from_user_no
		where from_user_no = 1
		  and trash_writer = 1
          limit 1)
		union all
		select *
		  from message as m
		inner join recipients as r on r.msg_id = m.msg_id
		inner join (select member_id as from_user_id, member_name as from_user_name, member_no as from_member_no
		               from member
		                    ) as mem on mem.from_member_no = m.from_user_no
		where to_user_no = 1
		  and trash_recipient = 1;
          
select *
		  from message as m
		inner join recipients as r on r.msg_id = m.msg_id
		inner join (select member_id as from_user_id, member_name as from_user_name, member_no as from_member_no
		               from member
		                    ) as mem on mem.from_member_no = m.from_user_no
		where from_user_no = 1
		  and trash_writer = 1
          limit 1;