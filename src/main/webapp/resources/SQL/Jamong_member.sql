-- 회원 테이블 구성
CREATE TABLE member(
mem_no NUMBER(38) PRIMARY KEY,		  -- 회원번호
mem_id VARCHAR2(100) UNIQUE,		  -- 아이디
mem_pwd VARCHAR2(200) NOT NULL,	 	  -- 비밀번호
mem_name VARCHAR2(100) NOT NULL,	  -- 본명(사람이름)
mem_birth1 VARCHAR2(10) NOT NULL,	  -- 생년
mem_birth2 VARCHAR2(10) NOT NULL, 	  -- 월
mem_birth3 VARCHAR2(10) NOT NULL, 	  -- 일
email_id VARCHAR2(50) NOT NULL, 	  -- 이메일 ID
email_domain VARCHAR2(100) NOT NULL,  -- 도메인(주소)
mem_phone01 VARCHAR2(10) NOT NULL, 	  -- 휴대폰번호 첫번째 박스
mem_phone02 VARCHAR2(10) NOT NULL, 	  -- 휴대폰번호 두번째 박스
mem_phone03 VARCHAR2(10) NOT NULL, 	  -- 휴대폰번호 세번째 박스
mem_gender VARCHAR2(10) NOT NULL, 	  -- 성별
mem_date DATE, 						  -- 가입날짜
mem_author NUMBER(38) DEFAULT 0, 	  -- 작가, 비작가 구분
mem_state NUMBER(38) DEFAULT 0, 	  -- 가입회원 0, 정지회원 1, 탈퇴회원 2, 관리자 9
profile_photo VARCHAR2(200) NOT NULL, -- 프로필사진 경로
profile_cont VARCHAR2(4000), 		  -- 프로필 내용
mem_nickname VARCHAR2(100) UNIQUE,    -- 회원 닉네임(필명, 예명)
mem_keyword VARCHAR2(400), 		 	  -- 작가 키워드 ※ 카테고리아님
mem_fav1 VARCHAR2(50), 				  -- 관심 카테고리 (선호하는 장르 선택)
mem_fav2 VARCHAR2(50),
mem_fav3 VARCHAR2(50),
mem_article NUMBER(38) DEFAULT 0,	  -- 게시글 수
mem_subscribe NUMBER(38) DEFAULT 0,	  -- 팔로우(구독자)수
mem_portfolio CLOB,		  			  -- 작가 포트폴리오 내용 (12/03 추가)
drop_cont VARCHAR2(4000), 			  -- 회원 탈퇴사유 내용
drop_date DATE       				  -- 회원 탈퇴 날짜 (12/19 추가)
);


UPDATE member SET mem_state=9 WHERE mem_no=1; -- 관리자 계정 설정
-- 회원번호 시퀀스 생성
CREATE SEQUENCE mem_no_seq
START WITH 0
INCREMENT BY 1
MINVALUE 0
NOCACHE;

ALTER TABLE inquire DROP CONSTRAINT INQ_MEM_NO_fk cascade;

SELECT mem_no_seq.nextval FROM DUAL;
SELECT * FROM member ORDER BY mem_no DESC;
DROP TABLE member;
DROP SEQUENCE mem_no_seq;

 SELECT c.cat_name,COUNT(m.mem_no) count
  FROM member m
  RIGHT OUTER JOIN category c
  ON m.mem_fav1 = c.cat_name OR m.mem_fav2 = c.cat_name OR m.mem_fav3 = c.cat_name
  WHERE m.mem_state = 0 OR m.mem_state = 1
  GROUP BY c.cat_name