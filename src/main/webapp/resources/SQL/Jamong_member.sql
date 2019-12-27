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
mem_state NUMBER(38) DEFAULT 0, 	  -- 가입회원, 정지회원, 탈퇴회원 구분 0,1,2
profile_photo VARCHAR2(200) NOT NULL, -- 프로필사진 경로
profile_cont VARCHAR2(4000), -- 프로필 내용
mem_nickname VARCHAR2(100) UNIQUE,    -- 회원 닉네임(필명, 예명)
mem_keyword VARCHAR2(400), 		 	  -- 작가 키워드 ※ 카테고리아님
mem_fav1 VARCHAR2(50), 				  -- 관심 카테고리 (선호하는 장르 선택)
mem_fav2 VARCHAR2(50),
mem_fav3 VARCHAR2(50),
mem_portfolio CLOB,		  			  -- 작가 포트폴리오 내용 (12/03 추가)
drop_reason VARCHAR2(50), -- 회원 탈퇴사유 종류 (12/19 추가)
drop_cont VARCHAR2(4000), -- 회원 탈퇴사유 내용
drop_date DATE       -- 회원 탈퇴 날짜 (12/19 추가)
);

DROP table member;
DROP SEQUENCE mem_no_seq;

SELECT * FROM member ORDER BY mem_no DESC;
update member set mem_state=9 where mem_no=2;
-- 회원번호 시퀀스 생성
CREATE SEQUENCE mem_no_seq
START WITH 0
INCREMENT BY 1
MINVALUE 0
NOCACHE;

SELECT mem_no_seq.nextval FROM DUAL;

update member 
set mem_Withdrawal_reason='테스트입니다',mem_state=2,mem_Withdrawal_reason_date=sysdate 
where mem_no=28

-- 회원 테이블에 작가 포트폴리오 내용 추가
ALTER member ADD (mem_portflio CLOB);
ALTER table member ADD (drop_reason VARCHAR2(50));
ALTER table member ADD (drop_cont VARCHAR2(4000));
ALTER table member ADD (drop_date DATE);


select * from(
    select * from member
    order by DBMS_RANDOM.RANDOM
) where rownum < 10;

update member set mem_state=9 where mem_no=15;

SELECT *
FROM board b
RIGHT JOIN member m
ON b.mem_no=m.mem_no;

SELECT *
FROM board b
RIGHT JOIN (SELECT * FROM member ORDER BY DBMS_RANDOM.RANDOM) m
ON b.mem_no=m.mem_no
WHERE rowNum <= 9;

commit;
SELECT * FROM member ORDER BY mem_no DESC;

update member set mem_state=0