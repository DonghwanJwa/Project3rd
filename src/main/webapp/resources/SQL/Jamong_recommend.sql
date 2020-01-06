-- 추천 테이블 구성
CREATE TABLE recommend(
rec_no NUMBER(38) PRIMARY KEY, -- 추천 번호(seq)
book_no NUMBER(38),			   -- 책번호 참조 컬럼
mem_no NUMBER(38),			   -- 회원번호 참조 컬럼
rec_date DATE				   -- 추천한 날짜
);

-- 시퀀스 생성
CREATE SEQUENCE rec_no_seq
START WITH 0
INCREMENT BY 1
MINVALUE 0
NOCACHE;

SELECT * FROM recommend ORDER BY rec_no;
SELECT rec_no_seq.nextval FROM DUAL

-- 참조키 설정
ALTER TABLE recommend
ADD CONSTRAINT rec_book_no_fk FOREIGN KEY(book_no)
REFERENCES book(book_no)

ALTER TABLE recommend
ADD CONSTRAINT rec_mem_no_fk FOREIGN KEY(mem_no)
REFERENCES member(mem_no)
