CREATE TABLE sympathy(
sym_no NUMBER(38) PRIMARY KEY, -- 공감 번호(seq)
bo_no NUMBER(38),			   -- 게시글 번호 참조컬럼
mem_no NUMBER(38),			   -- 회원번호 참조컬럼
sym_date DATE				   -- 공감한 날짜
);

-- 시퀀스 생성
CREATE SEQUENCE sym_no_seq
START WITH 0
INCREMENT BY 1
MINVALUE 0
NOCACHE;

-- 참조키 설정
ALTER TABLE sympathy
ADD CONSTRAINT sym_bo_no_fk FOREIGN KEY(bo_no)
REFERENCES board(bo_no)

ALTER TABLE sympathy
ADD CONSTRAINT sym_mem_no_fk FOREIGN KEY(mem_no)
REFERENCES member(mem_no)

SELECT * FROM sympathy ORDER BY sym_no;
