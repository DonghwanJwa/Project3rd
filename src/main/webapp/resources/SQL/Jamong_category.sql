-- 선호 카테고리 테이블
CREATE TABLE category(
cat_no NUMBER(38) PRIMARY KEY  -- 카테고리 번호
,cat_name VARCHAR2(50) NOT NULL -- 카테고리명
);

SELECT * FROM category;

insert into category values(1,'감성·에세이');
insert into category values(2,'건강·운동');
insert into category values(3,'건축·설계');
insert into category values(4,'글쓰기');
insert into category values(5,'문화·예술');

insert into category values(6,'사진·촬영');
insert into category values(7,'시사·이슈');
insert into category values(8,'심리 탐구');
insert into category values(9,'여행');
insert into category values(10,'영화 리뷰');

insert into category values(11,'요리·레시피');
insert into category values(12,'육아');
insert into category values(13,'음악');
insert into category values(14,'인문학·철학');
insert into category values(15,'IT');

commit;