-- 책 테이블 구성
CREATE TABLE book(
book_no NUMBER(38) PRIMARY KEY,   -- 책 번호(seq)
book_name VARCHAR2(100) NOT NULL, -- 책 이름
book_cover VARCHAR2(2000), -- 책 커버 이미지
book_preface VARCHAR2(4000), -- 책 소개 글
book_date DATE,                   -- 책 발간일
book_editdate DATE,					  -- 책 수정일
cat_name VARCHAR2(50),				  -- 카테고리 참조 컬럼
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
SELECT book_no_seq.nextval FROM DUAL;
ALTER TABLE book DROP (cat_no);
ALTER TABLE book ADD (cat_no NUMBER(38));

SELECT * FROM ALL_CONSTRAINTS WHERE TABLE_NAME = 'book';

DROP TABLE book;
ALTER TABLE book DROP CONSTRAINT book_mem_no_fk;
ALTER TABLE book DROP CONSTRAINT book_fav_no_fk;

SELECT * FROM 
 (SELECT ROWNUM RN, X.* FROM 
 (SELECT * FROM 
 (SELECT bk.book_no,
		 bk.book_name,
		 bk.book_cover,
		 bk.book_preface,
		 bk.book_date,
		 m.mem_id,
		 m.mem_nickname
	FROM book bk 
	INNER JOIN member m
	ON m.mem_no = bk.mem_no
	INNER JOIN board bd
	ON m.mem_no = bd.mem_no AND bk.book_no = bd.book_no 
	WHERE REGEXP_LIKE(bk.book_name,'굿굿|아이디어|스프링|넘바원|오라클|갈배')
	OR REGEXP_LIKE(m.mem_nickname,'굿굿|아이디어|스프링|넘바원|오라클|갈배')
	OR REGEXP_LIKE(bo_title,'굿굿|아이디어|스프링|넘바원|오라클|갈배') 
	OR REGEXP_LIKE(bo_cont,'굿굿|아이디어|스프링|넘바원|오라클|갈배')
	AND m.mem_state = 0
	AND bo_lock=1
	GROUP BY bk.book_no,
		 	 bk.book_name,
		 	 bk.book_cover,
		 	 bk.book_preface,
		 	 bk.book_date,
		     m.mem_id,
		     m.mem_nickname)
	ORDER BY REGEXP_COUNT(book_name,'굿굿|아이디어|스프링|넘바원|오라클|갈배') DESC, 
		 	 REGEXP_COUNT(mem_nickname,'굿굿|아이디어|스프링|넘바원|오라클|갈배') DESC)X)
 WHERE RN BETWEEN 7 AND 13