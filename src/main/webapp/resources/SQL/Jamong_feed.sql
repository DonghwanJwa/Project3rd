-- 피드
CREATE TABLE feed(
feed_no NUMBER(38) PRIMARY KEY,  -- 피드번호 (seq)
feed_state NUMBER(38) DEFAULT 0, -- 확인 유무( 미확인 0, 확인 1) 
feed_step NUMBER(38),			 -- 구분자 ( 팔로우 유저 게시글등록 , 내 게시글 댓글등록, 내 댓글에 답글등록, 문의답변, 작가신청 결과, 팔로우 유저 책발간, 제안을받음 )
feed_mem_id VARCHAR2(50),        -- 링크 띄워주기용 mem_id
feed_mem_no NUMBER(38),          -- 멤버 아이디 ( 피드를 보내줄 회원 )
feed_bo_no NUMBER(38),			 -- 게시글 링크 띄워주기용 bo_no
feed_book_no NUMBER(38),         -- 책 링크 띄워주기용 book_no
feed_date DATE, 				 -- 등록 날짜
mem_no NUMBER(38)    			 -- 멤버 아이디 ( 피드를 보여줄 회원 )
);

-- 구분자 팔로우 유저 게시글등록 1 , 내 게시글 댓글등록 2, 내 댓글에 답글등록 3, 문의답변 4, 작가신청 결과 5, 팔로우 유저 책발간 6, 제안을받음 7)

ALTER TABLE feed ADD feed_mem_no NUMBER(38);

SELECT * FROM feed;

CREATE SEQUENCE feed_no_seq
START WITH 0
INCREMENT BY 1
MINVALUE 0
NOCACHE;

SELECT feed_no_seq.nextval FROM DUAL;

SELECT *
FROM feed f
INNER JOIN member m
ON f.feed_mem_no = m.mem_no
WHERE f.mem_no=1
ORDER BY feed_date DESC;

  SELECT * 
  FROM feed f
  INNER JOIN member m 
  ON f.feed_mem_no=m.mem_no
  WHERE f.mem_no = 28
  ORDER BY feed_date DESC;
  
  SELECT *
  FROM feed f, member m
  WHERE f.mem_no = 28
  ORDER BY feed_date DESC;