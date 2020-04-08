-- 공지권한
DROP TABLE IF EXISTS TABLE3 RESTRICT;

-- 공지사항게시글
DROP TABLE IF EXISTS nm_notices_board RESTRICT;

-- 공지사항댓글
DROP TABLE IF EXISTS nm_reply RESTRICT;

-- 공지사항사진
DROP TABLE IF EXISTS nm_board_photo2 RESTRICT;

-- 등급
DROP TABLE IF EXISTS nm_grade RESTRICT;

-- 메시지
DROP TABLE IF EXISTS nm_message RESTRICT;

-- 모임
DROP TABLE IF EXISTS nm_group RESTRICT;

-- 모임회원
DROP TABLE IF EXISTS nm_meeting_member RESTRICT;

-- 사용권한
DROP TABLE IF EXISTS TABLE2 RESTRICT;

-- 소통게시글
DROP TABLE IF EXISTS nm_communication_board RESTRICT;

-- 소통게시글댓글
DROP TABLE IF EXISTS nm_reply2 RESTRICT;

-- 소통게시글사진
DROP TABLE IF EXISTS nm_board_photo3 RESTRICT;

-- 소통게시판좋아요
DROP TABLE IF EXISTS nm_normal_board_like RESTRICT;

-- 알림
DROP TABLE IF EXISTS nm_notify RESTRICT;

-- 일정
DROP TABLE IF EXISTS nm_plan RESTRICT;

-- 일정참여자
DROP TABLE IF EXISTS nm_schedule_member RESTRICT;

-- 피드게시글
DROP TABLE IF EXISTS nm_feed RESTRICT;

-- 피드게시글댓글
DROP TABLE IF EXISTS nm_reply3 RESTRICT;

-- 피드게시글사진
DROP TABLE IF EXISTS nm_board_photo RESTRICT;

-- 회계
DROP TABLE IF EXISTS nm_account RESTRICT;

-- 회계권한
DROP TABLE IF EXISTS TABLE RESTRICT;

-- 회계유형
DROP TABLE IF EXISTS nm_account_type RESTRICT;

-- 회원
DROP TABLE IF EXISTS nm_members RESTRICT;

-- 공지권한
CREATE TABLE TABLE3 (
  notice_authority_no INTEGER NOT NULL COMMENT '공지권한번호', -- 공지권한번호
  authority_no        INTEGER NOT NULL COMMENT '사용권한번호', -- 사용권한번호
  grade_no            INTEGER NOT NULL COMMENT '등급번호', -- 등급번호
  group_no            INTEGER NOT NULL COMMENT '모임번호' -- 모임번호
)
COMMENT '공지권한';

-- 공지권한
ALTER TABLE TABLE3
  ADD CONSTRAINT PK_TABLE3 -- 공지권한 기본키
    PRIMARY KEY (
      notice_authority_no -- 공지권한번호
    );

-- 공지사항게시글
CREATE TABLE nm_notices_board (
  notice_board_no INTEGER      NOT NULL COMMENT '공지사항번호', -- 공지사항번호
  group_no        INTEGER      NOT NULL COMMENT '모임번호', -- 모임번호
  member_no       INTEGER      NOT NULL COMMENT '회원번호', -- 회원번호
  title           VARCHAR(255) NOT NULL COMMENT '제목', -- 제목
  content         TEXT         NOT NULL COMMENT '내용', -- 내용
  create_date     DATETIME     NOT NULL DEFAULT now() COMMENT '작성일' -- 작성일
)
COMMENT '공지사항게시글';

-- 공지사항게시글
ALTER TABLE nm_notices_board
  ADD CONSTRAINT PK_nm_notices_board -- 공지사항게시글 기본키
    PRIMARY KEY (
      notice_board_no -- 공지사항번호
    );

ALTER TABLE nm_notices_board
  MODIFY COLUMN notice_board_no INTEGER NOT NULL AUTO_INCREMENT COMMENT '공지사항번호';

ALTER TABLE nm_notices_board
  AUTO_INCREMENT = 1;

-- 공지사항댓글
CREATE TABLE nm_reply (
  reply_no        INTEGER NOT NULL COMMENT '댓글번호', -- 댓글번호
  content         TEXT    NOT NULL COMMENT '댓글내용', -- 댓글내용
  notice_board_no INTEGER NOT NULL COMMENT '공지사항번호', -- 공지사항번호
  member_no       INTEGER NOT NULL COMMENT '회원번호' -- 회원번호
)
COMMENT '공지사항댓글';

