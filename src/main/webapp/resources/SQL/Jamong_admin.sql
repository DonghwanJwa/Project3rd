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

select * from jamong_admin;