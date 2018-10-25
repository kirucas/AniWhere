
/* Drop Tables */

DROP TABLE notice CASCADE CONSTRAINTS;
DROP TABLE qna CASCADE CONSTRAINTS;
DROP TABLE admin_member CASCADE CONSTRAINTS;
DROP TABLE drafting CASCADE CONSTRAINTS;
DROP TABLE mating CASCADE CONSTRAINTS;
DROP TABLE animal CASCADE CONSTRAINTS;
DROP TABLE market_buy_cmt CASCADE CONSTRAINTS;
DROP TABLE market_buy CASCADE CONSTRAINTS;
DROP TABLE group_buy CASCADE CONSTRAINTS;
DROP TABLE market_group_buy_cmt CASCADE CONSTRAINTS;
DROP TABLE market_group_buy CASCADE CONSTRAINTS;
DROP TABLE market_sell_cmt CASCADE CONSTRAINTS;
DROP TABLE market_sell CASCADE CONSTRAINTS;
DROP TABLE miss_find_cmt CASCADE CONSTRAINTS;
DROP TABLE miss_find CASCADE CONSTRAINTS;
DROP TABLE miss_see_cmt CASCADE CONSTRAINTS;
DROP TABLE miss_see CASCADE CONSTRAINTS;
DROP TABLE animal_category CASCADE CONSTRAINTS;
DROP TABLE freeboard_cmt CASCADE CONSTRAINTS;
DROP TABLE freeboard CASCADE CONSTRAINTS;
DROP TABLE lost_animal CASCADE CONSTRAINTS;
DROP TABLE movie_cmt CASCADE CONSTRAINTS;
DROP TABLE movie CASCADE CONSTRAINTS;
DROP TABLE photo_cmt CASCADE CONSTRAINTS;
DROP TABLE photo_link CASCADE CONSTRAINTS;
DROP TABLE photo CASCADE CONSTRAINTS;
DROP TABLE quest_cmt CASCADE CONSTRAINTS;
DROP TABLE quest CASCADE CONSTRAINTS;
DROP TABLE reservation CASCADE CONSTRAINTS;
DROP TABLE tip_cmt CASCADE CONSTRAINTS;
DROP TABLE tip CASCADE CONSTRAINTS;
DROP TABLE member CASCADE CONSTRAINTS;
DROP TABLE store_category CASCADE CONSTRAINTS;
DROP TABLE store_location CASCADE CONSTRAINTS;




/* Create Tables */

CREATE TABLE admin_member
(
	am_no number NOT NULL,
	am_id varchar2(20) NOT NULL,
	am_pw varchar2(20) NOT NULL,
	am_level number(1) NOT NULL,
	am_profile_link varchar2(300) NOT NULL,
	PRIMARY KEY (am_no)
);


CREATE TABLE animal
(
	ani_no number NOT NULL,
	mem_no number,
	ani_name nvarchar2(20) NOT NULL,
	ani_age number NOT NULL,
	ani_gender varchar2(1) NOT NULL CHECK (ani_gender IN ('F', 'M', 'U')),
	ani_species nvarchar2(10) NOT NULL,
	ani_kind nvarchar2(20) NOT NULL,
	ani_pic nvarchar2(500) NOT NULL,
	PRIMARY KEY (ani_no)
);


CREATE TABLE animal_category
(
	animal_code number NOT NULL,
	animal_name nvarchar2(20) NOT NULL,
	PRIMARY KEY (animal_code)
);


CREATE TABLE drafting
(
	dtf_no number NOT NULL,
	send_no number NOT NULL,
	receive_no number NOT NULL,
	apply number(1),
	dtf_date date DEFAULT SYSDATE,
	PRIMARY KEY (dtf_no)
);


CREATE TABLE freeboard
(
	free_no number NOT NULL,
	mem_no number,
	free_title nvarchar2(50) NOT NULL,
	free_content nvarchar2(2000) NOT NULL,
	free_hit number DEFAULT 0,
	free_regidate date DEFAULT sysdate,
	free_count number DEFAULT 0,
	free_category nvarchar2(2) NOT NULL,
	PRIMARY KEY (free_no)
);


CREATE TABLE freeboard_cmt
(
	cmt_no number NOT NULL,
	origin_no number NOT NULL,
	mem_no number,
	cmt_content nvarchar2(200) NOT NULL,
	hit number,
	regidate date DEFAULT sysdate,
	PRIMARY KEY (cmt_no)
);


