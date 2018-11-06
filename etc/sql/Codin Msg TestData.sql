insert into message(type_id, from_user_no, subject, message_body) values
(1, 1, "memo-test", null),
(2, 1, "mailtest1", "mail - bodytest1"),
(3, 1, "accouncementtest2", "accouncement - bodytest2"),
(4, 1, "drafttest2", "draft - bodytest2"),
(5, 1, "writertrashtest2", "writertrash - bodytest2"),
(6, 1, "recipienttrashtest2", "recipienttrash - bodytest2");

insert into recipients(msg_id, to_user_no) values
(1, 2), (1, 3), (1, 4), (2, 2), (2, 3), (2, 4), (3, 2), (3, 3), (3, 4), (4, 3), (4, 2), (4, 4), (5, 2), (5, 3), (5, 4), (6, 4), (6,  2), (6, 3);


