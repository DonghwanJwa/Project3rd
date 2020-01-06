-- 구독자 테이블
CREATE TABLE subscribe(
sub_no NUMBER(38) PRIMARY KEY, -- 구독 구분번호(seq)
sub_member NUMBER(38), 		   -- 구독자
mem_no NUMBER(38), 			   -- 회원 참조컬럼(작가)
sub_date DATE				   -- 구독 날짜
);


-- 구독자 시퀀스 생성
CREATE SEQUENCE sub_no_seq
START WITH 0
INCREMENT BY 1
MINVALUE 0
NOCACHE;

DROP TABLE subscribe;
SELECT * FROM subscribe ORDER BY sub_no;
SELECT sub_no_seq.nextval FROM DUAL;

-- 참조키 설정
ALTER TABLE subscribe
ADD CONSTRAINT sub_mem_no_fk FOREIGN KEY (mem_no)
REFERENCES member(mem_no);