-- 공지사항댓글
ALTER TABLE nm_reply
  ADD CONSTRAINT PK_nm_reply -- 공지사항댓글 기본키
    PRIMARY KEY (
      reply_no -- 댓글번호
    );

ALTER TABLE nm_reply
  MODIFY COLUMN reply_no INTEGER NOT NULL AUTO_INCREMENT COMMENT '댓글번호';

ALTER TABLE nm_reply
  AUTO_INCREMENT = 1;

-- 공지사항사진
CREATE TABLE nm_board_photo2 (
  board_photo_no  INTEGER      NOT NULL COMMENT '공지사항사진번호', -- 공지사항사진번호
  photo_file      VARCHAR(255) NOT NULL COMMENT '사진파일', -- 사진파일
  notice_board_no INTEGER      NOT NULL COMMENT '공지사항번호' -- 공지사항번호
)
COMMENT '공지사항사진';

-- 공지사항사진
ALTER TABLE nm_board_photo2
  ADD CONSTRAINT PK_nm_board_photo2 -- 공지사항사진 기본키
    PRIMARY KEY (
      board_photo_no -- 공지사항사진번호
    );

ALTER TABLE nm_board_photo2
  MODIFY COLUMN notice_board_no INTEGER NOT NULL AUTO_INCREMENT COMMENT '공지사항번호';

ALTER TABLE nm_board_photo2
  AUTO_INCREMENT = 1;

-- 등급
CREATE TABLE nm_grade (
  grade_no   INTEGER      NOT NULL COMMENT '등급번호', -- 등급번호
  grade_name VARCHAR(255) NOT NULL COMMENT '등급명칭' -- 등급명칭
)
COMMENT '등급';

-- 등급
ALTER TABLE nm_grade
  ADD CONSTRAINT PK_nm_grade -- 등급 기본키
    PRIMARY KEY (
      grade_no -- 등급번호
    );

-- 메시지
CREATE TABLE nm_message (
  message_no  INTEGER      NOT NULL COMMENT '메시지번호', -- 메시지번호
  sender      INTEGER      NOT NULL COMMENT '발신자', -- 발신자
  receiver    INTEGER      NOT NULL COMMENT '수신자', -- 수신자
  title       VARCHAR(255) NOT NULL COMMENT '제목', -- 제목
  content     TEXT         NOT NULL COMMENT '내용', -- 내용
  create_date DATETIME     NOT NULL DEFAULT now() COMMENT '날짜', -- 날짜
  read_date   DATETIME     NOT NULL COMMENT '확인일시' -- 확인일시
)
COMMENT '메시지';

-- 메시지
ALTER TABLE nm_message
  ADD CONSTRAINT PK_nm_message -- 메시지 기본키
    PRIMARY KEY (
      message_no -- 메시지번호
    );

ALTER TABLE nm_message
  MODIFY COLUMN message_no INTEGER NOT NULL AUTO_INCREMENT COMMENT '메시지번호';

ALTER TABLE nm_message
  AUTO_INCREMENT = 1;

-- 모임
CREATE TABLE nm_group (
  group_no       INTEGER      NOT NULL COMMENT '모임번호', -- 모임번호
  group_name     VARCHAR(255) NOT NULL COMMENT '모임명', -- 모임명
  group_info     TEXT         NOT NULL COMMENT '모임 설명', -- 모임 설명
  category       INTEGER      NOT NULL COMMENT '모임 분류', -- 모임 분류
  group_photo    VARCHAR(255) NULL     COMMENT '대표이미지', -- 대표이미지
  city           VARCHAR(255) NULL     COMMENT '지역', -- 지역
  max_people_no  INTEGER      NOT NULL COMMENT '최대인원', -- 최대인원
  bank           VARCHAR(255) NOT NULL COMMENT '은행', -- 은행
  bank_no        VARCHAR(20)  NOT NULL COMMENT '계좌번호', -- 계좌번호
  account_holder VARCHAR(50)  NOT NULL COMMENT '예금주' -- 예금주
)
COMMENT '모임';

-- 모임
ALTER TABLE nm_group
  ADD CONSTRAINT PK_nm_group -- 모임 기본키
    PRIMARY KEY (
      group_no -- 모임번호
    );

-- 모임 유니크 인덱스
CREATE UNIQUE INDEX UIX_nm_group
  ON nm_group ( -- 모임
    group_name ASC -- 모임명
  );

ALTER TABLE nm_group
  MODIFY COLUMN group_no INTEGER NOT NULL AUTO_INCREMENT COMMENT '모임번호';

ALTER TABLE nm_group
  AUTO_INCREMENT = 1;

