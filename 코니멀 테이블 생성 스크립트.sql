DROP TABLE MEMBER  CASCADE CONSTRAINTS;
DROP TABLE SHELTER  CASCADE CONSTRAINTS;
DROP TABLE BOOKMARK;
DROP TABLE INTRODUCE;
DROP TABLE NOTICE;
DROP TABLE ADOPT;
DROP TABLE VOLUNTEER;
DROP TABLE DONATION;
DROP TABLE ANIMAL CASCADE CONSTRAINTS;
DROP TABLE CUSTOMER;
DROP TABLE C_POST  CASCADE CONSTRAINTS;
DROP TABLE ATTACHMENT;
DROP TABLE MAINPAGE;
DROP TABLE REPLY;
DROP TABLE REPORT_REASON  CASCADE CONSTRAINTS;
DROP TABLE REPORT CASCADE CONSTRAINTS;

CREATE TABLE  MEMBER  (
	 MEM_NO 	NUMBER	PRIMARY KEY,
	 MEM_ID 	VARCHAR2(30) UNIQUE NOT NULL,
	 MEM_PWD 	VARCHAR2(100)	NOT NULL,
	 MEM_NAME 	VARCHAR2(50)	NOT NULL,
	 EMAIL 	VARCHAR2(100),
	 ENROLL_DATE 	DATE DEFAULT SYSDATE,
	 STATUS 	VARCHAR2(1)  DEFAULT 'Y',
	 MEM_CODE 	NUMBER	NOT NULL,
     CONSTRAINT STATUS_CK CHECK (STATUS='Y' OR STATUS='N'),
     CONSTRAINT MEM_CODE_CK CHECK(MEM_CODE IN(1,2,3))
);


CREATE TABLE  SHELTER  (
	 MEM_NO 	NUMBER	PRIMARY KEY,
	 SH_NAME 	VARCHAR2(20)	NOT NULL,
	 SH_PHONE 	VARCHAR2(20)	NOT NULL,
	 SH_ADDRESS 	VARCHAR2(100)	NOT NULL,
	 SH_ABOUT 	VARCHAR2(4000)	NOT NULL,
	 ADMISSION 	VARCHAR2(1) DEFAULT 'N',
	 SH_LOCAL 	VARCHAR2(100)	NOT NULL,
	 REF_TYPE 	VARCHAR2(20) DEFAULT 'SHELTER',
     CONSTRAINT  FK_MEMBER_TO_SHELTER_1  
     FOREIGN KEY (MEM_NO)   REFERENCES  MEMBER  (MEM_NO),
     CONSTRAINT ADMISSION_CK CHECK(ADMISSION='Y' OR ADMISSION='N')
);

CREATE TABLE INTRODUCE (
	INTRO_NO	NUMBER	PRIMARY KEY,
	INTRO_CONTENT	VARCHAR2(1000)	NOT NULL,
	INTRO_TITLE VARCHAR2(40)	NOT NULL,
    REF_TYPE	VARCHAR2(20)	DEFAULT 'INTRO'
);

CREATE TABLE NOTICE (
	NOTICE_NO	NUMBER	PRIMARY KEY,
	NOTICE_MEM	NUMBER	NOT NULL,
	NOTICE_TITLE	VARCHAR2(100)	NOT NULL,
   	NOTICE_CONTENT	VARCHAR2(4000)	NOT NULL,
	NOTICE_DATE	DATE DEFAULT SYSDATE,
	REF_TYPE 	VARCHAR2(20) DEFAULT 'NOTICE',
	 CONSTRAINT  FK_MEMBER_TO_NOTICE_1  
     	 FOREIGN KEY (NOTICE_MEM) REFERENCES  MEMBER (MEM_NO)
);

CREATE TABLE  ADOPT  (
	 ADOPT_NO 	NUMBER	PRIMARY KEY,
	 ADOPT_WRITER 	NUMBER	NOT NULL,
	 MEM_NO 	NUMBER	NOT NULL,
	 ADOPT_TITLE 	VARCHAR2(50)	NOT NULL,
	 ADOPT_CONTENT 	VARCHAR2(4000)	NOT NULL,
	 ADOPT_DATE 	DATE DEFAULT SYSDATE,
	 COUNT 	NUMBER	NOT NULL,
	 REF_TYPE 	VARCHAR2(20) DEFAULT 'ADOPT',
	 CONSTRAINT  FK_MEMBER_TO_ADOPT_1  
     	 FOREIGN KEY (ADOPT_WRITER) REFERENCES  MEMBER (MEM_NO),
	 CONSTRAINT  FK_SHELTER_TO_ADOPT_2  
     	 FOREIGN KEY (MEM_NO) REFERENCES  SHELTER (MEM_NO)
	 
);




