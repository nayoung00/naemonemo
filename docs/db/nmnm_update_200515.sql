-- 공지사항
DROP TABLE IF EXISTS nm_notice RESTRICT;

-- 공지사항댓글
DROP TABLE IF EXISTS nm_notice_reply RESTRICT;

-- 등급
DROP TABLE IF EXISTS nm_grade RESTRICT;

-- 모임
DROP TABLE IF EXISTS nm_group RESTRICT;

-- 모임계좌
DROP TABLE IF EXISTS nm_group_account RESTRICT;

-- 모임회비
DROP TABLE IF EXISTS nm_dues RESTRICT;

-- 모임회원
DROP TABLE IF EXISTS nm_group_member RESTRICT;

-- 소통
DROP TABLE IF EXISTS nm_co RESTRICT;

-- 소통댓글
DROP TABLE IF EXISTS nm_co_reply RESTRICT;

-- 일정
DROP TABLE IF EXISTS nm_plan RESTRICT;

-- 일정참여자
DROP TABLE IF EXISTS nm_plan_member RESTRICT;

-- 첨부파일
DROP TABLE IF EXISTS nm_MP_FILE RESTRICT;

-- 피드
DROP TABLE IF EXISTS nm_feed RESTRICT;

-- 피드댓글
DROP TABLE IF EXISTS nm_feed_reply RESTRICT;

-- 피드사진
DROP TABLE IF EXISTS nm_feed_photo RESTRICT;

-- 회계
DROP TABLE IF EXISTS nm_account RESTRICT;

-- 회원
DROP TABLE IF EXISTS nm_member RESTRICT;

-- 공지사항
CREATE TABLE nm_notice (
    notice_no   INTEGER      NOT NULL COMMENT '공지사항번호', -- 공지사항번호
    group_no    INTEGER      NOT NULL COMMENT '모임번호', -- 모임번호
    member_no   INTEGER      NOT NULL COMMENT '회원번호', -- 회원번호
    title       VARCHAR(255) NOT NULL COMMENT '제목', -- 제목
    content     TEXT         NOT NULL COMMENT '내용', -- 내용
    create_date DATETIME     NOT NULL DEFAULT now() COMMENT '작성일', -- 작성일
    view_count  INTEGER      NOT NULL DEFAULT 0 COMMENT '조회수', -- 조회수
    reg_no      INTEGER      NULL     COMMENT '가입번호' -- 가입번호
)
COMMENT '공지사항';

-- 공지사항
ALTER TABLE nm_notice
    ADD CONSTRAINT PK_nm_notice -- 공지사항 기본키
        PRIMARY KEY (
            notice_no -- 공지사항번호
        );

ALTER TABLE nm_notice
    MODIFY COLUMN notice_no INTEGER NOT NULL AUTO_INCREMENT COMMENT '공지사항번호';

ALTER TABLE nm_notice
    AUTO_INCREMENT = 1;

-- 공지사항댓글
CREATE TABLE nm_notice_reply (
    notice_reply_no INTEGER  NOT NULL COMMENT '공지사항댓글번호', -- 공지사항댓글번호
    content         TEXT     NOT NULL COMMENT '댓글내용', -- 댓글내용
    notice_no       INTEGER  NOT NULL COMMENT '공지사항번호', -- 공지사항번호
    member_no       INTEGER  NOT NULL COMMENT '회원번호', -- 회원번호
    create_date     DATETIME NOT NULL DEFAULT now() COMMENT '작성일' -- 작성일
)
COMMENT '공지사항댓글';

-- 공지사항댓글
ALTER TABLE nm_notice_reply
    ADD CONSTRAINT PK_nm_notice_reply -- 공지사항댓글 기본키
        PRIMARY KEY (
            notice_reply_no -- 공지사항댓글번호
        );

ALTER TABLE nm_notice_reply
    MODIFY COLUMN notice_reply_no INTEGER NOT NULL AUTO_INCREMENT COMMENT '공지사항댓글번호';

ALTER TABLE nm_notice_reply
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

