
-- 회원 예제 데이터
INSERT INTO nm_member(
member_name, 
id_photo, 
birthday,     
email,       
password,      
intro,      
interest,     
nickname,
auth_status
) 
values(
'오승우',
'abc.jpg',
'1998-10-20',
'fivewincow@gmail.com',
password('dhtmddn1!'),
'열심히',
'코딩',
'오승우',
'y');

INSERT INTO nm_member(
member_name, 
id_photo, 
birthday,     
email,       
password,      
intro,      
interest,     
nickname
) 
values(
'손진영',
'abc.jpg',
'1998-10-20',
'jyson19@gmail.com',
'1111',
'열심히',
'코딩',
'손진영'
);

INSERT INTO nm_member(
member_name, 
id_photo, 
birthday,     
email,       
password,      
intro,      
interest,     
nickname 
) 
values(
'신나라',
'abc.jpg',
'1998-10-20',
'narashin547@gmail.com',
'1111',
'열심히',
'코딩',
'신나라'
);
 
INSERT INTO nm_member(
member_name, 
id_photo, 
birthday,     
email,       
password,      
intro,      
interest,     
nickname
) 
values(
'김나영', 
'photo1.jpg', 
'2000-2-2',
'invin1201@gmail.com', 
'2222', 
'김나영입니다.', 
'댄스/무용', 
'나사김'
);

-- 모임 예제
INSERT INTO nm_group(
group_name,
group_info,
group_form,
group_interest,
city,
max_people_no)
values(
'등산 모임',
'등산하는 모임입니다.',
'오프라인',
'운동/스포츠',
'등산캠프 강남',
10
);

INSERT INTO nm_group(
group_name,
group_info,
group_form,
group_interest,
city,
max_people_no)
values(
'코딩 모임',
'코딩하는 모임입니다.',
'오프라인',
'업종/직무',
'비트캠프 강남',
10
);


-- 등급 예제
insert into nm_grade(grade_no, grade_name)
  values(4, '모임장');  
insert into nm_grade(grade_no, grade_name)
  values(3, '관리자');  
insert into nm_grade(grade_no, grade_name)
  values(2, '정회원');  
insert into nm_grade(grade_no, grade_name)
  values(1, '준회원');  

  

-- 모임 회원 예제
INSERT INTO nm_group_member(group_no,member_no,grade_no)
 values(1,1,1);
 
INSERT INTO nm_group_member(group_no,member_no,grade_no)
 values(1,2,2);
 
INSERT INTO nm_group_member(group_no,member_no,grade_no)
 values(1,3,3);
 
 
-- 메시지 예제
INSERT INTO nm_message(
sender,
receiver,
title,
content)
 values(1,2,'내일 뭐하시나요','내일 시간되사뇽?');
 
INSERT INTO nm_message(
sender,
receiver,
title,
content)
 values(2,1,'아뇨 내일 시간 안됩니다','아뇨 내일 시간 안될거 같아요');
 
INSERT INTO nm_message(
sender,
receiver,
title,
content)
 values(1,2,'ㄴ','ㅔ');
 

-- 공지사항 예제
INSERT INTO nm_notice(group_no,member_no,title,content)
 values(1,1,'모임 이용규칙','제곧내');


-- 공지사항 댓글 예제
INSERT INTO nm_notice_reply(content,notice_no,member_no)
  values('글이 성의 없네요 ㅡ.ㅡ',1,2);
  
-- 일정 예제 데이터
INSERT INTO nm_plan
(group_no,
member_no,
<<<<<<< Updated upstream
member_name,
=======
>>>>>>> Stashed changes
category,
back_color,
title,
place_name,
start_date,
end_date,
content,
thumbnail,
address,
latitude,
longitude)
<<<<<<< Updated upstream
VALUES(1,1,'오승우','중요','#D25565','프로젝트','펜타곤','2020-06-01 12:09', '2020-06-12 13:09','테스트랍니다', 'bit.jpg','주소',11,22);
=======
VALUES(1,1,'중요','#D25565','프로젝트','펜타곤','2020-06-01 12:09', '2020-06-12 13:09','테스트랍니다', 'bit.jpg','주소',11,22);
>>>>>>> Stashed changes

