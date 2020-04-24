DROP DATABASE nmnmdb;
CREATE DATABASE nmnmdb DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
use nmnmdb;

-- 모임 예제
INSERT INTO nm_group
(group_name,
group_info,
category,
group_photo,
city,
max_people_no)
values('번개 모임',
'번개 모임입니다.',
'소셜',
'thunder.gif',
'강남',
50);

INSERT INTO nm_group
(group_name,
group_info,
category,
group_photo,
city)
values('코딩 모임',
'코딩하는 모임입니다.',
'IT',
'연봉1억.gif',
'비트캠프 강남');

-- 모임 계좌 예제
INSERT INTO nm_group_account(bank_no,group_no,bank,account_holder)
	VALUES('123456',1,'우리 은행','홍길동');

INSERT INTO nm_group_account(bank_no,group_no,bank,account_holder)
	VALUES('789',2,'기업 은행','임꺽정');	
	
-- 등급 예제
insert into nm_grade(grade_no, grade_name)
  values(4, '모임장');  
insert into nm_grade(grade_no, grade_name)
  values(3, '관리자');  
insert into nm_grade(grade_no, grade_name)
  values(2, '정회원');  
insert into nm_grade(grade_no, grade_name)
  values(1, '준회원');  

-- 사용권한 예제 (? 사용권한 번호랑 권한이랑 차이가 
-- 뭔가요 굳이 둘다 번호로 나눌 필요가?) 아니면 VARCHAR를 INTEGER로 ??

INSERT INTO nm_write_authority(authority_no,authority_name)
  values(1,'관리자');
  
INSERT INTO nm_write_authority(authority_no,authority_name)
  values(2,'정회원');
  
-- 회계권한 예제

INSERT INTO nm_account_authority(account_authority_no,group_no,authority_no,grade_no)
  values(1,1,1,1);
  
-- 공지권한 예제

INSERT INTO nm_notice_authority(notice_authority_no,authority_no,grade_no,group_no)
  values(1,1,1,1);

INSERT INTO nm_notice_authority(notice_authority_no,authority_no,grade_no,group_no)
  values(2,1,2,1);
  
-- 회원 예제 데이터

INSERT INTO nm_member
(member_name, 
id_photo, 
birthday,     
gender,     
email,       
tel,        
password,      
intro,      
interest,     
nickname,      
withdraw,
sns) 
values('오승우',
'abc.jpg',
'1998-10-20',
'남자',
'fivewincow@gmail.com',
'010-3002-0169',
'1111',
'열심히',
'코딩',
'오승우',1,
'페이스북');

INSERT INTO nm_member
(member_name, 
id_photo, 
birthday,     
gender,     
email,       
tel,        
password,      
intro,      
interest,     
nickname,      
withdraw,
sns) 
values('손진영',
'a.jpg',
'1993-11-11',
'남자',
'mrHand@gmail.com',
'010-2222-0119',
'1111',
'열심히',
'코딩',
'손타쿠',1,
'인스타그램');

INSERT INTO nm_member
(member_name, 
id_photo, 
birthday,     
gender,     
email,       
tel,        
password,      
intro,      
interest,     
nickname,      
withdraw,
sns) 
values('신나라', 
'photo.jpg', 
'1988-4-9', 
'여자', 
'test@gmail.com', 
'010-6823-5479', 
'1111', 
'곰비둘기입니다.', 
'코딩', 
'곰비둘기',  1, 
'instagram.com/gramrabbitbear');
 
INSERT INTO nm_member
(member_name, 
id_photo, 
birthday,     
gender,     
email,       
tel,        
password,      
intro,      
interest,     
nickname,      
withdraw,
sns) 
values('김나영', 
'photo1.jpg', 
'2000-4-9', 
'여자', 
'test1@gmail.com', 
'010-1111-1111', 
'2222', 
'김나영입니다.', 
'코딩', 
'나사김',  1, 
'instagram.com/test');


INSERT INTO nm_member
(member_name, 
id_photo, 
birthday,     
gender,     
email,       
tel,        
password,      
intro,      
interest,     
nickname,      
withdraw,
sns) 
values('이선경', 
'photo3.jpg', 
'2000-2-2', 
'여자', 
'test3@gmail.com', 
'010-1113-1111', 
'4444', 
'이선경입니다.', 
'코딩', 
'선경삼',  1, 
'instagram.com/test4');

  

-- 모임 회원 예제

INSERT INTO nm_meeting_member(group_no,member_no,grade_no)
 values(1,1,1);
 
INSERT INTO nm_meeting_member(group_no,member_no,grade_no)
 values(1,2,2);
 
INSERT INTO nm_meeting_member(group_no,member_no,grade_no)
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

