/*
-- Query: SELECT * FROM codinminipractice.message
LIMIT 0, 1000

-- Date: 2018-11-09 10:36
*/
INSERT INTO `message` (`msg_id`,`type_id`,`from_user_no`,`subject`,`message_body`,`date_sent`,`thread`,`trash_writer`) VALUES (1,'1',1,'memo-test',NULL,'2018-11-05 15:11:03',NULL,0);
INSERT INTO `message` (`msg_id`,`type_id`,`from_user_no`,`subject`,`message_body`,`date_sent`,`thread`,`trash_writer`) VALUES (2,'2',1,' mailtest1','mail - bodytest1','2018-11-05 15:11:03',NULL,0);
INSERT INTO `message` (`msg_id`,`type_id`,`from_user_no`,`subject`,`message_body`,`date_sent`,`thread`,`trash_writer`) VALUES (3,'3',1,'accouncementtest2','accouncement - bodytest2','2018-11-05 15:11:03',NULL,0);
INSERT INTO `message` (`msg_id`,`type_id`,`from_user_no`,`subject`,`message_body`,`date_sent`,`thread`,`trash_writer`) VALUES (4,'4',1,'drafttest2','draft - bodytest2','2018-11-05 15:11:03',NULL,0);
INSERT INTO `message` (`msg_id`,`type_id`,`from_user_no`,`subject`,`message_body`,`date_sent`,`thread`,`trash_writer`) VALUES (5,'2',2,'writertrashtest2','writertrash - bodytest2','2018-11-05 15:11:03',NULL,0);
INSERT INTO `message` (`msg_id`,`type_id`,`from_user_no`,`subject`,`message_body`,`date_sent`,`thread`,`trash_writer`) VALUES (6,'2',3,'recipienttrashtest2','recipienttrash - bodytest2','2018-11-05 15:11:03',NULL,0);
INSERT INTO `message` (`msg_id`,`type_id`,`from_user_no`,`subject`,`message_body`,`date_sent`,`thread`,`trash_writer`) VALUES (7,'2',2,'테스트1 - 관리자','테스트\r\n테스트\r\n테스트\r\n','2018-11-06 09:45:58',NULL,0);
INSERT INTO `message` (`msg_id`,`type_id`,`from_user_no`,`subject`,`message_body`,`date_sent`,`thread`,`trash_writer`) VALUES (8,'2',2,'trash mail','<p><b>trash mail testing</b></p>','2018-11-07 20:55:41',NULL,1);
INSERT INTO `message` (`msg_id`,`type_id`,`from_user_no`,`subject`,`message_body`,`date_sent`,`thread`,`trash_writer`) VALUES (9,'2',2,'recipient trash testing','<p>recipient trash testing</p>','2018-11-07 20:56:29',1,0);
INSERT INTO `message` (`msg_id`,`type_id`,`from_user_no`,`subject`,`message_body`,`date_sent`,`thread`,`trash_writer`) VALUES (14,'2',1,'Re: recipient trash testing','<p><br>회신됩니다 이제...</p><p>근데 아직 페이징이랑.. 페이지 이동... 쪽지 회신... 임시저장</p><p>검색, 도착 알림을 못했네요....<br><br><br>\r\n					\r\n													\r\n											  --------이전 메세지--------\r\n<p>recipient trash testing</p></p>','2018-11-09 03:25:06',1,0);
INSERT INTO `message` (`msg_id`,`type_id`,`from_user_no`,`subject`,`message_body`,`date_sent`,`thread`,`trash_writer`) VALUES (15,'2',1,'Re: Re: recipient trash testing','으으음ㄴㅇ름ㄹ<br><br><br><br>\r\n					\r\n													\r\n											  --------이전 메세지--------\r\n<p><br>회신됩니다 이제...</p><p>근데 아직 페이징이랑.. 페이지 이동... 쪽지 회신... 임시저장</p><p>검색, 도착 알림을 못했네요....<br><br><br>\r\n					\r\n													\r\n											  --------이전 메세지--------\r\n</p><p>recipient trash testing</p><p></p>','2018-11-09 03:25:39',1,0);
