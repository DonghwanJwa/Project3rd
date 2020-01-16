-- 공지사항 테이블
CREATE TABLE adm_notice (
    noti_no number(38) primary key
    ,noti_title varchar2(500) not null
    ,noti_name varchar2(500) not null
    ,noti_pwd varchar2(100) not null
    ,noti_cont varchar2(4000) not null
    ,noti_hit number(38) default 0
    ,noti_date date
);

CREATE SEQUENCE noti_no_seq
START WITH 0
INCREMENT BY 1
MINVALUE 0
NOCACHE;

SELECT * FROM adm_notice;
SELECT noti_no_seq.nextval FROM DUAL
DROP TABLE adm_notice;
DROP SEQUENCE adm_noti_seq