-- 모임회원
CREATE TABLE nm_meeting_member (
  group_no  INTEGER NOT NULL COMMENT '모임번호', -- 모임번호
  member_no INTEGER NOT NULL COMMENT '회원번호', -- 회원번호
  grade_no  INTEGER NOT NULL COMMENT '등급번호' -- 등급번호
)
COMMENT '모임회원';

-- 모임회원
ALTER TABLE nm_meeting_member
  ADD CONSTRAINT PK_nm_meeting_member -- 모임회원 기본키
    PRIMARY KEY (
      group_no,  -- 모임번호
      member_no  -- 회원번호
    );

-- 사용권한
CREATE TABLE TABLE2 (
  authority_no INTEGER NOT NULL COMMENT '사용권한번호', -- 사용권한번호
  authority    INTEGER NOT NULL COMMENT '권한' -- 권한
)
COMMENT '사용권한';

-- 사용권한
ALTER TABLE TABLE2
  ADD CONSTRAINT PK_TABLE2 -- 사용권한 기본키
    PRIMARY KEY (
      authority_no -- 사용권한번호
    );

-- 소통게시글
CREATE TABLE nm_communication_board (
  normal_board_no INTEGER      NOT NULL COMMENT '소통게시글번호', -- 소통게시글번호
  member_no       INTEGER      NOT NULL COMMENT '회원번호', -- 회원번호
  title           VARCHAR(255) NOT NULL COMMENT '제목', -- 제목
  content         TEXT         NOT NULL COMMENT '내용', -- 내용
  noticeable      INTEGER      NOT NULL COMMENT '공지사항 여부(운영자)', -- 공지사항 여부(운영자)
  create_date     DATETIME     NOT NULL DEFAULT now() COMMENT '작성일' -- 작성일
)
COMMENT '소통게시글';

-- 소통게시글
ALTER TABLE nm_communication_board
  ADD CONSTRAINT PK_nm_communication_board -- 소통게시글 기본키
    PRIMARY KEY (
      normal_board_no -- 소통게시글번호
    );

ALTER TABLE nm_communication_board
  MODIFY COLUMN normal_board_no INTEGER NOT NULL AUTO_INCREMENT COMMENT '소통게시글번호';

ALTER TABLE nm_communication_board
  AUTO_INCREMENT = 1;

-- 소통게시글댓글
CREATE TABLE nm_reply2 (
  reply_no        INTEGER NOT NULL COMMENT '댓글번호', -- 댓글번호
  content         TEXT    NOT NULL COMMENT '댓글내용', -- 댓글내용
  normal_board_no INTEGER NOT NULL COMMENT '소통게시글번호', -- 소통게시글번호
  member_no       INTEGER NOT NULL COMMENT '회원번호' -- 회원번호
)
COMMENT '소통게시글댓글';

-- 소통게시글댓글
ALTER TABLE nm_reply2
  ADD CONSTRAINT PK_nm_reply2 -- 소통게시글댓글 기본키
    PRIMARY KEY (
      reply_no -- 댓글번호
    );

ALTER TABLE nm_reply2
  MODIFY COLUMN reply_no INTEGER NOT NULL AUTO_INCREMENT COMMENT '댓글번호';

ALTER TABLE nm_reply2
  AUTO_INCREMENT = 1;

-- 소통게시글사진
CREATE TABLE nm_board_photo3 (
  board_photo_no  INTEGER      NOT NULL COMMENT '소통게시글사진번호', -- 소통게시글사진번호
  photo_file      VARCHAR(255) NOT NULL COMMENT '사진파일', -- 사진파일
  normal_board_no INTEGER      NOT NULL COMMENT '소통게시글번호' -- 소통게시글번호
)
COMMENT '소통게시글사진';

-- 소통게시글사진
ALTER TABLE nm_board_photo3
  ADD CONSTRAINT PK_nm_board_photo3 -- 소통게시글사진 기본키
    PRIMARY KEY (
      board_photo_no -- 소통게시글사진번호
    );

ALTER TABLE nm_board_photo3
  MODIFY COLUMN board_photo_no INTEGER NOT NULL AUTO_INCREMENT COMMENT '소통게시글사진번호';

ALTER TABLE nm_board_photo3
  AUTO_INCREMENT = 1;

-- 소통게시판좋아요
CREATE TABLE nm_normal_board_like (
  member_no       INTEGER NOT NULL COMMENT '회원번호', -- 회원번호
  normal_board_no INTEGER NOT NULL COMMENT '소통게시글번호' -- 소통게시글번호
)
COMMENT '소통게시판좋아요';

