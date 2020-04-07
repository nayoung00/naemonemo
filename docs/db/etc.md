-- 테이블 생성할 때

CREATE DATABASE nmnm DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;

ALTER TABLE nm_group convert to charset utf8;
ALTER TABLE nm_members convert to charset utf8;
ALTER TABLE nm_board_photo convert to charset utf8;
ALTER TABLE nm_message convert to charset utf8;
ALTER TABLE nm_notify convert to charset utf8;
ALTER TABLE nm_meeting_board convert to charset utf8;
ALTER TABLE nm_reply convert to charset utf8;
ALTER TABLE nm_notices_board convert to charset utf8;
ALTER TABLE nm_schedule convert to charset utf8;
ALTER TABLE nm_normal_board convert to charset utf8;
ALTER TABLE nm_grade convert to charset utf8;
ALTER TABLE nm_invite convert to charset utf8;
ALTER TABLE nm_account convert to charset utf8;
ALTER TABLE nm_meeting_member convert to charset utf8;
ALTER TABLE nm_account_type convert to charset utf8;
ALTER TABLE nm_board_type convert to charset utf8;
ALTER TABLE nm_board_grade convert to charset utf8;
ALTER TABLE nm_schedule_member convert to charset utf8;
ALTER TABLE nm_normal_board_like convert to charset utf8;
ALTER TABLE nm_meeting_board_like convert to charset utf8;