CREATE TABLE  VOLUNTEER  (
	 VOL_NO 	NUMBER	PRIMARY KEY,
	 VOL_TITLE 	VARCHAR2(50)	NOT NULL,
	 SPERIOD 	VARCHAR2(100)	NOT NULL,
	 VOL_CONTENT 	VARCHAR2(4000)	NOT NULL,
	 VOL_WRITEDATE 	DATE DEFAULT SYSDATE,
     VOL_COUNT NUMBER,
	 MEM_NO 	NUMBER	NOT NULL,
	 REF_TYPE 	VARCHAR2(20) DEFAULT 'VOLUNTEER',
	 CONSTRAINT  FK_SHELTER_TO_VOLUNTEER 
     	 FOREIGN KEY (MEM_NO) REFERENCES  SHELTER (MEM_NO)
);

CREATE TABLE  DONATION  (
	 DO_NO 	NUMBER	PRIMARY KEY,
	 DO_TITLE 	VARCHAR2(50)	NOT NULL,
	 DO_CONTENT 	VARCHAR2(4000)	NOT NULL,
	 DO_WRITEDATE 	DATE DEFAULT SYSDATE,
	 DO_ADMISSION 	VARCHAR2(1) DEFAULT 'N',
     DO_COUNT NUMBER,
	 MEM_NO 	NUMBER	NOT NULL,
	 REF_TYPE 	VARCHAR2(20) DEFAULT 'DONATION',
 	 CONSTRAINT  FK_SHELTER_TO_DONATION
     FOREIGN KEY (MEM_NO) REFERENCES  SHELTER (MEM_NO),
     CONSTRAINT DO_ADMISSION CHECK (DO_ADMISSION='Y' OR DO_ADMISSION='N')
     
);

CREATE TABLE  ANIMAL  (
	 AN_NO 	NUMBER	PRIMARY KEY,
	 AN_TITLE 	VARCHAR2(100)	NOT NULL,
	 AN_PLACE 	VARCHAR2(100)	NOT NULL,
	 AN_DATE 	VARCHAR2(30)	NOT NULL,
	 AN_SPECIES 	VARCHAR2(100)	NOT NULL,
	 AN_GENDER 	VARCHAR2(100)	NULL,
	 AN_WRITEDATE 	DATE DEFAULT SYSDATE,
	 AN_CONTENT 	VARCHAR2(4000)	NOT NULL,
     AN_COUNT NUMBER,
	 MEM_NO 	NUMBER	NOT NULL,
	 REF_TYPE 	VARCHAR2(20) DEFAULT 'ANIMAL',
	 CONSTRAINT  FK_SHELTER_TO_ANIMAL
     	 FOREIGN KEY (MEM_NO) REFERENCES  SHELTER (MEM_NO)
);

CREATE TABLE  CUSTOMER  (
	 QUE_NO 	NUMBER	PRIMARY KEY,
	 QUE_ID 	NUMBER	NOT NULL,
	 QUE_TITLE 	VARCHAR2(50)	NOT NULL,
	 QUE_CONTENT 	VARCHAR2(4000)	NOT NULL,
	 QUE_DATE 	DATE DEFAULT SYSDATE,
	 ANS_STATUS 	VARCHAR2(1)  DEFAULT 'N',
	 ANS_CONTENT 	VARCHAR2(4000),
	 ANS_DATE 	DATE DEFAULT SYSDATE,
	 CONSTRAINT  FK_MEMBER_TO_CUSTOMER  
         FOREIGN KEY (QUE_ID)   REFERENCES  MEMBER  (MEM_NO),
     CONSTRAINT ANS_STATUS_CK CHECK(ANS_STATUS='N' OR ANS_STATUS='Y')
);

CREATE TABLE  C_POST  (
	 CPOST_NO 	NUMBER	PRIMARY KEY,
	 CUSER_ID 	NUMBER	NOT NULL,
	 CUSER_NAME 	VARCHAR2(30)	NOT NULL,
	 CPOST_TITLE 	VARCHAR2(50)	NOT NULL,
	 CPOST_COUNT 	NUMBER	NOT NULL,
	 CPOST_CONTENT 	VARCHAR2(4000)	NOT NULL,
	 CPOST_DATE 	DATE DEFAULT SYSDATE,
	 REF_TYPE 	VARCHAR2(20) DEFAULT 'POST',
	 CONSTRAINT  FK_MEMBER_TO_C_POST  
     FOREIGN KEY (CUSER_ID)  REFERENCES  MEMBER  (MEM_NO)
);