-- 소통게시판좋아요
ALTER TABLE nm_normal_board_like
  ADD CONSTRAINT PK_nm_normal_board_like -- 소통게시판좋아요 기본키
    PRIMARY KEY (
      member_no,       -- 회원번호
      normal_board_no  -- 소통게시글번호
    );

-- 알림
CREATE TABLE nm_notify (
  member_no       INTEGER NOT NULL COMMENT '회원번호', -- 회원번호
  notice_board_no INTEGER NOT NULL COMMENT '공지사항번호', -- 공지사항번호
  plan_board_no   INTEGER NOT NULL COMMENT '일정번호', -- 일정번호
  feed_no         INTEGER NOT NULL COMMENT '피드게시글번호' -- 피드게시글번호
)
COMMENT '알림';

-- 알림
ALTER TABLE nm_notify
  ADD CONSTRAINT PK_nm_notify -- 알림 기본키
    PRIMARY KEY (
      member_no,       -- 회원번호
      notice_board_no, -- 공지사항번호
      plan_board_no,   -- 일정번호
      feed_no          -- 피드게시글번호
    );

-- 일정
CREATE TABLE nm_plan (
  plan_board_no INTEGER      NOT NULL COMMENT '일정번호', -- 일정번호
  group_no      INTEGER      NULL     COMMENT '모임번호', -- 모임번호
  plan_date     DATE         NOT NULL COMMENT '일자', -- 일자
  title         VARCHAR(255) NOT NULL COMMENT '제목', -- 제목
  place_name    VARCHAR(255) NULL     COMMENT '장소명', -- 장소명
  address       VARCHAR(255) NOT NULL COMMENT '주소', -- 주소
  latitude      INTEGER      NULL     COMMENT '위도', -- 위도
  longitude     INTEGER      NULL     COMMENT '경도' -- 경도
)
COMMENT '일정';

-- 일정
ALTER TABLE nm_plan
  ADD CONSTRAINT PK_nm_plan -- 일정 기본키
    PRIMARY KEY (
      plan_board_no -- 일정번호
    );

ALTER TABLE nm_plan
  MODIFY COLUMN plan_board_no INTEGER NOT NULL AUTO_INCREMENT COMMENT '일정번호';

ALTER TABLE nm_plan
  AUTO_INCREMENT = 1;

-- 일정참여자
CREATE TABLE nm_schedule_member (
  plan_board_no INTEGER NOT NULL COMMENT '일정번호', -- 일정번호
  member_no     INTEGER NOT NULL COMMENT '회원번호', -- 회원번호
  group_no      INTEGER NOT NULL COMMENT '모임번호' -- 모임번호
)
COMMENT '일정참여자';

-- 일정참여자
ALTER TABLE nm_schedule_member
  ADD CONSTRAINT PK_nm_schedule_member -- 일정참여자 기본키
    PRIMARY KEY (
      plan_board_no, -- 일정번호
      member_no,     -- 회원번호
      group_no       -- 모임번호
    );

-- 피드게시글
CREATE TABLE nm_feed (
  feed_no     INTEGER      NOT NULL COMMENT '피드게시글번호', -- 피드게시글번호
  member_no   INTEGER      NULL     COMMENT '회원번호', -- 회원번호
  group_no    INTEGER      NULL     COMMENT '모임번호', -- 모임번호
  title       VARCHAR(255) NOT NULL COMMENT '제목', -- 제목
  content     TEXT         NOT NULL COMMENT '내용', -- 내용
  create_date DATETIME     NOT NULL DEFAULT now() COMMENT '작성일' -- 작성일
)
COMMENT '피드게시글';

-- 피드게시글
ALTER TABLE nm_feed
  ADD CONSTRAINT PK_nm_feed -- 피드게시글 기본키
    PRIMARY KEY (
      feed_no -- 피드게시글번호
    );

ALTER TABLE nm_feed
  MODIFY COLUMN feed_no INTEGER NOT NULL AUTO_INCREMENT COMMENT '피드게시글번호';

ALTER TABLE nm_feed
  AUTO_INCREMENT = 1;

-- 피드게시글댓글
CREATE TABLE nm_reply3 (
  reply_no  INTEGER NOT NULL COMMENT '댓글번호', -- 댓글번호
  content   TEXT    NOT NULL COMMENT '댓글내용', -- 댓글내용
  feed_no   INTEGER NOT NULL COMMENT '피드게시글번호', -- 피드게시글번호
  member_no INTEGER NULL     COMMENT '회원번호' -- 회원번호
)
COMMENT '피드게시글댓글';