INSERT INTO nm_plan
(group_no,
member_no,
<<<<<<< Updated upstream
member_name,
=======
>>>>>>> Stashed changes
category,
back_color,
title,
place_name,
start_date,
end_date,
content,
thumbnail,
address,
latitude,
longitude)
<<<<<<< Updated upstream
VALUES(1,2,'손진영','선택','#f06595','봄 맞이 소풍','국수봉','2020-06-02 08:09', '2020-06-04 14:09','내용이랍니다', 'bit.jpg','주소',11,22);
=======
VALUES(1,2,'선택','#f06595','봄 맞이 소풍','국수봉','2020-06-02 08:09', '2020-06-04 14:09','내용이랍니다', 'bit.jpg','주소',11,22);
>>>>>>> Stashed changes

  
-- 일정 참여자 & 일정이 먼저
INSERT INTO nm_plan_member(plan_no,member_no,member_name,group_no,attend)
 values(1,1,'오승우',1,'참가');
 
INSERT INTO nm_plan_member(plan_no,member_no,member_name,group_no,attend)
 values(1,2,'손진영',1,'참가');
 
-- 피드 예제
INSERT INTO nm_feed(member_no,group_no,title,content)
  values(1,1,'어제 번개 사진','다음에 한 번 더 해요');
  
INSERT INTO nm_feed(member_no,group_no,title,content)
  values(2,1,'저번 모임 사진','재밋었어요');
  
-- 피드사진 예제
INSERT INTO nm_feed_photo(feed_photo_file,feed_no)
 values('생일파티.jpg',1);
 
INSERT INTO nm_feed_photo(feed_photo_file,feed_no)
 values('생일파티2.jpg',1);
 
INSERT INTO nm_feed_photo(feed_photo_file,feed_no)
 values('저번모임.jpg',2);
  
-- 피드댓글 예제
INSERT INTO nm_feed_reply(content,feed_no,member_no)
  values('와 재밋었겠네요',1,1);

INSERT INTO nm_feed_reply(content,feed_no,member_no)
  values('다음엔 저도 갈게요',1,2);  
  
-- 소통예제
INSERT INTO nm_co(member_no,co_category,title,content)
 values(1,'공지','테스트 게시물입니다.','테스트 게시물입니다.');
 
INSERT INTO nm_co(member_no,co_category,title,content)
 values(2,'홍보','내일 시간 되시는분','댓글 남겨주세요');
 
INSERT INTO nm_co(member_no,co_category,title,content)
 values(3,'구인','일요일 가드 구함','3시 장충동');
 
INSERT INTO nm_co(member_no,co_category,title,content)
 values(1,'공지','테스트 게시물입니다.','테스트 게시물입니다.');
 
INSERT INTO nm_co(member_no,co_category,title,content)
 values(2,'홍보','내일 시간 되시는분','댓글 남겨주세요');
 
INSERT INTO nm_co(member_no,co_category,title,content)
 values(3,'구인','일요일 가드 구함','3시 장충동');
 
INSERT INTO nm_co(member_no,co_category,title,content)
 values(1,'공지','테스트 게시물입니다.','테스트 게시물입니다.');
 
INSERT INTO nm_co(member_no,co_category,title,content)
 values(2,'홍보','내일 시간 되시는분','댓글 남겨주세요');
 
INSERT INTO nm_co(member_no,co_category,title,content)
 values(3,'구인','일요일 가드 구함','3시 장충동');
 
INSERT INTO nm_co(member_no,co_category,title,content)
 values(1,'공지','테스트 게시물입니다.','테스트 게시물입니다.');
 
INSERT INTO nm_co(member_no,co_category,title,content)
 values(2,'홍보','내일 시간 되시는분','댓글 남겨주세요');
 
INSERT INTO nm_co(member_no,co_category,title,content)
 values(3,'구인','일요일 가드 구함','3시 장충동');
 
INSERT INTO nm_co(member_no,co_category,title,content)
 values(1,'공지','테스트 게시물입니다.','테스트 게시물입니다.');
 
INSERT INTO nm_co(member_no,co_category,title,content)
 values(2,'홍보','내일 시간 되시는분','댓글 남겨주세요');
 
INSERT INTO nm_co(member_no,co_category,title,content)
 values(3,'구인','일요일 가드 구함','3시 장충동');
 
INSERT INTO nm_co(member_no,co_category,title,content)
 values(1,'공지','테스트 게시물입니다.','테스트 게시물입니다.');
 