INSERT INTO nm_notice_board(group_no,member_no,title,content)
 values(1,1,'모임 이용규칙','제곧내');


-- 공지사항 사진 예제
-- 여기 auto_increment 뭔가 이상함
-- 사진인데 notice_board_no 이걸 auto_increment가 되어있음
 
INSERT INTO nm_notice_photo(notice_photo_no,photo_file,notice_board_no)
  values(1,'회비 납부하는법.jpg',1);
  
-- 공지사항 댓글 예제
INSERT INTO nm_notice_reply(content,notice_board_no,member_no)
  values('글이 성의 없네요 ㅡ.ㅡ',1,2);
  
-- 일정 예제 데이터

INSERT INTO nm_plan
(group_no,
plan_date,
title,
content,
thumbnail,
place_name,
address,
latitude,
longitude)
VALUES(1,'2020-04-09','프로젝트', '그룹프로젝트입니다', 'bit.jpg', '비트캠프 강남센터','주소',11,22);

-- 일정 참여자 & 일정이 먼저

INSERT INTO nm_plan_member(plan_no,member_no,group_no,attend)
 values(1,1,1,'참가');
 
INSERT INTO nm_plan_member(plan_no,member_no,group_no,attend)
 values(1,2,1,'불참');

-- 피드 게시글 예제

INSERT INTO nm_feed(member_no,group_no,title,content,thumbnail)
  values(1,1,'어제 번개 사진','다음에 한번 더 해요', 'aa.jpg');
  
INSERT INTO nm_feed(member_no,group_no,title,content,thumbnail)
  values(2,1,'저번 모임 사진','재밋었어요', 'aa.jpg');
  
-- 게시물 사진(피드(?)) 예제

INSERT INTO nm_feed_photo(photo_file,feed_no)
 values('생일파티.jpg',1);
 
INSERT INTO nm_feed_photo(photo_file,feed_no)
 values('생일파티2.jpg',1);
 
INSERT INTO nm_feed_photo(photo_file,feed_no)
 values('저번모임.jpg',2);
  
-- 피드게시글 댓글 예제

INSERT INTO nm_feed_reply(content,feed_no,member_no)
  values('와 재밋었겠네요',1,1);

INSERT INTO nm_feed_reply(content,feed_no,member_no)
  values('다음엔 저도 갈게요',2,1);  
  
-- 소통 게시판 예제

INSERT INTO nm_communication_board(member_no,title,content)
 values(1,'테스트 게시물입니다.','테스트 게시물입니다.');
 
INSERT INTO nm_communication_board(member_no,title,content)
 values(2,'내일 시간 되시는분','댓글 남겨주세요');
 
INSERT INTO nm_communication_board(member_no,title,content)
 values(2,'저희 회비 얼마인가요?','이번에 들어와서 모르겠네요');
 
-- 소통 게시판 댓글 예제

insert into nm_communication_reply(content,communication_board_no,member_no)
values('무슨 테스트인가요?',1,1);

insert into nm_communication_reply(content,communication_board_no,member_no)
values('저요~',2,1);

insert into nm_communication_reply(content,communication_board_no,member_no)
values('30000원 입니다',2,2);
 
-- 소통 게시판 사진 예제

INSERT INTO nm_communication_photo(photo_file,communication_board_no)
  values('party.jpg',1);
  
-- 소통게시판 좋아요(추천(?))

INSERT INTO nm_communication_board_like(member_no,communication_board_no)
  values(1,1);
  
-- 회계 예제

INSERT INTO nm_account
(

bank_no,
account_type_no,
account_type_name,
group_no,
assets,
amount,
payment_date,
remarks,
receipt_photo)
 values('123456',1,'유류비',1,100000,150000,'2020-04-24','비고','receipt.jpg');
 
 
INSERT INTO nm_account
(

bank_no,
account_type_no,
account_type_name,
group_no,
assets,
amount,
payment_date,
remarks,
receipt_photo)
 values('789',1,'술값',1,100000,150000,'2020-04-24','비고','receipt.jpg');
 
-- 알림 예제

INSERT INTO nm_alram(member_no,notice_board_no,plan_no,feed_no)
  values(1,1,1,1);
  
INSERT INTO nm_alram(member_no,notice_board_no,plan_no,feed_no)
  values(2,1,1,1); 

-- 알림은 4개중 하나만 올 수 있으니 not null 말고 0이랑 1로 구분하는게 좋을거 같아요
-- default는 0으로 하고 알림오면 1로 받게 -> member_no만 기본키고 나머지는 그냥 외래키로 null 허용
 
-- 소통 게시판 좋아요 예제

INSERT INTO nm_communication_board_like(member_no,communication_board_no)
 values(1,2);