-- 피드게시글댓글
ALTER TABLE nm_reply3
  ADD CONSTRAINT PK_nm_reply3 -- 피드게시글댓글 기본키
    PRIMARY KEY (
      reply_no -- 댓글번호
    );

ALTER TABLE nm_reply3
  MODIFY COLUMN reply_no INTEGER NOT NULL AUTO_INCREMENT COMMENT '댓글번호';

ALTER TABLE nm_reply3
  AUTO_INCREMENT = 1;

-- 피드게시글사진
CREATE TABLE nm_board_photo (
  board_photo_no INTEGER      NOT NULL COMMENT '피드게시글사진번호', -- 피드게시글사진번호
  photo_file     VARCHAR(255) NOT NULL COMMENT '사진파일', -- 사진파일
  feed_no        INTEGER      NULL     COMMENT '피드게시글번호' -- 피드게시글번호
)
COMMENT '피드게시글사진';

-- 피드게시글사진
ALTER TABLE nm_board_photo
  ADD CONSTRAINT PK_nm_board_photo -- 피드게시글사진 기본키
    PRIMARY KEY (
      board_photo_no -- 피드게시글사진번호
    );

ALTER TABLE nm_board_photo
  MODIFY COLUMN board_photo_no INTEGER NOT NULL AUTO_INCREMENT COMMENT '피드게시글사진번호';

ALTER TABLE nm_board_photo
  AUTO_INCREMENT = 1;

-- 회계
CREATE TABLE nm_account (
  assets          INTEGER      NOT NULL COMMENT '잔액', -- 잔액
  group_no        INTEGER      NULL     COMMENT '모임번호', -- 모임번호
  amount          INTEGER      NOT NULL COMMENT '금액', -- 금액
  payment_date    DATE         NOT NULL COMMENT '거래일', -- 거래일
  account_type_no INTEGER      NOT NULL COMMENT '회계유형번호', -- 회계유형번호
  remarks         TEXT         NULL     COMMENT '비고', -- 비고
  receipt_photo   VARCHAR(255) NULL     COMMENT '영수증사진' -- 영수증사진
)
COMMENT '회계';

-- 회계
ALTER TABLE nm_account
  ADD CONSTRAINT PK_nm_account -- 회계 기본키
    PRIMARY KEY (
      assets -- 잔액
    );

-- 회계권한
CREATE TABLE TABLE (
  zccount_authority_no INTEGER NOT NULL COMMENT '회계권한번호', -- 회계권한번호
  group_no             INTEGER NOT NULL COMMENT '모임번호', -- 모임번호
  authority_no         INTEGER NOT NULL COMMENT '사용권한번호', -- 사용권한번호
  grade_no             INTEGER NOT NULL COMMENT '등급번호' -- 등급번호
)
COMMENT '회계권한';

-- 회계권한
ALTER TABLE TABLE
  ADD CONSTRAINT PK_TABLE -- 회계권한 기본키
    PRIMARY KEY (
      zccount_authority_no -- 회계권한번호
    );

-- 회계권한 유니크 인덱스
CREATE UNIQUE INDEX UIX_TABLE
  ON TABLE ( -- 회계권한
    group_no ASC,     -- 모임번호
    authority_no ASC, -- 사용권한번호
    grade_no ASC      -- 등급번호
  );

-- 회계유형
CREATE TABLE nm_account_type (
  account_type_no   INTEGER      NOT NULL COMMENT '회계유형번호', -- 회계유형번호
  account_type_name VARCHAR(255) NOT NULL COMMENT '유형명' -- 유형명
)
COMMENT '회계유형';

-- 회계유형
ALTER TABLE nm_account_type
  ADD CONSTRAINT PK_nm_account_type -- 회계유형 기본키
    PRIMARY KEY (
      account_type_no -- 회계유형번호
    );

-- 회원
CREATE TABLE nm_members (
  member_no      INTEGER      NOT NULL COMMENT '회원번호', -- 회원번호
  member_name    VARCHAR(50)  NOT NULL COMMENT '이름', -- 이름
  id_photo       VARCHAR(255) NULL     COMMENT '썸네일', -- 썸네일
  birthday       DATE         NOT NULL COMMENT '생년월일', -- 생년월일
  gender         BOOLEAN      NOT NULL COMMENT '성별', -- 성별
  email          VARCHAR(40)  NOT NULL COMMENT '이메일', -- 이메일
  tel            VARCHAR(30)  NOT NULL COMMENT '휴대폰번호', -- 휴대폰번호
  password       VARCHAR(20)  NOT NULL COMMENT '비밀번호', -- 비밀번호
  intro          TEXT         NOT NULL COMMENT '한줄소개', -- 한줄소개
  interest       INTEGER      NOT NULL COMMENT '관심사', -- 관심사
  nickname       VARCHAR(50)  NOT NULL COMMENT '닉네임', -- 닉네임
  account_status INTEGER      NOT NULL COMMENT '상태', -- 상태
  withdraw       INTEGER      NOT NULL COMMENT '회원탈퇴', -- 회원탈퇴
  sns            VARCHAR(255) NULL     COMMENT 'sns' -- sns
)
COMMENT '회원';

