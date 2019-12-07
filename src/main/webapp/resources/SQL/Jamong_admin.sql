-- 자몽 관리자 페이지
create table jamong_admin (
    adm_id varchar2(30) primary key
    ,adm_pwd varchar2(30) not null
    ,adm_name varchar2(30) not null
    ,adm_phone01 varchar2(20)
    ,adm_phone02 varchar2(20)
    ,adm_phone03 varchar2(20)
    ,adm_email01 varchar2(30)
    ,adm_email02 varchar2(30)
    ,adm_date date
);

select * from jamong_admin where adm_id='aaaa';

insert into jamong_admin values('admin','admin','관리자','010','8379','2298','tkdgjs905','gmail.com',sysdate);

update jamong_admin set adm_pwd = 'test';
commit;


-- 공지사항 테이블
create table adm_notice (
    noti_no number(38) primary key
    ,noti_title varchar2(500) not null
    ,noti_name varchar2(500) not null
    ,noti_pwd varchar2(100) not null
    ,noti_cont varchar2(4000) not null
    ,noti_hit number(38) default 0
    ,noti_date date
);

drop table adm_notice;

select * from adm_notice;
select * from adm_notice order by noti_date desc;

drop sequence adm_noti_seq;

create sequence adm_noti_seq start with 1 increment by 1 nocache;