CREATE TABLE  ATTACHMENT  (
	 FILE_NO 	NUMBER	PRIMARY KEY,
	 REF_TYPE 	VARCHAR2(20) NOT NULL,
	 REF_NO 	NUMBER	NOT NULL,	
	 ORIGIN_NAME 	VARCHAR2(300)	NOT NULL,
	 CHANGE_NAME 	VARCHAR2(300)	NOT NULL,
	 FILE_PATH 	VARCHAR2(1000),
	 UPLOAD_DATE 	DATE	DEFAULT SYSDATE,
	 FILE_LEVEL 	NUMBER,
     CONSTRAINT REF_TYPE_CK 
     CHECK (REF_TYPE IN('INTRO','NOTICE', 'POST', 'ADOPT', 
     'SHELTER', 'VOLUNTEER', 'DONATION', 'ANIMAL','MAINPAGE'))   
);

CREATE TABLE  REPORT_REASON  (
	 REPORT_NO 	NUMBER	PRIMARY KEY,
	 REPORT_REASON 	VARCHAR2(1000)
);
CREATE TABLE  REPORT  (
	 REPORT_NO 	        NUMBER	        PRIMARY KEY,
	 MEM_NO 	        NUMBER	        NOT NULL,
	 REF_BOARD_TYPE 	VARCHAR2(20)	NOT NULL,	
	 REF_BOARD_NO 	    NUMBER	        NOT NULL,
	 REPORT_REASON 	    NUMBER	        NOT NULL,
	 REPORT_DATE 	    DATE	        DEFAULT SYSDATE,
     REF_TYPE           VARCHAR2(20)    DEFAULT 'REPORT',
	 CONSTRAINT  FK_REPORT_REASON_TO_REPORT_1  
     	 FOREIGN KEY (REPORT_REASON) REFERENCES  REPORT_REASON (REPORT_NO),
	 CONSTRAINT  FK_MEMBER_TO_REPORT_2  
     	 FOREIGN KEY (MEM_NO) REFERENCES  MEMBER (MEM_NO)
   
);

CREATE TABLE  MAINPAGE  (
     MAIN_NO 	NUMBER	PRIMARY KEY,
	 MEM_NO 	NUMBER NOT NULL	,
	 REF_TYPE 	VARCHAR2(20) DEFAULT 'MAINPAGE',	
	 MAIN_CONTENT 	VARCHAR2(1000),
     CONSTRAINT  FK_MEMBER_TO_MAINPAGE_1  
     FOREIGN KEY (MEM_NO) REFERENCES  MEMBER (MEM_NO)
);
CREATE TABLE BOOKMARK (
	MEM_NO	NUMBER	NOT NULL,
	BINFO_NO	NUMBER PRIMARY KEY,
	MARK_DATE	DATE DEFAULT SYSDATE,
    CONSTRAINT FK_MEMBER_TO_BOOKMARK_1 
    FOREIGN KEY (MEM_NO) REFERENCES  MEMBER(MEM_NO),
    CONSTRAINT  FK_ANIMAL_TO_BOOKMARK_1  
    FOREIGN KEY (BINFO_NO)REFERENCES  ANIMAL  (AN_NO)
);

CREATE TABLE  REPLY  (
	 RE_NO 	NUMBER	PRIMARY KEY,
	 CPOST_NO 	NUMBER	NOT NULL,
	 MEM_NO 	NUMBER	NOT NULL,
	 CUSER_NAME 	VARCHAR(20)	NOT NULL,
	 WRITTEN_DATE 	DATE	DEFAULT SYSDATE,
	 REPLY_CONTENT 	VARCHAR2(2000)	NOT NULL,
	 CONSTRAINT  FK_MEMBER_TO_REPLY_1  
     	 FOREIGN KEY (MEM_NO) REFERENCES  MEMBER (MEM_NO),
	 CONSTRAINT  FK_C_POST_TO_REPLY_2  
     	 FOREIGN KEY (CPOST_NO) REFERENCES  C_POST (CPOST_NO)
);




COMMENT ON COLUMN ATTACHMENT.REF_NO IS '??????????/??????';
COMMENT ON COLUMN REPORT.REF_BOARD_TYPE IS '????/??????????/????';
COMMENT ON COLUMN REPORT.REF_BOARD_NO IS '????????/??????????????/????????';
COMMENT ON COLUMN MEMBER.STATUS IS '????(Y/N)';
COMMENT ON COLUMN MEMBER.MEM_CODE IS '1:??????,2:??????,3:??????';

