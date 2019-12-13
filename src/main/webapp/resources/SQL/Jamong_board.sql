-- 게시판 테이블
CREATE TABLE board(
bo_no NUMBER(38) PRIMARY KEY, 		-- 게시판 번호 (seq)
bo_title VARCHAR2(200) NOT NULL, 	-- 제목
bo_subtitle VARCHAR2(100),          -- 소제목(부제)
bo_cont CLOB NOT NULL,    			-- 내용  ※CLOB이 간혹 셀렉트에러가 있다고함
bo_thumbnail VARCHAR2(200),         -- 썸네일 이미지 or 색상
bo_hit NUMBER(38) DEFAULT 0, 		-- 조회수
bo_date DATE, 						-- 작성일
bo_editdate DATE, 					-- 수정일
bo_lock NUMBER(38),          		-- 공개여부 / 비공개 0, 공개 1
bo_type NUMBER(38),                 -- 글타입 설정 / 칼럼 0, 에세이 1
bo_like NUMBER(38) DEFAULT 0, 		-- 추천 (좋아요)
book_order NUMBER(38), 				-- 책으로 묶었을때 순서
cat_no NUMBER(38),					-- 카테고리 테이블 시퀀스 참조
mem_no NUMBER(38),					-- 회원 테이블 시퀀스 참조
book_no NUMBER(38) 				    -- 책 테이블 시퀀스 참조
);

-- 게시판 번호 시퀀스
CREATE SEQUENCE bo_no_seq
START WITH 0
INCREMENT BY 1
MINVALUE 0
NOCACHE;


-- 카테고리 테이블 참조컬럼 생성
ALTER TABLE board
ADD CONSTRAINT bo_cat_no_fk FOREIGN KEY(cat_no)
REFERENCES category(cat_no)

-- 회원 테이블 참조컬럼 생성
ALTER TABLE board
ADD CONSTRAINT bo_mem_no_fk FOREIGN KEY(mem_no)
REFERENCES member(mem_no)

-- 책 테이블 참조컬럼 생성
ALTER TABLE book
ADD CONSTRAINT bo_book_no_fk FOREIGN KEY(book_no)
REFERENCES book(book_no)

SELECT * FROM board ORDER BY bo_no DESC;
SELECT bo_no_seq.nextval FROM DUAL;

SELECT *
FROM board b
RIGHT JOIN (SELECT * FROM member ORDER BY DBMS_RANDOM.RANDOM)m
ON b.mem_no=m.mem_no
WHERE rowNum <= 9
