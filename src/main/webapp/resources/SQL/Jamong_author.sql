-- 작가신청 테이블
CREATE TABLE author(
aut_no NUMBER(38) PRIMARY KEY,     -- 작가신청 번호(seq)
aut_intro VARCHAR2(4000) NOT NULL, -- 작가 소개
aut_plan VARCHAR2(4000) NOT NULL,  -- 작가활동계획
aut_url1 VARCHAR2(200),			   -- 제출 URL
aut_url2 VARCHAR2(200),
aut_url3 VARCHAR2(200),
aut_file1 VARCHAR2(4000),		   -- 제출 파일
aut_file2 VARCHAR2(4000),
aut_file3 VARCHAR2(4000),
aut_date DATE, 					   -- 신청일
mem_no NUMBER(38),  			   -- 회원번호 참조컬럼
aut_state NUMBER(38) DEFAULT 0,    -- 처리결과
aut_update DATE                    -- 처리날짜
);
DROP TABLE author;
delete author table ;

-- 시퀀스 생성
CREATE SEQUENCE aut_no_seq
START WITH 0
INCREMENT BY 1
MINVALUE 0
NOCACHE;

SELECT * FROM author ORDER BY aut_date DESC;
select aut_no_seq.nextval from dual;
DROP SEQUENCE aut_no_seq

-- 참조키 설정
ALTER TABLE author
ADD CONSTRAINT aut_mem_no_fk FOREIGN KEY (mem_no)
REFERENCES member(mem_no);