-- 회원
ALTER TABLE nm_members
  ADD CONSTRAINT PK_nm_members -- 회원 기본키
    PRIMARY KEY (
      member_no -- 회원번호
    );

-- 회원 유니크 인덱스
CREATE UNIQUE INDEX UIX_nm_members
  ON nm_members ( -- 회원
    tel ASC -- 휴대폰번호
  );

ALTER TABLE nm_members
  MODIFY COLUMN member_no INTEGER NOT NULL AUTO_INCREMENT COMMENT '회원번호';

ALTER TABLE nm_members
  AUTO_INCREMENT = 1;

-- 공지권한
ALTER TABLE TABLE3
  ADD CONSTRAINT FK_TABLE2_TO_TABLE3 -- 사용권한 -> 공지권한
    FOREIGN KEY (
      authority_no -- 사용권한번호
    )
    REFERENCES TABLE2 ( -- 사용권한
      authority_no -- 사용권한번호
    );

-- 공지권한
ALTER TABLE TABLE3
  ADD CONSTRAINT FK_nm_grade_TO_TABLE3 -- 등급 -> 공지권한
    FOREIGN KEY (
      grade_no -- 등급번호
    )
    REFERENCES nm_grade ( -- 등급
      grade_no -- 등급번호
    );

-- 공지권한
ALTER TABLE TABLE3
  ADD CONSTRAINT FK_nm_group_TO_TABLE3 -- 모임 -> 공지권한
    FOREIGN KEY (
      group_no -- 모임번호
    )
    REFERENCES nm_group ( -- 모임
      group_no -- 모임번호
    );

-- 공지사항게시글
ALTER TABLE nm_notices_board
  ADD CONSTRAINT FK_nm_group_TO_nm_notices_board -- 모임 -> 공지사항게시글
    FOREIGN KEY (
      group_no -- 모임번호
    )
    REFERENCES nm_group ( -- 모임
      group_no -- 모임번호
    );

-- 공지사항게시글
ALTER TABLE nm_notices_board
  ADD CONSTRAINT FK_nm_meeting_member_TO_nm_notices_board -- 모임회원 -> 공지사항게시글
    FOREIGN KEY (
      group_no,  -- 모임번호
      member_no  -- 회원번호
    )
    REFERENCES nm_meeting_member ( -- 모임회원
      group_no,  -- 모임번호
      member_no  -- 회원번호
    );

-- 공지사항댓글
ALTER TABLE nm_reply
  ADD CONSTRAINT FK_nm_notices_board_TO_nm_reply -- 공지사항게시글 -> 공지사항댓글
    FOREIGN KEY (
      notice_board_no -- 공지사항번호
    )
    REFERENCES nm_notices_board ( -- 공지사항게시글
      notice_board_no -- 공지사항번호
    );

-- 공지사항댓글
ALTER TABLE nm_reply
  ADD CONSTRAINT FK_nm_members_TO_nm_reply -- 회원 -> 공지사항댓글
    FOREIGN KEY (
      member_no -- 회원번호
    )
    REFERENCES nm_members ( -- 회원
      member_no -- 회원번호
    );

-- 공지사항사진
ALTER TABLE nm_board_photo2
  ADD CONSTRAINT FK_nm_notices_board_TO_nm_board_photo2 -- 공지사항게시글 -> 공지사항사진
    FOREIGN KEY (
      notice_board_no -- 공지사항번호
    )
    REFERENCES nm_notices_board ( -- 공지사항게시글
      notice_board_no -- 공지사항번호
    );

-- 메시지
ALTER TABLE nm_message
  ADD CONSTRAINT FK_nm_members_TO_nm_message -- 회원 -> 메시지
    FOREIGN KEY (
      sender -- 발신자
    )
    REFERENCES nm_members ( -- 회원
      member_no -- 회원번호
    );

-- 메시지
ALTER TABLE nm_message
  ADD CONSTRAINT FK_nm_members_TO_nm_message2 -- 회원 -> 메시지2
    FOREIGN KEY (
      receiver -- 수신자
    )
    REFERENCES nm_members ( -- 회원
      member_no -- 회원번호
    );

