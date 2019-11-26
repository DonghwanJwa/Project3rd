-- 문의하기 테이블 구성
CREATE TABLE inquire(
inq_no NUMBER(38) PRIMARY KEY,
inq_item1 VARCHAR2(100) NOT NULL,
inq_item2 VARCHAR2(100) NOT NULL,
inq_phone VARCHAR2(300) NOT NULL,
inq_cont VARCHAR2(4000) NOT NULL,
inq_email VARCHAR2(500) NOT NULL,
inq_file1 VARCHAR2(200),
inq_file2 VARCHAR2(200),
inq_file3 VARCHAR2(200),
inq_file4 VARCHAR2(200),
inq_date DATE,
mem_no NUMBER(38)
);

-- 시퀀스 생성
CREATE SEQUENCE inq_no_seq
START WITH 0
INCREMENT BY 1
MINVALUE 0
NOCACHE;

-- 참조키 설정
ALTER TABLE inquire
ADD CONSTRAINT inq_mem_no_fk FOREIGN KEY (mem_no)
REFERENCES member(mem_no)

SELECT * FROM inquire ORDER BY inq_no DESC;