INSERT INTO nm_co(member_no,co_category,title,content)
 values(2,'홍보','내일 시간 되시는분','댓글 남겨주세요');
 
INSERT INTO nm_co(member_no,co_category,title,content)
 values(3,'구인','일요일 가드 구함','3시 장충동');
 
INSERT INTO nm_co(member_no,co_category,title,content)
 values(1,'공지','테스트 게시물입니다.','테스트 게시물입니다.');
 
INSERT INTO nm_co(member_no,co_category,title,content)
 values(2,'홍보','내일 시간 되시는분','댓글 남겨주세요');
 
INSERT INTO nm_co(member_no,co_category,title,content)
 values(3,'구인','일요일 가드 구함','3시 장충동');
 
INSERT INTO nm_co(member_no,co_category,title,content)
 values(1,'공지','테스트 게시물입니다.','테스트 게시물입니다.');
 
INSERT INTO nm_co(member_no,co_category,title,content)
 values(2,'홍보','내일 시간 되시는분','댓글 남겨주세요');
 
INSERT INTO nm_co(member_no,co_category,title,content)
 values(3,'구인','일요일 가드 구함','3시 장충동');
 
 
-- 소통댓글 예제
insert into nm_co_reply(content,co_no,member_no)
values('무슨 테스트인가요?',1,1);

insert into nm_co_reply(content,co_no,member_no)
values('저요~',2,1);

insert into nm_co_reply(content,co_no,member_no)
values('30000원 입니다',2,2);
   
-- 알림 예제
INSERT INTO nm_alram(member_no,notice_no,plan_no,feed_no)
  values(1,1,1,1);
  
INSERT INTO nm_alram(member_no,notice_no,plan_no,feed_no)
  values(2,1,1,1); 
 
 
-- 모임계좌 예제
INSERT INTO nm_group_account(
bank_info_id,
group_no,
bank_account_no,
bank_name,
bank_account_holder)
  VALUES(1,1,'123-4567-7890','우리은행','홍길동');

  
-- 회계 예제
INSERT INTO nm_account
(
group_no,
bank_info_id,
account_type_name,
deposit,
payment_date,
account_connection,
receipt_photo)
 values(1,1,'회비입금',250000,'2020-04-24','삼성','receipt.jpg');
 
-- 회계 예제
INSERT INTO nm_account
(
group_no,
bank_info_id,
account_type_name,
deposit,

payment_date,
account_connection, 
receipt_photo)
 values(1,1,'회비입금',100000,'2020-04-24','두산','receipt.jpg');
 

 
 -- 회계 예제
INSERT INTO nm_account
(
group_no,
bank_info_id,
account_type_name,
withdraw, 
payment_date,
account_connection, 
remarks, 
receipt_photo)
 values(1,1,'회의비',50000,'2020-04-24','금문도', '정기회의','receipt.jpg');
 
-- 회계 예제
INSERT INTO nm_account
(
group_no,
bank_info_id,
account_type_name,
deposit,

payment_date,
account_connection, 
receipt_photo)
 values(1,1,'회비입금',100000,'2020-04-24','애플' ,'receipt.jpg');
 

 
 -- 회계 예제
INSERT INTO nm_account
(
group_no,
bank_info_id,
account_type_name,
withdraw, 
payment_date,
account_connection, 
receipt_photo)
 values(1,1,'회식',50000,'2020-04-24','GS25','receipt.jpg');
 
  
-- 회계 예제
INSERT INTO nm_account
(
group_no,
bank_info_id,
account_type_name,
deposit,
payment_date,
account_connection, 
receipt_photo)
 values(1,1,'회비입금',100000,'2020-04-24','MS','receipt.jpg');
 

 
 -- 회계 예제
INSERT INTO nm_account
(
group_no,
bank_info_id,
account_type_name,
withdraw, 
payment_date,
account_connection, 
receipt_photo)
 values(1,1,'회식',50000,'2020-04-24','판도라','receipt.jpg');
 
 
 -- 모임 예제
INSERT INTO nm_dues
(
group_no,
bank_info_id,
dues_period,
dues)
 values(1,1,'월 1회',150000);
 
 -- 첨부파일 예제
INSERT INTO nm_MP_FILE(
  FILE_NO,
  BNO,
  ORG_FILE_NAME,
  STORED_FILE_NAME,
  FILE_SIZE
)VALUES(
1,
1,
'원래첨부파일이름',
'저장된파일이름',
10
);

 