CREATE TABLE group_buy
(
	buy_no number NOT NULL,
	no number NOT NULL,
	mem_no number,
	buy_count number NOT NULL,
	PRIMARY KEY (buy_no)
);


CREATE TABLE lost_animal
(
	no number NOT NULL,
	place nvarchar2(150) NOT NULL,
	kind nvarchar2(100) NOT NULL,
	start_notice date NOT NULL,
	end_notice date NOT NULL,
	img_src nvarchar2(200) NOT NULL,
	gender varchar2(1) NOT NULL CHECK (gender IN ('F', 'M', 'Q')),
	neuter varchar2(1) CHECK (neuter IN ('Y', 'N', 'U')),
	addr nvarchar2(250) NOT NULL,
	careNm nvarchar2(50) NOT NULL,
	careTel nvarchar2(20) NOT NULL,
	chargeNm nvarchar2(20),
	PRIMARY KEY (no)
);


CREATE TABLE market_buy
(
	no number NOT NULL,
	mem_no number,
	animal_code number NOT NULL,
	title nvarchar2(50) NOT NULL,
	content nvarchar2(2000) NOT NULL,
	regidate date DEFAULT sysdate,
	count number DEFAULT 0,
	PRIMARY KEY (no)
);


CREATE TABLE market_buy_cmt
(
	cmt_no number NOT NULL,
	origin_no number NOT NULL,
	mem_no number,
	cmt_content nvarchar2(200) NOT NULL,
	hit number DEFAULT 0,
	regidate date DEFAULT sysdate,
	PRIMARY KEY (cmt_no)
);


CREATE TABLE market_group_buy
(
	no number NOT NULL,
	mem_no number,
	animal_code number NOT NULL,
	title nvarchar2(50) NOT NULL,
	content nvarchar2(2000) NOT NULL,
	regidate date DEFAULT sysdate,
	count number DEFAULT 0,
	goal number NOT NULL,
	deadline date NOT NULL,
	PRIMARY KEY (no)
);


CREATE TABLE market_group_buy_cmt
(
	cmt_no number NOT NULL,
	origin_no number NOT NULL,
	mem_no number,
	cmt_content nvarchar2(200) NOT NULL,
	hit number DEFAULT 0,
	regidate date DEFAULT sysdate,
	PRIMARY KEY (cmt_no)
);


CREATE TABLE market_sell
(
	no number NOT NULL,
	mem_no number,
	animal_code number NOT NULL,
	title nvarchar2(50) NOT NULL,
	content nvarchar2(2000) NOT NULL,
	regidate date DEFAULT sysdate,
	count number DEFAULT 0,
	PRIMARY KEY (no)
);


CREATE TABLE market_sell_cmt
(
	cmt_no number NOT NULL,
	origin_no number NOT NULL,
	mem_no number,
	cmt_content nvarchar2(200) NOT NULL,
	hit number DEFAULT 0,
	regidate date DEFAULT sysdate,
	PRIMARY KEY (cmt_no)
);


CREATE TABLE mating
(
	mating_no number NOT NULL,
	ani_no number,
	mating_loc number NOT NULL,
	mating_regidate date DEFAULT SYSDATE,
	PRIMARY KEY (mating_no)
);


CREATE TABLE member
(
	mem_no number NOT NULL,
	mem_id varchar2(20) NOT NULL,
	mem_pw varchar2(20) NOT NULL,
	mem_name nvarchar2(20) NOT NULL,
	mem_nickname nvarchar2(10) NOT NULL UNIQUE,
	mem_gender varchar2(1) NOT NULL CHECK (mem_gender IN ('F', 'M', 'U')),
	mem_birth date,
	mem_loc number NOT NULL,
	mem_log number NOT NULL,
	mem_interani varchar2(6) NOT NULL,
	PRIMARY KEY (mem_no)
);


CREATE TABLE miss_find
(
	no number NOT NULL,
	mem_no number,
	animal_code number NOT NULL,
	title nvarchar2(50) NOT NULL,
	content nvarchar2(2000) NOT NULL,
	regidate date DEFAULT sysdate,
	count number DEFAULT 0,
	PRIMARY KEY (no)
);


CREATE TABLE miss_find_cmt
(
	cmt_no number NOT NULL,
	origin_no number NOT NULL,
	mem_no number,
	cmt_content nvarchar2(200) NOT NULL,
	hit number DEFAULT 0,
	regidate date DEFAULT sysdate,
	PRIMARY KEY (cmt_no)
);


