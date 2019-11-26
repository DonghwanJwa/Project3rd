-- 선호 카테고리 테이블
CREATE TABLE favorite(
fav_no NUMBER(38) PRIMARY KEY  -- 카테고리 번호
fav_name VARCHAR2(50) NOT NULL -- 카테고리명
);

-- 카테고리 번호 시퀀스
CREATE SEQUENCE fav_no_seq
START WITH 0
INCREMENT BY 1
MINVALUE 0
NOCACHE;

SELECT * FROM favorite;

