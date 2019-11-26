CREATE TABLE accuse(
ac_no NUMBER(38) PRIMARY KEY,     -- 신고번호(seq)
ac_reason VARCHAR2(100) NOT NULL, -- 신고사유
ac_cont VARCHAR2(4000) NOT NULL,  -- 신고 내용
ac_date DATE,					  -- 신고일
ac_item NUMBER(38),				  -- 신고 항목 1-회원, 2-게시글, 3-덧글
ac_result VARCHAR2(50),			  -- 신고 결과
ac_member NUMBER(38),			  -- 신고자 참조 컬럼
mem_no NUMBER(38),				  -- 피신고자 참조 컬럼
bo_no NUMBER(38),				  -- 게시글 참조 컬럼
rep_no NUMBER(38),				  -- 덧글 참조 컬럼
);

CREATE SEQUENCE ac_no_seq
START WITH 0
INCREMENT BY 1
MINVALUE 0
NOCACHE;

-- 참조 컬럼 외래키 설정
ALTER TABLE accuse
ADD CONSTRAINT acc_mem_no_fk FOREIGN KEY(mem_no,ac_member)
REFERENCES member(mem_no)

ALTER TABLE accuse
ADD CONSTRAINT acc_bo_no_fk FOREIGN KEY(bo_no)
REFERENCES board(bo_no)

ALTER TABLE accuse
ADD CONSTRAINT acc_rep_no_fk FOREIGN KEY(rep_no)
REFERENCES reply(rep_no)

SELECT * FROM accuse ORDER BY ac_no DESC;

