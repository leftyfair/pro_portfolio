DROP TABLE T_MEMBER;

-- 회원테이블 생성
CREATE TABLE T_MEMBER(
    MNO INT PRIMARY KEY,
    ID VARCHAR2(10) NOT NULL UNIQUE,
    PWD VARCHAR2(4000),
    NAME VARCHAR2(50),
    EMAIL VARCHAR2(50),
    JOINDATE DATE DEFAULT SYSDATE
);

-- PRIMARY KEY : 기본키
-- VARCHAR2(10) : 문자열 자료형, 길이10(영문10자, 한글3자)
-- DATE : 날짜 자료형,
-- DEFAULT SYSDATE : 날짜를 입력하지않으면 현재 시각으로 설정

-- 시퀀스
DROP SEQUENCE MNO_SEQ;
CREATE SEQUENCE MNO_SEQ;

INSERT INTO T_MEMBER(MNO, ID, PWD, NAME, EMAIL)
VALUES(MNO_SEQ.NEXTVAL, 'kim', '1212', '김범수', 'kim@gmail');
INSERT INTO T_MEMBER(MNO, ID, PWD, NAME, EMAIL)
VALUES(MNO_SEQ.NEXTVAL, 'na', '2345', '나얼', 'na@gmail');
INSERT INTO T_MEMBER(MNO, ID, PWD, NAME, EMAIL)
VALUES(MNO_SEQ.NEXTVAL, 'park', '6666', '박효신', 'park@gmail');

COMMIT;

-- 컬럼 추가
alter table T_MEMBER add GRADE varchar2(30) default 'ROLE_MEMBER';

-- 컬럼 수정
-- update T_MEMBER set grade='ROLE_ADMIN' where id='admin';

SELECT * FROM T_MEMBER;

SELECT GRADE FROM t_member WHERE id='admin';