-- 모임회원
ALTER TABLE nm_meeting_member
  ADD CONSTRAINT FK_nm_members_TO_nm_meeting_member -- 회원 -> 모임회원
    FOREIGN KEY (
      member_no -- 회원번호
    )
    REFERENCES nm_members ( -- 회원
      member_no -- 회원번호
    );

-- 모임회원
ALTER TABLE nm_meeting_member
  ADD CONSTRAINT FK_nm_group_TO_nm_meeting_member -- 모임 -> 모임회원
    FOREIGN KEY (
      group_no -- 모임번호
    )
    REFERENCES nm_group ( -- 모임
      group_no -- 모임번호
    );

-- 모임회원
ALTER TABLE nm_meeting_member
  ADD CONSTRAINT FK_nm_grade_TO_nm_meeting_member -- 등급 -> 모임회원
    FOREIGN KEY (
      grade_no -- 등급번호
    )
    REFERENCES nm_grade ( -- 등급
      grade_no -- 등급번호
    );

-- 소통게시글
ALTER TABLE nm_communication_board
  ADD CONSTRAINT FK_nm_members_TO_nm_communication_board -- 회원 -> 소통게시글
    FOREIGN KEY (
      member_no -- 회원번호
    )
    REFERENCES nm_members ( -- 회원
      member_no -- 회원번호
    );

-- 소통게시글댓글
ALTER TABLE nm_reply2
  ADD CONSTRAINT FK_nm_communication_board_TO_nm_reply2 -- 소통게시글 -> 소통게시글댓글
    FOREIGN KEY (
      normal_board_no -- 소통게시글번호
    )
    REFERENCES nm_communication_board ( -- 소통게시글
      normal_board_no -- 소통게시글번호
    );

-- 소통게시글댓글
ALTER TABLE nm_reply2
  ADD CONSTRAINT FK_nm_members_TO_nm_reply2 -- 회원 -> 소통게시글댓글
    FOREIGN KEY (
      member_no -- 회원번호
    )
    REFERENCES nm_members ( -- 회원
      member_no -- 회원번호
    );

-- 소통게시글사진
ALTER TABLE nm_board_photo3
  ADD CONSTRAINT FK_nm_communication_board_TO_nm_board_photo3 -- 소통게시글 -> 소통게시글사진
    FOREIGN KEY (
      normal_board_no -- 소통게시글번호
    )
    REFERENCES nm_communication_board ( -- 소통게시글
      normal_board_no -- 소통게시글번호
    );

-- 소통게시판좋아요
ALTER TABLE nm_normal_board_like
  ADD CONSTRAINT FK_nm_members_TO_nm_normal_board_like -- 회원 -> 소통게시판좋아요
    FOREIGN KEY (
      member_no -- 회원번호
    )
    REFERENCES nm_members ( -- 회원
      member_no -- 회원번호
    );

-- 소통게시판좋아요
ALTER TABLE nm_normal_board_like
  ADD CONSTRAINT FK_nm_communication_board_TO_nm_normal_board_like -- 소통게시글 -> 소통게시판좋아요
    FOREIGN KEY (
      normal_board_no -- 소통게시글번호
    )
    REFERENCES nm_communication_board ( -- 소통게시글
      normal_board_no -- 소통게시글번호
    );

-- 알림
ALTER TABLE nm_notify
  ADD CONSTRAINT FK_nm_members_TO_nm_notify -- 회원 -> 알림
    FOREIGN KEY (
      member_no -- 회원번호
    )
    REFERENCES nm_members ( -- 회원
      member_no -- 회원번호
    );

-- 알림
ALTER TABLE nm_notify
  ADD CONSTRAINT FK_nm_notices_board_TO_nm_notify -- 공지사항게시글 -> 알림
    FOREIGN KEY (
      notice_board_no -- 공지사항번호
    )
    REFERENCES nm_notices_board ( -- 공지사항게시글
      notice_board_no -- 공지사항번호
    );

-- 알림
ALTER TABLE nm_notify
  ADD CONSTRAINT FK_nm_plan_TO_nm_notify -- 일정 -> 알림
    FOREIGN KEY (
      plan_board_no -- 일정번호
    )
    REFERENCES nm_plan ( -- 일정
      plan_board_no -- 일정번호
    );

-- 알림
ALTER TABLE nm_notify
  ADD CONSTRAINT FK_nm_feed_TO_nm_notify -- 피드게시글 -> 알림
    FOREIGN KEY (
      feed_no -- 피드게시글번호
    )
    REFERENCES nm_feed ( -- 피드게시글
      feed_no -- 피드게시글번호
    );