CREATE TABLE miss_see
(
	no number NOT NULL,
	mem_no number,
	animal_code number NOT NULL,
	title nvarchar2(50) NOT NULL,
	content nvarchar2(2000) NOT NULL,
	regidate date DEFAULT sysdate,
	count number DEFAULT 0,
	PRIMARY KEY (no)
);


CREATE TABLE miss_see_cmt
(
	cmt_no number NOT NULL,
	origin_no number NOT NULL,
	mem_no number,
	cmt_content nvarchar2(200) NOT NULL,
	hit number DEFAULT 0,
	regidate date DEFAULT sysdate,
	PRIMARY KEY (cmt_no)
);


CREATE TABLE movie
(
	movie_no number NOT NULL,
	mem_no number,
	movie_title nvarchar2(50) NOT NULL,
	movie_content nvarchar2(2000) NOT NULL,
	movie_count number DEFAULT 0,
	movie_hit number DEFAULT 0,
	movie_regidate date DEFAULT SYSDATE,
	ani_category number(1) CHECK (ani_category IN (1, 2, 3, 4, 5)),
	PRIMARY KEY (movie_no)
);


CREATE TABLE movie_cmt
(
	cmt_no number NOT NULL,
	origin_no number NOT NULL,
	mem_no number,
	cmt_content nvarchar2(200) NOT NULL,
	hit number DEFAULT 0,
	regidate date DEFAULT SYSDATE,
	PRIMARY KEY (cmt_no)
);


CREATE TABLE notice
(
	no number NOT NULL,
	am_no number,
	title nvarchar2(50) NOT NULL,
	content nvarchar2(2000) NOT NULL,
	regidate date DEFAULT SYSDATE,
	count number DEFAULT 0,
	PRIMARY KEY (no)
);


CREATE TABLE photo
(
	photo_no number NOT NULL,
	mem_no number,
	photo_title nvarchar2(50) NOT NULL,
	photo_content nvarchar2(2000) NOT NULL,
	photo_count number DEFAULT 0,
	photo_hit number DEFAULT 0,
	photo_regidate date DEFAULT SYSDATE,
	ani_category number(1) NOT NULL CHECK (ani_category IN (1, 2, 3, 4, 5)),
	PRIMARY KEY (photo_no)
);


CREATE TABLE photo_cmt
(
	cmt_no number NOT NULL,
	origin_no number NOT NULL,
	mem_no number,
	cmt_content nvarchar2(200) NOT NULL,
	hit number DEFAULT 0,
	regidate date DEFAULT SYSDATE,
	PRIMARY KEY (cmt_no)
);


CREATE TABLE photo_link
(
	link_no number NOT NULL,
	photo_no number NOT NULL,
	link nvarchar2(300) NOT NULL,
	PRIMARY KEY (link_no)
);


CREATE TABLE qna
(
	no number NOT NULL,
	mem_no number,
	title nvarchar2(50) NOT NULL,
	quest_ct nvarchar2(2000) NOT NULL,
	quest_date date DEFAULT SYSDATE,
	am_no number,
	answer_ct nvarchar2(2000),
	answer_date date,
	PRIMARY KEY (no)
);


CREATE TABLE quest
(
	quest_no number NOT NULL,
	mem_no number,
	quest_title nvarchar2(50) NOT NULL,
	quest_content nvarchar2(2000) NOT NULL,
	quest_count number DEFAULT 0,
	quest_hit number DEFAULT 0,
	quest_regidate date DEFAULT SYSDATE,
	origin_no number NOT NULL,
	checking number(1) DEFAULT 0 NOT NULL CHECK (checking IN (0, 1)),
	ani_category number(1) NOT NULL CHECK (ani_category IN (1, 2, 3, 4, 5)),
	PRIMARY KEY (quest_no)
);


CREATE TABLE quest_cmt
(
	cmt_no number NOT NULL,
	origin_no number NOT NULL,
	mem_no number,
	cmt_content nvarchar2(200) NOT NULL,
	hit number DEFAULT 0,
	regidate date DEFAULT SYSDATE,
	PRIMARY KEY (cmt_no)
);


CREATE TABLE reservation
(
	rv_no number NOT NULL,
	mem_no number,
	store_no number NOT NULL,
	apply_date date DEFAULT sysdate,
	booking_date date NOT NULL,
	PRIMARY KEY (rv_no)
);


CREATE TABLE store_category
(
	store_no number NOT NULL,
	store_code varchar2(20) NOT NULL,
	animal_name nvarchar2(20) NOT NULL,
	store_name nvarchar2(30) NOT NULL,
	PRIMARY KEY (store_no)
);


