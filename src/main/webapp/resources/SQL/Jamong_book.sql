-- 책 테이블 구성
CREATE TABLE book(
book_no NUMBER(38) PRIMARY KEY,   	-- 책 번호(seq)
book_name VARCHAR2(100) NOT NULL, 	-- 책 이름
book_cover VARCHAR2(4000), 		  	-- 책 커버 이미지
book_preface VARCHAR2(4000), 	  	-- 책 소개 글
book_recommend NUMBER(38) DEFAULT 0,-- 책 좋아요
book_date DATE,                   	-- 책 발간일
book_editdate DATE,				  	-- 책 수정일
cat_name VARCHAR2(50),			  	-- 카테고리 참조 컬럼
mem_no NUMBER(38) 				  	-- 회원 참조 컬럼
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
SELECT book_no_seq.nextval FROM DUAL;
ALTER TABLE book DROP (cat_no);
ALTER TABLE book ADD (cat_no NUMBER(38));
ALTER TABLE book ADD book_recommend NUMBER(38) DEFAULT 0;

SELECT * FROM ALL_CONSTRAINTS WHERE TABLE_NAME = 'book';

DROP TABLE book;
ALTER TABLE book DROP CONSTRAINT book_mem_no_fk;
ALTER TABLE book DROP CONSTRAINT book_fav_no_fk;
 
 SELECT book.book_no,
  		 book.book_name,
  		 book.book_cover,
  		 book.book_preface,
  		 book.book_date,
  		 book.book_editdate,
  		 book.cat_name,
  		 book.mem_no,
  		 b.mem_no,
  		 b.book_no,
  		 m.mem_no,
  		 m.mem_id,
  		 m.mem_nickname
  FROM (SELECT * FROM book ORDER BY book_date)book
  INNER JOIN member m,
  ON book.mem_no = m.mem_no
  INNER JOIN board b
  ON b.mem_no = m.mem_no
  WHERE m.mem_no = 3
 WHERE RN BETWEEN 7 AND 13;
 
ALTER TABLE book ADD (book_cover VARCHAR2(4000));
ALTER TABLE book ADD (book_preface VARCHAR2(4000));

