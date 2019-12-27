-- 게시판 테이블
CREATE TABLE board(
bo_no NUMBER(38) PRIMARY KEY, 		-- 게시판 번호 (seq)
bo_title VARCHAR2(200) NOT NULL, 	-- 제목
bo_subtitle VARCHAR2(100),          -- 소제목(부제)
bo_titlespace NUMBER(38),           -- 타이틀 상하 구분자
bo_cont CLOB NOT NULL,    			-- 내용  ※CLOB이 간혹 셀렉트에러가 있다고함
bo_thumbnail VARCHAR2(200),         -- 썸네일 이미지
bo_color VARCHAR2(100),             -- 썸네일 배경색상
bo_hit NUMBER(38) DEFAULT 0, 		-- 조회수
bo_date DATE, 						-- 작성일
bo_editdate DATE, 					-- 수정일
bo_lock NUMBER(38),          		-- 공개여부 / 비공개 0, 공개 1, 차단2, 삭제 3
bo_type NUMBER(38),                 -- 글타입 설정 / 칼럼 0, 에세이 1
bo_like NUMBER(38) DEFAULT 0, 		-- 추천 (좋아요)
book_order NUMBER(38), 				-- 책으로 묶었을때 순서
cat_name VARCHAR2(50),			-- 카테고리 테이블 시퀀스 참조
mem_no NUMBER(38),					-- 회원 테이블 시퀀스 참조
book_no NUMBER(38) 				    -- 책 테이블 시퀀스 참조
);

-- 게시판 번호 시퀀스
CREATE SEQUENCE bo_no_seq
START WITH 0
INCREMENT BY 1
MINVALUE 0
NOCACHE;

DROP TABLE board
DROP SEQUENCE bo_no_seq

ALTER TABLE board 
ALTER TABLE board ADD cat_name VARCHAR2(50);
ALTER TABLE board DROP ();
ALTER TABLE board ADD bo_thumbnail VARCHAR2(200);
ALTER TABLE board ADD bo_type NUMBER(38);
ALTER TABLE board ADD bo_titlespace NUMBER(38);
ALTER TABLE board ADD bo_color VARCHAR2(100);
commit;
-- 카테고리 테이블 참조컬럼 생성
ALTER TABLE board
ADD CONSTRAINT bo_cat_no_fk FOREIGN KEY(cat_no)
REFERENCES category(cat_no);

-- 회원 테이블 참조컬럼 생성
ALTER TABLE board
ADD CONSTRAINT bo_mem_no_fk FOREIGN KEY(mem_no)
REFERENCES member(mem_no);

-- 책 테이블 참조컬럼 생성
ALTER TABLE book
ADD CONSTRAINT bo_book_no_fk FOREIGN KEY(book_no)
REFERENCES book(book_no);

ALTER TABLE book DROP CONSTRAINT bo_book_no_fk;

SELECT * FROM board ORDER BY bo_no DESC;
SELECT * FROM board ORDER BY book_no DESC;
SELECT bo_no_seq.nextval FROM DUAL;

 UPDATE board SET bo_hit=bo_hit+1 WHERE bo_no=10
 
 SELECT * FROM (SELECT * FROM board ORDER BY DBMS_RANDOM.RANDOM) WHERE mem_no=1 AND rowNum <= 3;

  SELECT *
  FROM (SELECT * FROM board ORDER BY DBMS_RANDOM.RANDOM) b,member m
  WHERE b.mem_no=m.mem_no
  AND b.cat_name='IT' AND rowNum <= 3;
 
SELECT *
FROM board b
RIGHT JOIN (SELECT * FROM member ORDER BY DBMS_RANDOM.RANDOM)m
ON b.mem_no=m.mem_no
WHERE rowNum <= 9;

select * from ALL_CONSTRAINTS WHERE TABLE_NAME='board';

 SELECT *
 FROM board b, member m
 WHERE b.mem_no=m.mem_no
 AND b.bo_no=10;
 
  UPDATE board AS b ,book  AS bo
  SET b.book_no=bo.book_no_seq.nextval, bo.book_name = '이거버그야'
  WHERE b.bo_no=b.bo_no;

 SELECT b.bo_no,
        b.bo_title,
        b.bo_subtitle,
        b.bo_cont,
        b.bo_thumbnail,
        b.bo_date,
        m.mem_id,
        m.mem_nickname,
        m.mem_keyword
  FROM board b
  INNER JOIN member m
  ON b.mem_no=m.mem_no
  WHERE REGEXP_LIKE(b.bo_title,'핫') OR REGEXP_LIKE(b.bo_subtitle,'핫') OR REGEXP_LIKE(b.bo_cont,'핫') 
  OR REGEXP_LIKE(b.cat_name,'핫') OR REGEXP_LIKE(m.mem_nickname,'핫') AND bo_lock=1 AND rowNum <= 10
  ORDER BY REGEXP_COUNT(bo_title,'핫') DESC, REGEXP_COUNT(bo_cont,'핫')
  
  
  SELECT book.book_no,
  		 book.book_name,
  		 book.book_cover,
  		 book.book_preface,
  		 book.book_date,
  		 book.book_editdate,
  		 book.cat_name,
  		 book.mem_no,
  		 b.mem_no,
  		 b.book_no
  FROM (SELECT * FROM book ORDER BY book_no DESC)book
  INNER JOIN board b
  ON b.mem_no = book.mem_no 
  WHERE book.mem_no = 3

  
  SELECT m.mem_no,
    	m.mem_id, 
    	m.mem_author, 
    	m.profile_photo, 
    	m.profile_cont, 
    	m.mem_nickname, 
    	m.mem_keyword, 
    	m.mem_portfolio,
    	b.bo_no,
    	b.bo_title,
    	b.bo_subtitle,
    	b.bo_cont,
    	b.bo_thumbnail,
    	b.bo_hit,
    	b.bo_date,
    	b.bo_editdate,
    	b.bo_lock,
    	b.bo_type,
    	b.bo_like,
    	b.book_order,
    	b.cat_name,
    	b.mem_no,
    	b.book_no
    FROM member m
    INNER JOIN (SELECT * FROM board ORDER BY bo_date DESC)b
 	ON m.mem_no = b.mem_no
    WHERE m.mem_no = 3 AND b.bo_no >= 13 - 10
 