CREATE TABLE store_location
(
	no number NOT NULL,
	bizesId number NOT NULL,
	bizesNm nvarchar2(150) NOT NULL,
	brchNm nvarchar2(70),
	indsSclsCd varchar2(10) NOT NULL,
	indsSclsNm nvarchar2(50) NOT NULL,
	lnoAdr nvarchar2(150) NOT NULL,
	rdnmAdr nvarchar2(150) NOT NULL,
	lon number NOT NULL,
	lat number NOT NULL,
	dongNo nvarchar2(20),
	flrNo nvarchar2(20),
	hoNo nvarchar2(20),
	PRIMARY KEY (no)
);


CREATE TABLE tip
(
	tip_no number NOT NULL,
	mem_no number,
	tip_title nvarchar2(50) NOT NULL,
	tip_content nvarchar2(2000) NOT NULL,
	tip_count number DEFAULT 0,
	tip_hit number DEFAULT 0,
	tip_regidate date DEFAULT SYSDATE,
	ani_category number(1) NOT NULL CHECK (ani_category IN (1, 2, 3, 4, 5)),
	PRIMARY KEY (tip_no)
);


CREATE TABLE tip_cmt
(
	cmt_no number NOT NULL,
	origin_no number NOT NULL,
	mem_no number,
	cmt_content nvarchar2(200) NOT NULL,
	hit number DEFAULT 0,
	regidate date DEFAULT SYSDATE,
	PRIMARY KEY (cmt_no)
);



/* Create Foreign Keys */

ALTER TABLE notice
	ADD FOREIGN KEY (am_no)
	REFERENCES admin_member (am_no)
	ON DELETE SET NULL
;


ALTER TABLE qna
	ADD FOREIGN KEY (am_no)
	REFERENCES admin_member (am_no)
	ON DELETE SET NULL
;


ALTER TABLE mating
	ADD FOREIGN KEY (ani_no)
	REFERENCES animal (ani_no)
	ON DELETE CASCADE
;


ALTER TABLE market_buy
	ADD FOREIGN KEY (animal_code)
	REFERENCES animal_category (animal_code)
;


ALTER TABLE market_group_buy
	ADD FOREIGN KEY (animal_code)
	REFERENCES animal_category (animal_code)
;


ALTER TABLE market_sell
	ADD FOREIGN KEY (animal_code)
	REFERENCES animal_category (animal_code)
;


ALTER TABLE miss_find
	ADD FOREIGN KEY (animal_code)
	REFERENCES animal_category (animal_code)
;


ALTER TABLE miss_see
	ADD FOREIGN KEY (animal_code)
	REFERENCES animal_category (animal_code)
;


ALTER TABLE freeboard_cmt
	ADD FOREIGN KEY (origin_no)
	REFERENCES freeboard (free_no)
	ON DELETE CASCADE
;


ALTER TABLE market_buy_cmt
	ADD FOREIGN KEY (origin_no)
	REFERENCES market_buy (no)
	ON DELETE CASCADE
;


ALTER TABLE group_buy
	ADD FOREIGN KEY (no)
	REFERENCES market_group_buy (no)
	ON DELETE CASCADE
;


ALTER TABLE market_group_buy_cmt
	ADD FOREIGN KEY (origin_no)
	REFERENCES market_group_buy (no)
	ON DELETE CASCADE
;


ALTER TABLE market_sell_cmt
	ADD FOREIGN KEY (origin_no)
	REFERENCES market_sell (no)
	ON DELETE CASCADE
;


ALTER TABLE drafting
	ADD FOREIGN KEY (send_no)
	REFERENCES mating (mating_no)
;


ALTER TABLE drafting
	ADD FOREIGN KEY (receive_no)
	REFERENCES mating (mating_no)
	ON DELETE CASCADE
;


ALTER TABLE animal
	ADD FOREIGN KEY (mem_no)
	REFERENCES member (mem_no)
	ON DELETE SET NULL
;


ALTER TABLE freeboard
	ADD FOREIGN KEY (mem_no)
	REFERENCES member (mem_no)
	ON DELETE SET NULL
;


ALTER TABLE freeboard_cmt
	ADD FOREIGN KEY (mem_no)
	REFERENCES member (mem_no)
	ON DELETE SET NULL
;


ALTER TABLE group_buy
	ADD FOREIGN KEY (mem_no)
	REFERENCES member (mem_no)
	ON DELETE SET NULL
;


