-- 작가신청 테이블
CREATE TABLE author(
aut_no NUMBER(38) PRIMARY KEY,     -- 작가신청 번호(seq)
aut_intro VARCHAR2(4000) NOT NULL, -- 작가 소개
aut_plan VARCHAR2(4000) NOT NULL,  -- 작가활동계획
aut_url1 VARCHAR2(200),			   -- 제출 URL
aut_url2 VARCHAR2(200),
aut_url3 VARCHAR2(200),
aut_file1 VARCHAR2(200),		   -- 제출 파일
aut_file2 VARCHAR2(200),
aut_file3 VARCHAR2(200),
aut_date DATE, 					   -- 신청일
mem_no NUMBER(38),  			   -- 회원번호 참조컬럼
aut_state NUMBER(38) DEFAULT 0,    -- 처리결과
aut_update DATE                    -- 처리날짜
);
DROP TABLE author;

-- 시퀀스 생성
CREATE SEQUENCE aut_no_seq
START WITH 0
INCREMENT BY 1
MINVALUE 0
NOCACHE;

select aut_no_seq.nextval from dual;

-- 참조키 설정
ALTER TABLE author
ADD CONSTRAINT aut_mem_no_fk FOREIGN KEY (mem_no)
REFERENCES member(mem_no);

SELECT * FROM author ORDER BY aut_no DESC;

ALTER TABLE author ADD aut_state NUMBER(38) DEFAULT 0;
ALTER TABLE author ADD aut_update DATE;

DROP SEQUENCE aut_no_seq;

DELETE FROM author WHERE aut_no=2;

SELECT * FROM author aut, member m where aut.mem_no=m.mem_no order by aut.aut_date desc;

SELECT * FROM (SELECT rowNum AS rNum,aut_no,aut_intro,aut_plan,aut_url1,aut_url2,aut_url3,aut_file1,aut_file2,aut_file3,aut_date,mem_no,aut_state,aut_update
         FROM (SELECT * FROM author)) aut Inner join member m on aut.mem_no=m.mem_no and m.mem_id like '%tkd%' and aut.rNum >= 1 and aut.rNum <= 9 order by aut.aut_date desc;

SELECT COUNT(aut_no) FROM author aut, member m where aut.mem_no=m.mem_no and aut.mem_no=16;
SELECT COUNT(aut_no) FROM author where mem_no=18 and aut_state=0;

commit;