COMMENT ON COLUMN BOOKMARK.MEM_NO IS '????????';
COMMENT ON COLUMN BOOKMARK.BINFO_NO IS '??????????';
COMMENT ON COLUMN BOOKMARK.MARK_DATE IS '??????????????';
COMMENT ON COLUMN INTRODUCE.INTRO_NO IS '??????????';
COMMENT ON COLUMN INTRODUCE.INTRO_CONTENT IS '??????????';
COMMENT ON COLUMN INTRODUCE.INTRO_TITLE IS '??????????';
COMMENT ON COLUMN INTRODUCE.REF_TYPE IS '?????? ????';


COMMENT ON COLUMN NOTICE.NOTICE_NO IS '??????????';

COMMENT ON COLUMN NOTICE.NOTICE_MEM IS '??????';

COMMENT ON COLUMN NOTICE.NOTICE_TITLE IS '??????';

COMMENT ON COLUMN NOTICE.NOTICE_CONTENT IS '??????';

COMMENT ON COLUMN NOTICE.NOTICE_DATE IS '??????';

COMMENT ON COLUMN NOTICE.REF_TYPE IS '??????????';



COMMENT ON COLUMN ADOPT.ADOPT_NO IS '??????';

COMMENT ON COLUMN ADOPT.ADOPT_WRITER IS '??????';

COMMENT ON COLUMN ADOPT.MEM_NO IS '??????????';

COMMENT ON COLUMN ADOPT.ADOPT_TITLE IS '????';

COMMENT ON COLUMN ADOPT.ADOPT_CONTENT IS '????';

COMMENT ON COLUMN ADOPT.ADOPT_DATE IS '??????';

COMMENT ON COLUMN ADOPT.COUNT IS '??????';

COMMENT ON COLUMN ADOPT.REF_TYPE IS '??????????';

COMMENT ON COLUMN SHELTER.MEM_NO IS '?????? ????';

COMMENT ON COLUMN SHELTER.SH_NAME IS '?????? ??';

COMMENT ON COLUMN SHELTER.SH_PHONE IS '?????? ??????';

COMMENT ON COLUMN SHELTER.SH_ADDRESS IS '?????? ????';

COMMENT ON COLUMN SHELTER.SH_ABOUT IS '?????? ??????';

COMMENT ON COLUMN SHELTER.ADMISSION IS '????????, ????(Y/N)';

COMMENT ON COLUMN SHELTER.SH_LOCAL IS '??????????';

COMMENT ON COLUMN SHELTER.REF_TYPE IS '?????? ????';



COMMENT ON COLUMN VOLUNTEER.VOL_NO IS '??????????????';

COMMENT ON COLUMN VOLUNTEER.VOL_TITLE IS '???????? ??????';

COMMENT ON COLUMN VOLUNTEER.SPERIOD IS '????????';

COMMENT ON COLUMN VOLUNTEER.VOL_CONTENT IS '????????';

COMMENT ON COLUMN VOLUNTEER.VOL_WRITEDATE IS '??????';

COMMENT ON COLUMN VOLUNTEER.MEM_NO IS '??????????';

COMMENT ON COLUMN VOLUNTEER.REF_TYPE IS '?????? ????';


COMMENT ON COLUMN DONATION.DO_NO IS '??????????';

COMMENT ON COLUMN DONATION.DO_TITLE IS '???? ??????';

COMMENT ON COLUMN DONATION.DO_CONTENT IS '????????';

COMMENT ON COLUMN DONATION.DO_WRITEDATE IS '??????';

COMMENT ON COLUMN DONATION.DO_ADMISSION IS '????????,????(Y/N)';

COMMENT ON COLUMN DONATION.MEM_NO IS '??????????';

COMMENT ON COLUMN DONATION.REF_TYPE IS '?????? ????';



COMMENT ON COLUMN ANIMAL.AN_NO IS '??????????';

COMMENT ON COLUMN ANIMAL.MEM_NO IS '??????';

COMMENT ON COLUMN ANIMAL.AN_TITLE IS '??????';

COMMENT ON COLUMN ANIMAL.AN_PLACE IS '????????';

COMMENT ON COLUMN ANIMAL.AN_DATE IS '????????';

COMMENT ON COLUMN ANIMAL.AN_SPECIES IS '????????';

COMMENT ON COLUMN ANIMAL.AN_GENDER IS '????????';

COMMENT ON COLUMN ANIMAL.AN_WRITEDATE IS '??????';

COMMENT ON COLUMN ANIMAL.AN_CONTENT IS '??????';

COMMENT ON COLUMN ANIMAL.REF_TYPE IS '?????? ????';