-- 일정
ALTER TABLE nm_plan
  ADD CONSTRAINT FK_nm_group_TO_nm_plan -- 모임 -> 일정
    FOREIGN KEY (
      group_no -- 모임번호
    )
    REFERENCES nm_group ( -- 모임
      group_no -- 모임번호
    );

-- 일정참여자
ALTER TABLE nm_schedule_member
  ADD CONSTRAINT FK_nm_meeting_member_TO_nm_schedule_member -- 모임회원 -> 일정참여자
    FOREIGN KEY (
      group_no,  -- 모임번호
      member_no  -- 회원번호
    )
    REFERENCES nm_meeting_member ( -- 모임회원
      group_no,  -- 모임번호
      member_no  -- 회원번호
    );

-- 일정참여자
ALTER TABLE nm_schedule_member
  ADD CONSTRAINT FK_nm_plan_TO_nm_schedule_member -- 일정 -> 일정참여자
    FOREIGN KEY (
      plan_board_no -- 일정번호
    )
    REFERENCES nm_plan ( -- 일정
      plan_board_no -- 일정번호
    );

-- 피드게시글
ALTER TABLE nm_feed
  ADD CONSTRAINT FK_nm_group_TO_nm_feed -- 모임 -> 피드게시글
    FOREIGN KEY (
      group_no -- 모임번호
    )
    REFERENCES nm_group ( -- 모임
      group_no -- 모임번호
    );

-- 피드게시글
ALTER TABLE nm_feed
  ADD CONSTRAINT FK_nm_meeting_member_TO_nm_feed -- 모임회원 -> 피드게시글
    FOREIGN KEY (
      group_no,  -- 모임번호
      member_no  -- 회원번호
    )
    REFERENCES nm_meeting_member ( -- 모임회원
      group_no,  -- 모임번호
      member_no  -- 회원번호
    );

-- 피드게시글댓글
ALTER TABLE nm_reply3
  ADD CONSTRAINT FK_nm_feed_TO_nm_reply3 -- 피드게시글 -> 피드게시글댓글
    FOREIGN KEY (
      feed_no -- 피드게시글번호
    )
    REFERENCES nm_feed ( -- 피드게시글
      feed_no -- 피드게시글번호
    );

-- 피드게시글댓글
ALTER TABLE nm_reply3
  ADD CONSTRAINT FK_nm_members_TO_nm_reply3 -- 회원 -> 피드게시글댓글
    FOREIGN KEY (
      member_no -- 회원번호
    )
    REFERENCES nm_members ( -- 회원
      member_no -- 회원번호
    );

-- 피드게시글사진
ALTER TABLE nm_board_photo
  ADD CONSTRAINT FK_nm_feed_TO_nm_board_photo -- 피드게시글 -> 피드게시글사진
    FOREIGN KEY (
      feed_no -- 피드게시글번호
    )
    REFERENCES nm_feed ( -- 피드게시글
      feed_no -- 피드게시글번호
    );

-- 회계
ALTER TABLE nm_account
  ADD CONSTRAINT FK_nm_account_type_TO_nm_account -- 회계유형 -> 회계
    FOREIGN KEY (
      account_type_no -- 회계유형번호
    )
    REFERENCES nm_account_type ( -- 회계유형
      account_type_no -- 회계유형번호
    );

-- 회계
ALTER TABLE nm_account
  ADD CONSTRAINT FK_nm_group_TO_nm_account -- 모임 -> 회계
    FOREIGN KEY (
      group_no -- 모임번호
    )
    REFERENCES nm_group ( -- 모임
      group_no -- 모임번호
    );

-- 회계권한
ALTER TABLE TABLE
  ADD CONSTRAINT FK_nm_group_TO_TABLE -- 모임 -> 회계권한
    FOREIGN KEY (
      group_no -- 모임번호
    )
    REFERENCES nm_group ( -- 모임
      group_no -- 모임번호
    );

-- 회계권한
ALTER TABLE TABLE
  ADD CONSTRAINT FK_TABLE2_TO_TABLE -- 사용권한 -> 회계권한
    FOREIGN KEY (
      authority_no -- 사용권한번호
    )
    REFERENCES TABLE2 ( -- 사용권한
      authority_no -- 사용권한번호
    );

-- 회계권한
ALTER TABLE TABLE
  ADD CONSTRAINT FK_nm_grade_TO_TABLE -- 등급 -> 회계권한
    FOREIGN KEY (
      grade_no -- 등급번호
    )
    REFERENCES nm_grade ( -- 등급
      grade_no -- 등급번호
    );