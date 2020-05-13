
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
withdraw,
sns) 
values(
'오승우',
'abc.jpg',
'1998-10-20',
'fivewincow@gmail.com',
'1111',
'열심히',
'코딩',
'오승우',1,
'페이스북');

INSERT INTO nm_member(
member_name, 
id_photo, 
birthday,     
email,       
password,      
intro,      
interest,     
nickname,      
withdraw,
sns) 
values(
'손진영',
'abc.jpg',
'1998-10-20',
'jyson19@gmail.com',
'1111',
'열심히',
'코딩',
'손진영',1,
'페이스북');

INSERT INTO nm_member(
member_name, 
id_photo, 
birthday,     
email,       
password,      
intro,      
interest,     
nickname,      
withdraw,
sns) 
values(
'신나라',
'abc.jpg',
'1998-10-20',
'narashin547@gmail.com',
'1111',
'열심히',
'코딩',
'신나라',1,
'페이스북');
 
INSERT INTO nm_member(
member_name, 
id_photo, 
birthday,     
email,       
password,      
intro,      
interest,     
nickname,      
withdraw,
sns) 
values(
'김나영', 
'photo1.jpg', 
'2000-2-2',
'invin1201@gmail.com', 
'2222', 
'김나영입니다.', 
'댄스/무용', 
'나사김',1,
'instagram.com/test');


INSERT INTO nm_member(
member_name, 
id_photo, 
birthday,     
email,       
password,      
intro,      
interest,     
nickname,      
withdraw,
sns) 
values(
'이선경', 
'photo3.jpg', 
'2000-2-2', 
'esun1801@naver.com', 
'4444', 
'이선경입니다.', 
'공예/만들기', 
'선경삼',1,
'instagram.com/test4');

INSERT INTO nm_member(
member_name, 
id_photo, 
birthday,     
email,       
password,      
intro,      
interest,     
nickname,      
withdraw,
sns) 
values(
'김티모', 
'teemo.jpg', 
'2000-2-2', 
'test@test.com', 
'1111', 
'정찰대입니다.', 
'격투', 
'티모',1,
'instagram.com/test');


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


-- 공지사항 사진 예제
INSERT INTO nm_notice_photo(notice_photo_no,notice_photo_file,notice_no)
  values(1,'회비 납부하는법.jpg',1);
  
-- 공지사항 댓글 예제
INSERT INTO nm_notice_reply(content,notice_no,member_no)
  values('글이 성의 없네요 ㅡ.ㅡ',1,2);
  
-- 일정 예제 데이터
INSERT INTO nm_plan
(group_no,
plan_date,
title,
subtitle,
content,
thumbnail,
place_name,
address,
latitude,
longitude)
VALUES(1,'2020-04-09','프로젝트', '그룹프로젝트입니다','내용이랍니다', 'bit.jpg', '비트캠프 강남센터','주소',11,22);

-- 일정 참여자 & 일정이 먼저
INSERT INTO nm_plan_member(plan_no,member_no,group_no,attend)
 values(1,1,1,'참가');
 
INSERT INTO nm_plan_member(plan_no,member_no,group_no,attend)
 values(1,2,1,'불참');

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
  
  -- 피드좋아요 예제
INSERT INTO nm_feed_like(like_count,member_no,feed_no)
  values(1,1,1);
  
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
 
-- 소통사진 예제
INSERT INTO nm_co_photo(co_photo_file,co_no)
  values('party.jpg',1);
  
-- 소통좋아요 예제
INSERT INTO nm_co_like(like_count,member_no,co_no)
  values(1,1,1);
  
-- 알림 예제
INSERT INTO nm_alram(member_no,notice_no,plan_no,feed_no)
  values(1,1,1,1);
  
INSERT INTO nm_alram(member_no,notice_no,plan_no,feed_no)
  values(2,1,1,1); 
 
 
-- 모임계좌 예제
INSERT INTO nm_group_account(bank_info_id,group_no,bank_account_no,bank_name,bank_account_holder)
  VALUES(1,1,'123-4567-7890','우리은행','홍길동');

INSERT INTO nm_group_account(bank_info_id,group_no,bank_account_no,bank_name,bank_account_holder)
  VALUES(2,1,'789-765433-12345','기업은행','임꺽정');   


  
-- 회계 예제
INSERT INTO nm_account
(
group_no,
bank_info_id,
account_type_no,
account_type_name,
assets,
amount,
payment_date,
account_connection,
remarks,
receipt_photo)
 values(1,1,1,'유류비',100000,150000,'2020-04-24','여비교통비', '비고','receipt.jpg');
 
-- 회계 예제
INSERT INTO nm_account
(
group_no,
bank_info_id,
account_type_no,
account_type_name,
assets,
amount,
payment_date,
account_connection,
remarks,
receipt_photo)
 values(1,1,1,'유류비',100000,150000,'2020-04-24','강남주유소', '비고','receipt.jpg');
 
 -- 회계 예제
INSERT INTO nm_account
(
group_no,
bank_info_id,
account_type_no,
account_type_name,
assets,
amount,
payment_date,
account_connection, 
remarks,
receipt_photo)
 values(1,1,2,'술값',100000,150000,'2020-04-24','금문도', '비고','receipt.jpg');
 
  
 