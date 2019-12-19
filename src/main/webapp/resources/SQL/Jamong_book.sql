-- 책 테이블 구성
CREATE TABLE book(
book_no NUMBER(38) PRIMARY KEY,   -- 책 번호(seq)
book_name VARCHAR2(100) NOT NULL, -- 책 이름
book_date DATE,                   -- 책 발간일
book_editdate DATE,					  -- 책 수정일
cat_no NUMBER(38),				  -- 카테고리 참조 컬럼
mem_no NUMBER(38) 				  -- 회원 참조 컬럼
);

-- 참조컬럼 참조키 설정
ALTER TABLE book
ADD CONSTRAINT book_cat_no_fk FOREIGN KEY(cat_no)
REFERENCES category(cat_no)

ALTER TABLE book
ADD CONSTRAINT book_mem_no_fk FOREIGN KEY(mem_no)
REFERENCES member(mem_no)

CREATE SEQUENCE book_no_seq
START WITH 0
INCREMENT BY 1
MINVALUE 0
NOCACHE;

SELECT * FROM book ORDER BY book_no DESC;
ALTER TABLE book DROP (fav_no);
ALTER TABLE book ADD (cat_no NUMBER(38));

  INSERT
  INTO book (book_no,book_name,book_date)
  VALUES (book_no_seq.nextval,'안녕',sysdate);