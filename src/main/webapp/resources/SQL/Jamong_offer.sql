-- 제안하기 테이블 구성
CREATE TABLE offer(
off_no NUMBER(38) PRIMARY KEY,
off_id NUMBER(38) NOT NULL,
off_date DATE,
off_item VARCHAR2(50) NOT NULL,
off_cont VARCHAR2(4000) NOT NULL,
off_file1 VARCHAR2(200),
off_file2 VARCHAR2(200),
off_file3 VARCHAR2(200),
off_file4 VARCHAR2(200),
off_file5 VARCHAR2(200),
mem_no NUMBER(38)
);

-- 시퀀스 생성
CREATE SEQUENCE off_no_seq
START WITH 0
INCREMENT BY 1
MINVALUE 0
NOCACHE;

-- 참조키 설정
ALTER TABLE offer
ADD CONSTRAINT off_mem_no_fk FOREIGN KEY (mem_no,off_id)
REFERENCES member(mem_no)

SELECT * FROM offer ORDER BY off_no DESC;