COMMENT ON COLUMN MEMBER.MEM_NO IS '????????';

COMMENT ON COLUMN MEMBER.MEM_ID IS '??????';

COMMENT ON COLUMN MEMBER.MEM_PWD IS '????????';

COMMENT ON COLUMN MEMBER.MEM_NAME IS '???? ????';

COMMENT ON COLUMN MEMBER.EMAIL IS '??????';

COMMENT ON COLUMN MEMBER.ENROLL_DATE IS '??????';

COMMENT ON COLUMN MEMBER.STATUS IS '????(Y/N)';

COMMENT ON COLUMN MEMBER.MEM_CODE IS '????????:1 ??????, 2??????, 3??????';



COMMENT ON COLUMN REPORT_REASON.REPORT_NO IS '???? ???? ????';

COMMENT ON COLUMN REPORT_REASON.REPORT_REASON IS '???? ????';

COMMENT ON COLUMN CUSTOMER.QUE_NO IS '???? ????';

COMMENT ON COLUMN CUSTOMER.QUE_ID IS '???? ?????? ??????';

COMMENT ON COLUMN CUSTOMER.QUE_TITLE IS '???? ????';

COMMENT ON COLUMN CUSTOMER.QUE_CONTENT IS '???? ????';

COMMENT ON COLUMN CUSTOMER.QUE_DATE IS '???? ??????';

COMMENT ON COLUMN CUSTOMER.ANS_STATUS IS '???? ????';

COMMENT ON COLUMN CUSTOMER.ANS_CONTENT IS '???? ????';

COMMENT ON COLUMN CUSTOMER.ANS_DATE IS '???? ??????';



COMMENT ON COLUMN C_POST.CPOST_NO IS '??????';

COMMENT ON COLUMN C_POST.CUSER_ID IS '??????';

COMMENT ON COLUMN C_POST.CUSER_NAME IS '??????';

COMMENT ON COLUMN C_POST.CPOST_TITLE IS '??????';

COMMENT ON COLUMN C_POST.CPOST_COUNT IS '??????';

COMMENT ON COLUMN C_POST.CPOST_CONTENT IS '??????';

COMMENT ON COLUMN C_POST.CPOST_DATE IS '??????';

COMMENT ON COLUMN C_POST.REF_TYPE IS '?????? ????';



COMMENT ON COLUMN ATTACHMENT.FILE_NO IS '????????';

COMMENT ON COLUMN ATTACHMENT.REF_TYPE IS '??????????????:INTRO,NOTICE, POST, ADOPT, SHELTER, VOLUNTEER, DONATION, ANIMAL,MAINPAGE';

COMMENT ON COLUMN ATTACHMENT.REF_NO IS '??????????/??????';

COMMENT ON COLUMN ATTACHMENT.ORIGIN_NAME IS '??????????';

COMMENT ON COLUMN ATTACHMENT.CHANGE_NAME IS '??????????';

COMMENT ON COLUMN ATTACHMENT.FILE_PATH IS '????????????';

COMMENT ON COLUMN ATTACHMENT.UPLOAD_DATE IS '?????? ????';

COMMENT ON COLUMN ATTACHMENT.FILE_LEVEL IS '????????';



COMMENT ON COLUMN REPLY.RE_NO IS '????????';

COMMENT ON COLUMN REPLY.CPOST_NO IS '??????';

COMMENT ON COLUMN REPLY.MEM_NO IS '????????';

COMMENT ON COLUMN REPLY.CUSER_NAME IS '??????';

COMMENT ON COLUMN REPLY.WRITTEN_DATE IS '??????';

COMMENT ON COLUMN REPLY.REPLY_CONTENT IS '????????';



COMMENT ON COLUMN REPORT.REPORT_UNIQUE IS '????????????';

COMMENT ON COLUMN REPORT.MEM_NO IS '?????? ????????';

COMMENT ON COLUMN REPORT.REPORT_NO IS '???? ???? ????';

COMMENT ON COLUMN REPORT.REF_TYPE IS '????/??????????/????';

COMMENT ON COLUMN REPORT.REF_NO IS '????????/??????????????/????????';

COMMENT ON COLUMN REPORT.REPORT_DATE IS '???? ????';

COMMENT ON COLUMN MAINPAGE.MEM_NO IS '????????';

COMMENT ON COLUMN MAINPAGE.REF_TYPE IS '??????????';

COMMENT ON COLUMN MAINPAGE.MAIN_NO IS '?????? ????';

COMMENT ON COLUMN MAINPAGE.MAIN_CONTENT IS '?????? ????';



COMMIT;