ALTER TABLE market_buy
	ADD FOREIGN KEY (mem_no)
	REFERENCES member (mem_no)
	ON DELETE SET NULL
;


ALTER TABLE market_buy_cmt
	ADD FOREIGN KEY (mem_no)
	REFERENCES member (mem_no)
	ON DELETE SET NULL
;


ALTER TABLE market_group_buy
	ADD FOREIGN KEY (mem_no)
	REFERENCES member (mem_no)
	ON DELETE SET NULL
;


ALTER TABLE market_group_buy_cmt
	ADD FOREIGN KEY (mem_no)
	REFERENCES member (mem_no)
	ON DELETE SET NULL
;


ALTER TABLE market_sell
	ADD FOREIGN KEY (mem_no)
	REFERENCES member (mem_no)
	ON DELETE SET NULL
;


ALTER TABLE market_sell_cmt
	ADD FOREIGN KEY (mem_no)
	REFERENCES member (mem_no)
	ON DELETE SET NULL
;


ALTER TABLE miss_find
	ADD FOREIGN KEY (mem_no)
	REFERENCES member (mem_no)
	ON DELETE SET NULL
;


ALTER TABLE miss_find_cmt
	ADD FOREIGN KEY (mem_no)
	REFERENCES member (mem_no)
	ON DELETE SET NULL
;


ALTER TABLE miss_see
	ADD FOREIGN KEY (mem_no)
	REFERENCES member (mem_no)
	ON DELETE SET NULL
;


ALTER TABLE miss_see_cmt
	ADD FOREIGN KEY (mem_no)
	REFERENCES member (mem_no)
	ON DELETE SET NULL
;


ALTER TABLE movie
	ADD FOREIGN KEY (mem_no)
	REFERENCES member (mem_no)
	ON DELETE SET NULL
;


ALTER TABLE movie_cmt
	ADD FOREIGN KEY (mem_no)
	REFERENCES member (mem_no)
	ON DELETE SET NULL
;


ALTER TABLE photo
	ADD FOREIGN KEY (mem_no)
	REFERENCES member (mem_no)
	ON DELETE SET NULL
;


ALTER TABLE photo_cmt
	ADD FOREIGN KEY (mem_no)
	REFERENCES member (mem_no)
	ON DELETE SET NULL
;


ALTER TABLE qna
	ADD FOREIGN KEY (mem_no)
	REFERENCES member (mem_no)
	ON DELETE SET NULL
;


ALTER TABLE quest
	ADD FOREIGN KEY (mem_no)
	REFERENCES member (mem_no)
	ON DELETE SET NULL
;


ALTER TABLE quest_cmt
	ADD FOREIGN KEY (mem_no)
	REFERENCES member (mem_no)
	ON DELETE SET NULL
;


ALTER TABLE reservation
	ADD FOREIGN KEY (mem_no)
	REFERENCES member (mem_no)
	ON DELETE SET NULL
;


ALTER TABLE tip
	ADD FOREIGN KEY (mem_no)
	REFERENCES member (mem_no)
	ON DELETE SET NULL
;


ALTER TABLE tip_cmt
	ADD FOREIGN KEY (mem_no)
	REFERENCES member (mem_no)
	ON DELETE SET NULL
;


ALTER TABLE miss_find_cmt
	ADD FOREIGN KEY (origin_no)
	REFERENCES miss_find (no)
	ON DELETE CASCADE
;


ALTER TABLE miss_see_cmt
	ADD FOREIGN KEY (origin_no)
	REFERENCES miss_see (no)
	ON DELETE CASCADE
;


ALTER TABLE movie_cmt
	ADD FOREIGN KEY (origin_no)
	REFERENCES movie (movie_no)
	ON DELETE CASCADE
;


ALTER TABLE photo_cmt
	ADD FOREIGN KEY (origin_no)
	REFERENCES photo (photo_no)
	ON DELETE CASCADE
;


ALTER TABLE photo_link
	ADD FOREIGN KEY (photo_no)
	REFERENCES photo (photo_no)
	ON DELETE CASCADE
;


ALTER TABLE quest_cmt
	ADD FOREIGN KEY (origin_no)
	REFERENCES quest (quest_no)
	ON DELETE CASCADE
;


ALTER TABLE reservation
	ADD FOREIGN KEY (store_no)
	REFERENCES store_location (no)
	ON DELETE CASCADE
;


ALTER TABLE tip_cmt
	ADD FOREIGN KEY (origin_no)
	REFERENCES tip (tip_no)
	ON DELETE CASCADE
;