-- 모임
CREATE TABLE nm_group (
    group_no       INTEGER      NOT NULL COMMENT '모임번호', -- 모임번호
    group_name     VARCHAR(255) NOT NULL COMMENT '모임명', -- 모임명
    group_info     TEXT         NOT NULL COMMENT '모임설명', -- 모임설명
    group_form     VARCHAR(20)  NOT NULL DEFAULT '온라인' COMMENT '모임형태', -- 모임형태
    group_interest VARCHAR(50)  NOT NULL COMMENT '모임관심사', -- 모임관심사
    group_photo    VARCHAR(255) NULL     COMMENT '대표이미지', -- 대표이미지
    city           VARCHAR(255) NULL     COMMENT '지역', -- 지역
    max_people_no  INTEGER      NOT NULL DEFAULT 30 COMMENT '최대인원', -- 최대인원
    create_date    DATETIME     NULL     DEFAULT now() COMMENT '모임 생성일' -- 모임 생성일
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

-- 모임계좌
CREATE TABLE nm_group_account (
    bank_info_id        INTEGER     NOT NULL COMMENT '모임계좌아이디', -- 모임계좌아이디
    group_no            INTEGER     NOT NULL COMMENT '모임번호', -- 모임번호
    bank_account_no     VARCHAR(50) NOT NULL DEFAULT 0 COMMENT '계좌번호', -- 계좌번호
    bank_name           VARCHAR(50) NOT NULL COMMENT '은행명', -- 은행명
    bank_account_holder VARCHAR(50) NOT NULL COMMENT '예금주' -- 예금주
)
COMMENT '모임계좌';

-- 모임계좌
ALTER TABLE nm_group_account
    ADD CONSTRAINT PK_nm_group_account -- 모임계좌 기본키
        PRIMARY KEY (
            bank_info_id -- 모임계좌아이디
        );

ALTER TABLE nm_group_account
    MODIFY COLUMN bank_info_id INTEGER NOT NULL AUTO_INCREMENT COMMENT '모임계좌아이디';

ALTER TABLE nm_group_account
    AUTO_INCREMENT = 1;

-- 모임회비
CREATE TABLE nm_dues (
    group_no     INTEGER NOT NULL COMMENT '모임번호', -- 모임번호
    bank_info_id INTEGER NOT NULL COMMENT '모임계좌아이디', -- 모임계좌아이디
    member_no    INTEGER NULL     COMMENT '회원번호', -- 회원번호
    entrance_fee INTEGER NULL     COMMENT '입회비', -- 입회비
    dues_period  TEXT    NOT NULL COMMENT '회비납부주기', -- 회비납부주기
    dues         INTEGER NOT NULL COMMENT '회비금액', -- 회비금액
    reg_no       INTEGER NULL     COMMENT '가입번호' -- 가입번호
)
COMMENT '모임회비';

-- 모임회비
ALTER TABLE nm_dues
    ADD CONSTRAINT PK_nm_dues -- 모임회비 기본키
        PRIMARY KEY (
            group_no,     -- 모임번호
            bank_info_id  -- 모임계좌아이디
        );

-- 모임회원
CREATE TABLE nm_group_member (
    group_no  INTEGER NOT NULL COMMENT '모임번호', -- 모임번호
    reg_no    INTEGER NOT NULL COMMENT '가입번호', -- 가입번호
    member_no INTEGER NOT NULL COMMENT '회원번호', -- 회원번호
    register  TEXT    NOT NULL DEFAULT '가입신청중' COMMENT '가입상태' -- 가입상태
)
COMMENT '모임회원';

-- 모임회원
ALTER TABLE nm_group_member
    ADD CONSTRAINT PK_nm_group_member -- 모임회원 기본키
        PRIMARY KEY (
            group_no,  -- 모임번호
            reg_no,    -- 가입번호
            member_no  -- 회원번호
        );

ALTER TABLE nm_group_member
    MODIFY COLUMN reg_no INTEGER NOT NULL AUTO_INCREMENT COMMENT '가입번호';

ALTER TABLE nm_group_member
    AUTO_INCREMENT = 1;

-- 소통
CREATE TABLE nm_co (
    co_no       INTEGER      NOT NULL COMMENT '소통번호', -- 소통번호
    member_no   INTEGER      NOT NULL COMMENT '회원번호', -- 회원번호
    co_category VARCHAR(255) NULL     COMMENT '글분류', -- 글분류
    title       VARCHAR(255) NOT NULL COMMENT '제목', -- 제목
    content     TEXT         NOT NULL COMMENT '내용', -- 내용
    create_date DATETIME     NULL     DEFAULT now() COMMENT '작성일', -- 작성일
    view_count  INTEGER      NOT NULL DEFAULT 0 COMMENT '조회수' -- 조회수
)
COMMENT '소통';

-- 소통
ALTER TABLE nm_co
    ADD CONSTRAINT PK_nm_co -- 소통 기본키
        PRIMARY KEY (
            co_no -- 소통번호
        );

ALTER TABLE nm_co
    MODIFY COLUMN co_no INTEGER NOT NULL AUTO_INCREMENT COMMENT '소통번호';

ALTER TABLE nm_co
    AUTO_INCREMENT = 1;

-- 소통댓글
CREATE TABLE nm_co_reply (
    co_reply_no INTEGER  NOT NULL COMMENT '소통댓글번호', -- 소통댓글번호
    content     TEXT     NOT NULL COMMENT '댓글내용', -- 댓글내용
    co_no       INTEGER  NOT NULL COMMENT '소통번호', -- 소통번호
    member_no   INTEGER  NOT NULL COMMENT '회원번호', -- 회원번호
    create_date DATETIME NOT NULL DEFAULT now() COMMENT '작성일' -- 작성일
)
COMMENT '소통댓글';

-- 소통댓글
ALTER TABLE nm_co_reply
    ADD CONSTRAINT PK_nm_co_reply -- 소통댓글 기본키
        PRIMARY KEY (
            co_reply_no -- 소통댓글번호
        );

ALTER TABLE nm_co_reply
    MODIFY COLUMN co_reply_no INTEGER NOT NULL AUTO_INCREMENT COMMENT '소통댓글번호';

ALTER TABLE nm_co_reply
    AUTO_INCREMENT = 1;

-- 일정
CREATE TABLE nm_plan (
    plan_no     INTEGER      NOT NULL COMMENT '일정번호', -- 일정번호
    group_no    INTEGER      NULL     COMMENT '모임번호', -- 모임번호
    member_no   INTEGER      NULL     COMMENT '회원번호', -- 회원번호
    start_date  DATETIME     NOT NULL COMMENT '시작일', -- 시작일
    end_date    DATETIME     NOT NULL COMMENT '종료일', -- 종료일
    member_name VARCHAR(20)  NULL     COMMENT '이름', -- 이름
    title       VARCHAR(255) NOT NULL COMMENT '제목', -- 제목
    category    VARCHAR(20)  NULL     COMMENT '카테고리', -- 카테고리
    content     TEXT         NULL     COMMENT '내용', -- 내용
    thumbnail   VARCHAR(255) NULL     COMMENT '썸네일', -- 썸네일
    place_name  VARCHAR(255) NULL     COMMENT '장소명', -- 장소명
    address     VARCHAR(255) NOT NULL COMMENT '주소', -- 주소
    latitude    INTEGER      NULL     COMMENT '위도', -- 위도
    longitude   INTEGER      NULL     COMMENT '경도', -- 경도
    create_date DATETIME     NULL     DEFAULT now() COMMENT '작성일', -- 작성일
    back_color  VARCHAR(20)  NULL     COMMENT '캘린더_배경' -- 캘린더_배경
)
COMMENT '일정';

-- 일정
ALTER TABLE nm_plan
    ADD CONSTRAINT PK_nm_plan -- 일정 기본키
        PRIMARY KEY (
            plan_no -- 일정번호
        );

ALTER TABLE nm_plan
    MODIFY COLUMN plan_no INTEGER NOT NULL AUTO_INCREMENT COMMENT '일정번호';

ALTER TABLE nm_plan
    AUTO_INCREMENT = 1;

-- 일정참여자
CREATE TABLE nm_plan_member (
    member_no   INTEGER     NOT NULL COMMENT '회원번호', -- 회원번호
    plan_no     INTEGER     NOT NULL COMMENT '일정번호', -- 일정번호
    group_no    INTEGER     NOT NULL COMMENT '모임번호', -- 모임번호
    member_name VARCHAR(20) NOT NULL DEFAULT '오승우' COMMENT '회원이름', -- 회원이름
    attend      VARCHAR(10) NOT NULL DEFAULT '불참' COMMENT '참석여부', -- 참석여부
    reg_no      INTEGER     NULL     COMMENT '가입번호' -- 가입번호
)
COMMENT '일정참여자';

-- 첨부파일
CREATE TABLE nm_MP_FILE (
    FILE_NO          INTEGER      NOT NULL COMMENT '파일번호', -- 파일번호
    BNO              INTEGER      NOT NULL COMMENT '게시판번호', -- 게시판번호
    ORG_FILE_NAME    VARCHAR(260) NOT NULL COMMENT '원본파일이름', -- 원본파일이름
    STORED_FILE_NAME VARCHAR(260) NOT NULL COMMENT '변경된파일이름', -- 변경된파일이름
    FILE_SIZE        INTEGER      NULL     COMMENT '파일크기', -- 파일크기
    REGDATE          DATETIME     NOT NULL DEFAULT now() COMMENT '파일등록일', -- 파일등록일
    DEL_GB           TINYINT(1)   NOT NULL DEFAULT 0 COMMENT '삭제구분' -- 삭제구분
)
COMMENT '첨부파일';

-- 첨부파일
ALTER TABLE nm_MP_FILE
    ADD CONSTRAINT PK_nm_MP_FILE -- 첨부파일 기본키
        PRIMARY KEY (
            FILE_NO -- 파일번호
        );

ALTER TABLE nm_MP_FILE
    MODIFY COLUMN FILE_NO INTEGER NOT NULL AUTO_INCREMENT COMMENT '파일번호';

ALTER TABLE nm_MP_FILE
    AUTO_INCREMENT = 1;

-- 피드
CREATE TABLE nm_feed (
    feed_no     INTEGER      NOT NULL COMMENT '피드번호', -- 피드번호
    member_no   INTEGER      NOT NULL COMMENT '회원번호', -- 회원번호
    group_no    INTEGER      NOT NULL COMMENT '모임번호', -- 모임번호
    title       VARCHAR(255) NOT NULL COMMENT '제목', -- 제목
    content     TEXT         NOT NULL COMMENT '내용', -- 내용
    create_date DATETIME     NULL     DEFAULT now() COMMENT '작성일', -- 작성일
    view_count  INTEGER      NOT NULL DEFAULT 0 COMMENT '조회수', -- 조회수
    reg_no      INTEGER      NULL     COMMENT '가입번호' -- 가입번호
)
COMMENT '피드';

-- 피드
ALTER TABLE nm_feed
    ADD CONSTRAINT PK_nm_feed -- 피드 기본키
        PRIMARY KEY (
            feed_no -- 피드번호
        );

ALTER TABLE nm_feed
    MODIFY COLUMN feed_no INTEGER NOT NULL AUTO_INCREMENT COMMENT '피드번호';

ALTER TABLE nm_feed
    AUTO_INCREMENT = 1;

-- 피드댓글
CREATE TABLE nm_feed_reply (
    feed_reply_no INTEGER  NOT NULL COMMENT '피드댓글번호', -- 피드댓글번호
    content       TEXT     NOT NULL COMMENT '댓글내용', -- 댓글내용
    feed_no       INTEGER  NOT NULL COMMENT '피드번호', -- 피드번호
    member_no     INTEGER  NOT NULL COMMENT '회원번호', -- 회원번호
    create_date   DATETIME NOT NULL DEFAULT now() COMMENT '작성일' -- 작성일
)
COMMENT '피드댓글';

-- 피드댓글
ALTER TABLE nm_feed_reply
    ADD CONSTRAINT PK_nm_feed_reply -- 피드댓글 기본키
        PRIMARY KEY (
            feed_reply_no -- 피드댓글번호
        );

ALTER TABLE nm_feed_reply
    MODIFY COLUMN feed_reply_no INTEGER NOT NULL AUTO_INCREMENT COMMENT '피드댓글번호';

ALTER TABLE nm_feed_reply
    AUTO_INCREMENT = 1;

-- 피드사진
CREATE TABLE nm_feed_photo (
    feed_photo_no   INTEGER      NOT NULL COMMENT '피드사진번호', -- 피드사진번호
    feed_photo_file VARCHAR(255) NOT NULL COMMENT '사진파일', -- 사진파일
    feed_no         INTEGER      NULL     COMMENT '피드번호' -- 피드번호
)
COMMENT '피드사진';

-- 피드사진
ALTER TABLE nm_feed_photo
    ADD CONSTRAINT PK_nm_feed_photo -- 피드사진 기본키
        PRIMARY KEY (
            feed_photo_no -- 피드사진번호
        );

ALTER TABLE nm_feed_photo
    MODIFY COLUMN feed_photo_no INTEGER NOT NULL AUTO_INCREMENT COMMENT '피드사진번호';

ALTER TABLE nm_feed_photo
    AUTO_INCREMENT = 1;

-- 회계
CREATE TABLE nm_account (
    account_no         INTEGER      NOT NULL COMMENT '회계번호', -- 회계번호
    group_no           INTEGER      NOT NULL COMMENT '모임번호', -- 모임번호
    bank_info_id       INTEGER      NULL     COMMENT '모임계좌아이디', -- 모임계좌아이디
    account_type_name  VARCHAR(255) NOT NULL COMMENT '회계유형명', -- 회계유형명
    payment_date       DATE         NOT NULL COMMENT '거래일', -- 거래일
    account_connection TEXT         NOT NULL COMMENT '거래처', -- 거래처
    remarks            TEXT         NULL     COMMENT '비고', -- 비고
    deposit            INTEGER      NULL     DEFAULT 0 COMMENT '입금', -- 입금
    withdraw           INTEGER      NULL     DEFAULT 0 COMMENT '출금', -- 출금
    ending_balance     INTEGER      NULL     DEFAULT 0 COMMENT '잔액', -- 잔액
    receipt_photo      VARCHAR(255) NULL     COMMENT '영수증사진' -- 영수증사진
)
COMMENT '회계';

-- 회계
ALTER TABLE nm_account
    ADD CONSTRAINT PK_nm_account -- 회계 기본키
        PRIMARY KEY (
            account_no -- 회계번호
        );

ALTER TABLE nm_account
    MODIFY COLUMN account_no INTEGER NOT NULL AUTO_INCREMENT COMMENT '회계번호';

ALTER TABLE nm_account
    AUTO_INCREMENT = 1;

-- 회원
CREATE TABLE nm_member (
    member_no   INTEGER      NOT NULL COMMENT '회원번호', -- 회원번호
    member_name VARCHAR(50)  NOT NULL COMMENT '이름', -- 이름
    id_photo    VARCHAR(255) NULL     COMMENT '썸네일', -- 썸네일
    birthday    DATE         NULL     COMMENT '생년월일', -- 생년월일
    email       VARCHAR(40)  NOT NULL COMMENT '이메일', -- 이메일
    password    VARCHAR(255) NOT NULL COMMENT '비밀번호', -- 비밀번호
    intro       TEXT         NULL     COMMENT '한줄소개', -- 한줄소개
    interest    VARCHAR(20)  NULL     COMMENT '관심사', -- 관심사
    nickname    VARCHAR(50)  NULL     COMMENT '닉네임', -- 닉네임
    create_date DATETIME     NOT NULL DEFAULT now() COMMENT '가입일', -- 가입일
    userkey     VARCHAR(50)  NULL     COMMENT '인증키', -- 인증키
    auth_status VARCHAR(40)  NOT NULL DEFAULT 'N' COMMENT '상태' -- 상태
)
COMMENT '회원';

-- 회원
ALTER TABLE nm_member
    ADD CONSTRAINT PK_nm_member -- 회원 기본키
        PRIMARY KEY (
            member_no -- 회원번호
        );

-- 회원 유니크 인덱스
CREATE UNIQUE INDEX UIX_nm_member
    ON nm_member ( -- 회원
        email ASC -- 이메일
    );

-- 회원 유니크 인덱스2
CREATE UNIQUE INDEX UIX_nm_member2
    ON nm_member ( -- 회원
        nickname ASC -- 닉네임
    );

ALTER TABLE nm_member
    MODIFY COLUMN member_no INTEGER NOT NULL AUTO_INCREMENT COMMENT '회원번호';

ALTER TABLE nm_member
    AUTO_INCREMENT = 1;

-- 공지사항
ALTER TABLE nm_notice
    ADD CONSTRAINT FK_nm_group_TO_nm_notice -- 모임 -> 공지사항
        FOREIGN KEY (
            group_no -- 모임번호
        )
        REFERENCES nm_group ( -- 모임
            group_no -- 모임번호
        );

-- 공지사항
ALTER TABLE nm_notice
    ADD CONSTRAINT FK_nm_group_member_TO_nm_notice -- 모임회원 -> 공지사항
        FOREIGN KEY (
            group_no,  -- 모임번호
            reg_no,    -- 가입번호
            member_no  -- 회원번호
        )
        REFERENCES nm_group_member ( -- 모임회원
            group_no,  -- 모임번호
            reg_no,    -- 가입번호
            member_no  -- 회원번호
        );

-- 공지사항댓글
ALTER TABLE nm_notice_reply
    ADD CONSTRAINT FK_nm_notice_TO_nm_notice_reply -- 공지사항 -> 공지사항댓글
        FOREIGN KEY (
            notice_no -- 공지사항번호
        )
        REFERENCES nm_notice ( -- 공지사항
            notice_no -- 공지사항번호
        );

-- 공지사항댓글
ALTER TABLE nm_notice_reply
    ADD CONSTRAINT FK_nm_member_TO_nm_notice_reply -- 회원 -> 공지사항댓글
        FOREIGN KEY (
            member_no -- 회원번호
        )
        REFERENCES nm_member ( -- 회원
            member_no -- 회원번호
        );

-- 모임계좌
ALTER TABLE nm_group_account
    ADD CONSTRAINT FK_nm_group_TO_nm_group_account -- 모임 -> 모임계좌
        FOREIGN KEY (
            group_no -- 모임번호
        )
        REFERENCES nm_group ( -- 모임
            group_no -- 모임번호
        );

-- 모임회비
ALTER TABLE nm_dues
    ADD CONSTRAINT FK_nm_group_TO_nm_dues -- 모임 -> 모임회비
        FOREIGN KEY (
            group_no -- 모임번호
        )
        REFERENCES nm_group ( -- 모임
            group_no -- 모임번호
        );

-- 모임회비
ALTER TABLE nm_dues
    ADD CONSTRAINT FK_nm_group_account_TO_nm_dues -- 모임계좌 -> 모임회비
        FOREIGN KEY (
            bank_info_id -- 모임계좌아이디
        )
        REFERENCES nm_group_account ( -- 모임계좌
            bank_info_id -- 모임계좌아이디
        );

-- 모임회비
ALTER TABLE nm_dues
    ADD CONSTRAINT FK_nm_group_member_TO_nm_dues -- 모임회원 -> 모임회비
        FOREIGN KEY (
            group_no,  -- 모임번호
            reg_no,    -- 가입번호
            member_no  -- 회원번호
        )
        REFERENCES nm_group_member ( -- 모임회원
            group_no,  -- 모임번호
            reg_no,    -- 가입번호
            member_no  -- 회원번호
        );

-- 모임회원
ALTER TABLE nm_group_member
    ADD CONSTRAINT FK_nm_member_TO_nm_group_member -- 회원 -> 모임회원
        FOREIGN KEY (
            member_no -- 회원번호
        )
        REFERENCES nm_member ( -- 회원
            member_no -- 회원번호
        );

-- 모임회원
ALTER TABLE nm_group_member
    ADD CONSTRAINT FK_nm_group_TO_nm_group_member -- 모임 -> 모임회원
        FOREIGN KEY (
            group_no -- 모임번호
        )
        REFERENCES nm_group ( -- 모임
            group_no -- 모임번호
        );

-- 소통
ALTER TABLE nm_co
    ADD CONSTRAINT FK_nm_member_TO_nm_co -- 회원 -> 소통
        FOREIGN KEY (
            member_no -- 회원번호
        )
        REFERENCES nm_member ( -- 회원
            member_no -- 회원번호
        );

-- 소통댓글
ALTER TABLE nm_co_reply
    ADD CONSTRAINT FK_nm_co_TO_nm_co_reply -- 소통 -> 소통댓글
        FOREIGN KEY (
            co_no -- 소통번호
        )
        REFERENCES nm_co ( -- 소통
            co_no -- 소통번호
        );

-- 소통댓글
ALTER TABLE nm_co_reply
    ADD CONSTRAINT FK_nm_member_TO_nm_co_reply -- 회원 -> 소통댓글
        FOREIGN KEY (
            member_no -- 회원번호
        )
        REFERENCES nm_member ( -- 회원
            member_no -- 회원번호
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

-- 일정
ALTER TABLE nm_plan
    ADD CONSTRAINT FK_nm_member_TO_nm_plan -- 회원 -> 일정
        FOREIGN KEY (
            member_no -- 회원번호
        )
        REFERENCES nm_member ( -- 회원
            member_no -- 회원번호
        );

-- 일정참여자
ALTER TABLE nm_plan_member
    ADD CONSTRAINT FK_nm_group_member_TO_nm_plan_member -- 모임회원 -> 일정참여자
        FOREIGN KEY (
            group_no,  -- 모임번호
            reg_no,    -- 가입번호
            member_no  -- 회원번호
        )
        REFERENCES nm_group_member ( -- 모임회원
            group_no,  -- 모임번호
            reg_no,    -- 가입번호
            member_no  -- 회원번호
        );

-- 일정참여자
ALTER TABLE nm_plan_member
    ADD CONSTRAINT FK_nm_plan_TO_nm_plan_member -- 일정 -> 일정참여자
        FOREIGN KEY (
            plan_no -- 일정번호
        )
        REFERENCES nm_plan ( -- 일정
            plan_no -- 일정번호
        );

-- 피드
ALTER TABLE nm_feed
    ADD CONSTRAINT FK_nm_group_TO_nm_feed -- 모임 -> 피드
        FOREIGN KEY (
            group_no -- 모임번호
        )
        REFERENCES nm_group ( -- 모임
            group_no -- 모임번호
        );

-- 피드
ALTER TABLE nm_feed
    ADD CONSTRAINT FK_nm_group_member_TO_nm_feed -- 모임회원 -> 피드
        FOREIGN KEY (
            group_no,  -- 모임번호
            reg_no,    -- 가입번호
            member_no  -- 회원번호
        )
        REFERENCES nm_group_member ( -- 모임회원
            group_no,  -- 모임번호
            reg_no,    -- 가입번호
            member_no  -- 회원번호
        );

-- 피드댓글
ALTER TABLE nm_feed_reply
    ADD CONSTRAINT FK_nm_feed_TO_nm_feed_reply -- 피드 -> 피드댓글
        FOREIGN KEY (
            feed_no -- 피드번호
        )
        REFERENCES nm_feed ( -- 피드
            feed_no -- 피드번호
        );

-- 피드댓글
ALTER TABLE nm_feed_reply
    ADD CONSTRAINT FK_nm_member_TO_nm_feed_reply -- 회원 -> 피드댓글
        FOREIGN KEY (
            member_no -- 회원번호
        )
        REFERENCES nm_member ( -- 회원
            member_no -- 회원번호
        );

-- 피드사진
ALTER TABLE nm_feed_photo
    ADD CONSTRAINT FK_nm_feed_TO_nm_feed_photo -- 피드 -> 피드사진
        FOREIGN KEY (
            feed_no -- 피드번호
        )
        REFERENCES nm_feed ( -- 피드
            feed_no -- 피드번호
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

-- 회계
ALTER TABLE nm_account
    ADD CONSTRAINT FK_nm_group_account_TO_nm_account -- 모임계좌 -> 회계
        FOREIGN KEY (
            bank_info_id -- 모임계좌아이디
        )
        REFERENCES nm_group_account ( -- 모임계좌
            bank_info_id -- 모임계좌아이디
        );