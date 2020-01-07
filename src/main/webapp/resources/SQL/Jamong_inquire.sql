-- 문의하기 테이블 구성
CREATE TABLE inquire(
inq_no NUMBER(38) PRIMARY KEY,    -- 문의번호(seq)
inq_item VARCHAR2(100) NOT NULL,  -- 문의 항목
inq_phone VARCHAR2(300) NOT NULL, -- 휴대폰번호
inq_cont VARCHAR2(4000) NOT NULL, -- 문의 내용
inq_email VARCHAR2(500) NOT NULL, -- 이메일
inq_file1 VARCHAR2(200),		  -- 파일
inq_file2 VARCHAR2(200),
inq_file3 VARCHAR2(200),
inq_file4 VARCHAR2(200),
inq_state NUMBER(38) default 0,   -- 처리여부 처리시 1 처리못했을땐 0
inq_reply VARCHAR2(4000),		  -- 문의하기 답변 처리 내용
inq_sender VARCHAR2(100),		  -- 답변한 관리자명
inq_replydate DATE,				  -- 답변날짜
inq_date DATE,					  -- 문의날짜
mem_no NUMBER(38)				  -- 회원번호 참조컬럼 0 비회원 0이아닐시 회원
);



DROP TABLE inquire;
-- 시퀀스 생성
CREATE SEQUENCE inq_no_seq
START WITH 0
INCREMENT BY 1
MINVALUE 0
NOCACHE;

SELECT * FROM inquire ORDER BY inq_no DESC;
SELECT inq_no_seq.nextval FROM DUAL;
DROP SEQUENCE inq_no_seq;
-- 참조키 설정
ALTER TABLE inquire
ADD CONSTRAINT inq_mem_no_fk FOREIGN KEY (mem_no)
REFERENCES member(mem_no)


