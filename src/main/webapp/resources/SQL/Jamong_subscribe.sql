-- 구독자 테이블
CREATE TABLE subscribe(
sub_no NUMBER(38) PRIMARY KEY, -- 구독 구분번호(seq)
sub_member NUMBER(38), 		   -- 구독자
mem_no NUMBER(38), 			   -- 회원 참조컬럼(작가)
sub_date DATE				   -- 구독 날짜
);

DROP table subscribe;

-- 구독자 시퀀스 생성
CREATE SEQUENCE sub_no_seq
START WITH 0
INCREMENT BY 1
MINVALUE 0
NOCACHE;

-- 참조키 설정
ALTER TABLE subscribe
ADD CONSTRAINT sub_mem_no_fk FOREIGN KEY (mem_no)
REFERENCES member(mem_no);

SELECT COUNT(sub_no) FROM subscribe WHERE mem_no = 7

SELECT * FROM subscribe ORDER BY sub_no;
SELECT * FROM subscribe WHERE sub_member=3 AND mem_no=7
SELECT sub_no_seq.nextval FROM DUAL;
DROP TABLE subscribe;
DROP SEQUENCE sub_no_seq;

SELECT COUNT(sub_no) FROM subscribe WHERE mem_no = 7