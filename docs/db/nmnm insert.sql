-- 모임 예제
INSERT INTO nm_group
(group_name,
group_info,
category,
group_photo,
city,
max_people_no,
bank,
bank_no,
account_holder)
values('등산 모임',
'등산하는 모임입니다.',
1,
'이미지.gif',
'태평양',
50,
'하나은행',
'2020-01-1',
'이건희');

INSERT INTO nm_group
(group_name,
group_info,
category,
group_photo,
city,
max_people_no,
bank,
bank_no,
account_holder)
values('게임 모임',
'게임하는 모임입니다.',
2,
'곰비둘기.gif',
'협곡',
10,
'없음',
'2020-0111-1',
'이상혁');

INSERT INTO nm_group
(group_name,
group_info,
category,
group_photo,
city,
max_people_no,
bank,
bank_no,
account_holder)
values('코딩 모임',
'코딩하는 모임입니다.',
3,
'연봉1억.gif',
'비트캠프 강남',
26,
'기업은행',
'20191202',
'엄진영');

-- 등급 예제
insert into nm_grade(grade_no, grade_name)
  values(4, '모임장');  
insert into nm_grade(grade_no, grade_name)
  values(3, '관리자');  
insert into nm_grade(grade_no, grade_name)
  values(2, '정회원');  
insert into nm_grade(grade_no, grade_name)
  values(1, '준회원');  

  
-- 회원 예제 데이터

INSERT INTO nm_members
(member_name, 
id_photo, 
birthday,     
gender,     
email,       
tel,        
password,      
intro,      
interests,     
nickname,      
account_status,
grade_no,      
withdraw,
sns) 
values('오승우',
'abc.jpg',
'1998-10-20',
true,
'fivewincow@gmail.com',
'010-3002-0169',
'1111',
'열심히',
6,
'오승우',
1,1,1,
'페이스북');

INSERT INTO nm_members
(member_name, 
id_photo, 
birthday,     
gender,     
email,       
tel,        
password,      
intro,      
interests,     
nickname,      
account_status,
grade_no,      
withdraw,
sns) 
values('손진영',
'a.jpg',
'1993-11-11',
true,
'mrHand@gmail.com',
'010-2222-0119',
'1111',
'열심히',
6,
'손타쿠',
1,1,1,
'인스타그램');

INSERT INTO nm_members
(member_name, 
id_photo, 
birthday,     
gender,     
email,       
tel,        
password,      
intro,      
interests,     
nickname,      
account_status,
grade_no,      
withdraw,
sns) 
values('신나라', 
'photo.jpg', 
'1988-4-9', 
true, 
'test@gmail.com', 
'010-6823-5479', 
'1111', 
'곰비둘기입니다.', 
1, 
'곰비둘기', 
1, 1, 1, 
'instagram.com/gramrabbitbear');
 
INSERT INTO nm_members
(member_name, 
id_photo, 
birthday,     
gender,     
email,       
tel,        
password,      
intro,      
interests,     
nickname,      
account_status,
grade_no,      
withdraw,
sns) 
values('김나영', 
'photo1.jpg', 
'2000-4-9', 
true, 
'test1@gmail.com', 
'010-1111-1111', 
'2222', 
'김나영입니다.', 
1, 
'나사김', 
1, 4, 1, 
'instagram.com/test');


INSERT INTO nm_members
(member_name, 
id_photo, 
birthday,     
gender,     
email,       
tel,        
password,      
intro,      
interests,     
nickname,      
account_status,
grade_no,      
withdraw,
sns) 
values('이선경', 
'photo3.jpg', 
'2000-2-2', 
true, 
'test3@gmail.com', 
'010-1113-1111', 
'4444', 
'이선경입니다.', 
1, 
'선경삼', 
1, 4, 1, 
'instagram.com/test4');

  

-- 모임 회원 예제

INSERT INTO nm_meeting_member(group_no,member_no,grade_no)
 values(1,1000,1);
 
INSERT INTO nm_meeting_member(group_no,member_no,grade_no)
 values(1,1001,2);
 
 -- 게시판 유형 예제

INSERT INTO nm_board_type(board_type_no,type_name)
 values(1,'혼디스코드용');
 
-- 등록 권한 예제

INSERT INTO nm_board_grade(board_type_no,grade_no)
 values(1,1);

-- 모임게시글 예제 데이터

insert into nm_meeting_board
(board_type_no, 
group_no,
member_no, 
content)
values(
1,
1,
1000,
'타인에게 불쾌감을 주는 행위는 금지입니다');

insert into nm_meeting_board(
board_type_no,
group_no,
member_no, 
content)
values(
1,
1,
1001,'사이좋게 지냅시다');

-- 게시물 사진 예제

INSERT INTO nm_board_photo(photo_file)
 values('나혼자.jpg');
 
 INSERT INTO nm_board_photo(photo_file)
 values('디스코드.jpg');
 
-- 메시지 예제

INSERT INTO nm_message(
sender,
receiver,
title,
content)
 values(1000,1001,'011011','언제 들어오시나요..');
 
-- 알림 예제

INSERT INTO nm_notify(member_no,board_no)
 values(1000,1);

-- 댓글 예제 데이터

insert into nm_reply
(board_no, content)
values(1,'멋져요');

insert into nm_reply
(board_no, content)
values(1,'멋져요');

insert into nm_reply
(board_no, content)
values(1,'꼭 참석하겠습니다');

insert into nm_reply
(board_no, content)
values(1,'좋아요 누르고 갑니다');

-- 공지사항 예제

INSERT INTO nm_notices_board(title)
 values('나혼자 ~ 나혼자~');


-- 일정 예제 데이터

insert into nm_schedule
(board_no,schedule_date, title, place_name, address, latitude, longitude)
values(1,'2020-03-03', '봉사활동', '비트캠프 강남센터',
'서울특별시 강남구 역삼동', 37.499497, 127.029350);


-- 소통 게시판 예제

INSERT INTO nm_normal_board(member_no,title,content,noticeable)
 values(1000,'디스코드..','혼자..',1);
 
-- 회원초대 예제

INSERT INTO nm_invite(member_no,group_no,state)
 values(1001,1,1);
 
 -- 회계 유형

INSERT INTO nm_account_type(account_type_no,board_type_name)
 values(1,'혼디스코드비');
 
-- 회계 예제

INSERT INTO nm_account
(assets,
group_no,
member_no,
amount,
payment_date,
account_type_no,
remarks,
receipt_photo)
 values(190000,1,1000,9999,'2020-04-03',1,'나혼자?','ㅠㅠㅠ');
 
-- 일정 참여자 & 일정이 먼저

INSERT INTO nm_schedule_member(member_no,group_no,board_no)
 values(1000,1,1);
 
-- 소통 게시판 좋아요 예제

INSERT INTO nm_normal_board_like(member_no,normal_board_no)
 values(1000,1);
 
-- 모임 게시글 좋아요 예제 & nm_meeting_board 먼저

INSERT INTO nm_meeting_board_like(board_no,member_no,group_no)
 values(1,1000,1);
 
-- 
