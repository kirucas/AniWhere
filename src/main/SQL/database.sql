
/* Drop Tables */

DROP TABLE notice CASCADE CONSTRAINTS;
DROP TABLE admin_member CASCADE CONSTRAINTS;
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
DROP TABLE bird_movie_cmt CASCADE CONSTRAINTS;
DROP TABLE bird_movie CASCADE CONSTRAINTS;
DROP TABLE bird_photo_cmt CASCADE CONSTRAINTS;
DROP TABLE bird_photo_link CASCADE CONSTRAINTS;
DROP TABLE bird_photo CASCADE CONSTRAINTS;
DROP TABLE bird_quest_cmt CASCADE CONSTRAINTS;
DROP TABLE bird_quest CASCADE CONSTRAINTS;
DROP TABLE bird_tip_cmt CASCADE CONSTRAINTS;
DROP TABLE bird_tip CASCADE CONSTRAINTS;
DROP TABLE cat_movie_cmt CASCADE CONSTRAINTS;
DROP TABLE cat_movie CASCADE CONSTRAINTS;
DROP TABLE cat_photo_cmt CASCADE CONSTRAINTS;
DROP TABLE cat_photo_link CASCADE CONSTRAINTS;
DROP TABLE cat_photo CASCADE CONSTRAINTS;
DROP TABLE cat_quest_cmt CASCADE CONSTRAINTS;
DROP TABLE cat_quest CASCADE CONSTRAINTS;
DROP TABLE cat_tip_cmt CASCADE CONSTRAINTS;
DROP TABLE cat_tip CASCADE CONSTRAINTS;
DROP TABLE dog_movie_cmt CASCADE CONSTRAINTS;
DROP TABLE dog_movie CASCADE CONSTRAINTS;
DROP TABLE dog_photo_cmt CASCADE CONSTRAINTS;
DROP TABLE dog_photo_link CASCADE CONSTRAINTS;
DROP TABLE dog_photo CASCADE CONSTRAINTS;
DROP TABLE dog_quest_cmt CASCADE CONSTRAINTS;
DROP TABLE dog_quest CASCADE CONSTRAINTS;
DROP TABLE dog_tip_cmt CASCADE CONSTRAINTS;
DROP TABLE dog_tip CASCADE CONSTRAINTS;
DROP TABLE etc_movie_cmt CASCADE CONSTRAINTS;
DROP TABLE etc_movie CASCADE CONSTRAINTS;
DROP TABLE etc_photo_cmt CASCADE CONSTRAINTS;
DROP TABLE etc_photo_link CASCADE CONSTRAINTS;
DROP TABLE etc_photo CASCADE CONSTRAINTS;
DROP TABLE etc_quest_cmt CASCADE CONSTRAINTS;
DROP TABLE etc_quest CASCADE CONSTRAINTS;
DROP TABLE etc_tip_cmt CASCADE CONSTRAINTS;
DROP TABLE etc_tip CASCADE CONSTRAINTS;
DROP TABLE freeboard_cmt CASCADE CONSTRAINTS;
DROP TABLE freeboard CASCADE CONSTRAINTS;
DROP TABLE reservation CASCADE CONSTRAINTS;
DROP TABLE rna_movie_cmt CASCADE CONSTRAINTS;
DROP TABLE rna_movie CASCADE CONSTRAINTS;
DROP TABLE rna_photo_cmt CASCADE CONSTRAINTS;
DROP TABLE rna_photo_link CASCADE CONSTRAINTS;
DROP TABLE rna_photo CASCADE CONSTRAINTS;
DROP TABLE rna_quest_cmt CASCADE CONSTRAINTS;
DROP TABLE rna_quest CASCADE CONSTRAINTS;
DROP TABLE rna_tip_cmt CASCADE CONSTRAINTS;
DROP TABLE rna_tip CASCADE CONSTRAINTS;
DROP TABLE member CASCADE CONSTRAINTS;
DROP TABLE store_category CASCADE CONSTRAINTS;




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
	mem_no number NOT NULL,
	ani_name nvarchar2(20) NOT NULL,
	ani_age number NOT NULL,
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


CREATE TABLE bird_movie
(
	movie_no number NOT NULL,
	mem_no number NOT NULL,
	movie_title nvarchar2(50) NOT NULL,
	movie_count number DEFAULT 0,
	movie_content nvarchar2(2000) NOT NULL,
	movie_hit number DEFAULT 0,
	movie_regidate date DEFAULT sysdate,
	PRIMARY KEY (movie_no)
);


CREATE TABLE bird_movie_cmt
(
	cmt_no number NOT NULL,
	movie_no number NOT NULL,
	mem_no number NOT NULL,
	cmt_content nvarchar2(200) NOT NULL,
	hit number DEFAULT 0,
	regidate date DEFAULT sysdate,
	PRIMARY KEY (cmt_no)
);


CREATE TABLE bird_photo
(
	photo_no number NOT NULL,
	mem_no number NOT NULL,
	photo_count number DEFAULT 0,
	photo_title nvarchar2(50) NOT NULL,
	photo_content nvarchar2(2000) NOT NULL,
	photo_hit number DEFAULT 0,
	photo_regidate date DEFAULT sysdate,
	PRIMARY KEY (photo_no)
);


CREATE TABLE bird_photo_cmt
(
	cmt_no number NOT NULL,
	photo_no number NOT NULL,
	mem_no number NOT NULL,
	cmt_content nvarchar2(200) NOT NULL,
	hit number DEFAULT 0,
	regidate date DEFAULT sysdate,
	PRIMARY KEY (cmt_no)
);


CREATE TABLE bird_photo_link
(
	link_no number NOT NULL,
	photo_no number NOT NULL,
	link nvarchar2(300) NOT NULL,
	PRIMARY KEY (link_no)
);


CREATE TABLE bird_quest
(
	quest_no number NOT NULL,
	mem_no number NOT NULL,
	quest_title nvarchar2(50) NOT NULL,
	quest_content nvarchar2(2000) NOT NULL,
	quest_hit number DEFAULT 0,
	quest_regidate date DEFAULT sysdate,
	quest_count number DEFAULT 0,
	origin_no number DEFAULT 0,
	PRIMARY KEY (quest_no)
);


CREATE TABLE bird_quest_cmt
(
	cmt_no number NOT NULL,
	quest_no number NOT NULL,
	mem_no number NOT NULL,
	cmt_content nvarchar2(200) NOT NULL,
	hit number DEFAULT 0,
	regidate date,
	PRIMARY KEY (cmt_no)
);


CREATE TABLE bird_tip
(
	tip_no number NOT NULL,
	mem_no number NOT NULL,
	tip_title nvarchar2(50) NOT NULL,
	tip_content nvarchar2(2000) NOT NULL,
	tip_count number DEFAULT 0,
	tip_regidate date DEFAULT sysdate,
	tip_hit number DEFAULT 0,
	PRIMARY KEY (tip_no)
);


CREATE TABLE bird_tip_cmt
(
	cmt_no number NOT NULL,
	tip_no number NOT NULL,
	mem_no number NOT NULL,
	cmt_content nvarchar2(200) NOT NULL,
	hit number,
	regidate date DEFAULT sysdate,
	PRIMARY KEY (cmt_no)
);


CREATE TABLE cat_movie
(
	movie_no number NOT NULL,
	mem_no number NOT NULL,
	movie_title nvarchar2(50) NOT NULL,
	movie_count number DEFAULT 0,
	movie_content nvarchar2(2000) NOT NULL,
	movie_hit number DEFAULT 0,
	movie_regidate date DEFAULT sysdate,
	PRIMARY KEY (movie_no)
);


CREATE TABLE cat_movie_cmt
(
	cmt_no number NOT NULL,
	mem_no number NOT NULL,
	movie_no number NOT NULL,
	cmt_content nvarchar2(200) NOT NULL,
	hit number DEFAULT 0,
	regidate date DEFAULT sysdate,
	PRIMARY KEY (cmt_no)
);


CREATE TABLE cat_photo
(
	photo_no number NOT NULL,
	mem_no number NOT NULL,
	photo_count number DEFAULT 0,
	photo_title nvarchar2(50) NOT NULL,
	photo_content nvarchar2(2000) NOT NULL,
	photo_hit number DEFAULT 0,
	photo_regidate date DEFAULT sysdate,
	PRIMARY KEY (photo_no)
);


CREATE TABLE cat_photo_cmt
(
	cmt_no number NOT NULL,
	mem_no number NOT NULL,
	photo_no number NOT NULL,
	cmt_content nvarchar2(200) NOT NULL,
	hit number DEFAULT 0,
	regidate date DEFAULT sysdate,
	PRIMARY KEY (cmt_no)
);


CREATE TABLE cat_photo_link
(
	link_no number NOT NULL,
	photo_no number NOT NULL,
	link nvarchar2(300) NOT NULL,
	PRIMARY KEY (link_no)
);


CREATE TABLE cat_quest
(
	quest_no number NOT NULL,
	mem_no number NOT NULL,
	quest_title nvarchar2(50) NOT NULL,
	quest_content nvarchar2(2000) NOT NULL,
	quest_hit number DEFAULT 0,
	quest_regidate date DEFAULT sysdate,
	quest_count number DEFAULT 0,
	origin_no number DEFAULT 0,
	PRIMARY KEY (quest_no)
);


CREATE TABLE cat_quest_cmt
(
	cmt_no number NOT NULL,
	mem_no number NOT NULL,
	quest_no number NOT NULL,
	cmt_content nvarchar2(200) NOT NULL,
	hit number DEFAULT 0,
	regidate date,
	PRIMARY KEY (cmt_no)
);


CREATE TABLE cat_tip
(
	tip_no number NOT NULL,
	mem_no number NOT NULL,
	tip_title nvarchar2(50) NOT NULL,
	tip_content nvarchar2(2000) NOT NULL,
	tip_count number DEFAULT 0,
	tip_regidate date DEFAULT sysdate,
	tip_hit number DEFAULT 0,
	PRIMARY KEY (tip_no)
);


CREATE TABLE cat_tip_cmt
(
	cmt_no number NOT NULL,
	mem_no number NOT NULL,
	tip_no number NOT NULL,
	cmt_content nvarchar2(200) NOT NULL,
	hit number,
	regidate date DEFAULT sysdate,
	PRIMARY KEY (cmt_no)
);


CREATE TABLE dog_movie
(
	movie_no number NOT NULL,
	mem_no number NOT NULL,
	movie_title nvarchar2(50) NOT NULL,
	movie_count number DEFAULT 0,
	movie_content nvarchar2(2000) NOT NULL,
	movie_hit number DEFAULT 0,
	movie_regidate date DEFAULT sysdate,
	PRIMARY KEY (movie_no)
);


CREATE TABLE dog_movie_cmt
(
	cmt_no number NOT NULL,
	movie_no number NOT NULL,
	mem_no number NOT NULL,
	cmt_content nvarchar2(200) NOT NULL,
	hit number DEFAULT 0,
	regidate date DEFAULT sysdate,
	PRIMARY KEY (cmt_no)
);


CREATE TABLE dog_photo
(
	photo_no number NOT NULL,
	mem_no number NOT NULL,
	photo_count number DEFAULT 0,
	photo_title nvarchar2(50) NOT NULL,
	photo_content nvarchar2(2000) NOT NULL,
	photo_hit number DEFAULT 0,
	photo_regidate date DEFAULT sysdate,
	PRIMARY KEY (photo_no)
);


CREATE TABLE dog_photo_cmt
(
	cmt_no number NOT NULL,
	photo_no number NOT NULL,
	mem_no number NOT NULL,
	cmt_content nvarchar2(200) NOT NULL,
	hit number DEFAULT 0,
	regidate date DEFAULT sysdate,
	PRIMARY KEY (cmt_no)
);


CREATE TABLE dog_photo_link
(
	link_no number NOT NULL,
	link nvarchar2(300) NOT NULL,
	photo_no number NOT NULL,
	PRIMARY KEY (link_no)
);


CREATE TABLE dog_quest
(
	quest_no number NOT NULL,
	mem_no number NOT NULL,
	quest_title nvarchar2(50) NOT NULL,
	quest_content nvarchar2(2000) NOT NULL,
	quest_hit number DEFAULT 0,
	quest_regidate date DEFAULT sysdate,
	quest_count number DEFAULT 0,
	origin_no number DEFAULT 0,
	PRIMARY KEY (quest_no)
);


CREATE TABLE dog_quest_cmt
(
	cmt_no number NOT NULL,
	mem_no number NOT NULL,
	quest_no number NOT NULL,
	cmt_content nvarchar2(200) NOT NULL,
	hit number DEFAULT 0,
	regidate date,
	PRIMARY KEY (cmt_no)
);


CREATE TABLE dog_tip
(
	tip_no number NOT NULL,
	mem_no number NOT NULL,
	tip_title nvarchar2(50) NOT NULL,
	tip_content nvarchar2(2000) NOT NULL,
	tip_count number DEFAULT 0,
	tip_regidate date DEFAULT sysdate,
	tip_hit number DEFAULT 0,
	PRIMARY KEY (tip_no)
);


CREATE TABLE dog_tip_cmt
(
	cmt_no number NOT NULL,
	tip_no number NOT NULL,
	mem_no number NOT NULL,
	cmt_content nvarchar2(200) NOT NULL,
	hit number,
	regidate date DEFAULT sysdate,
	PRIMARY KEY (cmt_no)
);


CREATE TABLE etc_movie
(
	movie_no number NOT NULL,
	mem_no number NOT NULL,
	movie_title nvarchar2(50) NOT NULL,
	movie_count number DEFAULT 0,
	movie_content nvarchar2(2000) NOT NULL,
	movie_hit number DEFAULT 0,
	movie_regidate date DEFAULT sysdate,
	PRIMARY KEY (movie_no)
);


CREATE TABLE etc_movie_cmt
(
	cmt_no number NOT NULL,
	mem_no number NOT NULL,
	movie_no number NOT NULL,
	cmt_content nvarchar2(200) NOT NULL,
	hit number DEFAULT 0,
	regidate date DEFAULT sysdate,
	PRIMARY KEY (cmt_no)
);


CREATE TABLE etc_photo
(
	photo_no number NOT NULL,
	mem_no number NOT NULL,
	photo_count number DEFAULT 0,
	photo_title nvarchar2(50) NOT NULL,
	photo_content nvarchar2(2000) NOT NULL,
	photo_hit number DEFAULT 0,
	photo_regidate date DEFAULT sysdate,
	PRIMARY KEY (photo_no)
);


CREATE TABLE etc_photo_cmt
(
	cmt_no number NOT NULL,
	photo_no number NOT NULL,
	mem_no number NOT NULL,
	cmt_content nvarchar2(200) NOT NULL,
	hit number DEFAULT 0,
	regidate date DEFAULT sysdate,
	PRIMARY KEY (cmt_no)
);


CREATE TABLE etc_photo_link
(
	link_no number NOT NULL,
	photo_no number NOT NULL,
	link nvarchar2(300) NOT NULL,
	PRIMARY KEY (link_no)
);


CREATE TABLE etc_quest
(
	quest_no number NOT NULL,
	mem_no number NOT NULL,
	quest_title nvarchar2(50) NOT NULL,
	quest_content nvarchar2(2000) NOT NULL,
	quest_hit number DEFAULT 0,
	quest_regidate date DEFAULT sysdate,
	quest_count number DEFAULT 0,
	origin_no number DEFAULT 0,
	PRIMARY KEY (quest_no)
);


CREATE TABLE etc_quest_cmt
(
	cmt_no number NOT NULL,
	mem_no number NOT NULL,
	quest_no number NOT NULL,
	cmt_content nvarchar2(200) NOT NULL,
	hit number DEFAULT 0,
	regidate date,
	PRIMARY KEY (cmt_no)
);


CREATE TABLE etc_tip
(
	tip_no number NOT NULL,
	mem_no number NOT NULL,
	tip_title nvarchar2(50) NOT NULL,
	tip_content nvarchar2(2000) NOT NULL,
	tip_count number DEFAULT 0,
	tip_regidate date DEFAULT sysdate,
	tip_hit number DEFAULT 0,
	PRIMARY KEY (tip_no)
);


CREATE TABLE etc_tip_cmt
(
	cmt_no number NOT NULL,
	mem_no number NOT NULL,
	tip_no number NOT NULL,
	cmt_content nvarchar2(200) NOT NULL,
	hit number,
	regidate date DEFAULT sysdate,
	PRIMARY KEY (cmt_no)
);


CREATE TABLE freeboard
(
	free_no number NOT NULL,
	mem_no number NOT NULL,
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
	cmt_content nvarchar2(200) NOT NULL,
	hit number,
	regidate date DEFAULT sysdate,
	free_no number NOT NULL,
	PRIMARY KEY (cmt_no)
);


CREATE TABLE group_buy
(
	buy_no number NOT NULL,
	no number NOT NULL,
	mem_no number NOT NULL,
	buy_count number NOT NULL,
	PRIMARY KEY (buy_no)
);


CREATE TABLE market_buy
(
	no number NOT NULL,
	mem_no number NOT NULL,
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
	no number NOT NULL,
	cmt_content nvarchar2(200) NOT NULL,
	hit number DEFAULT 0,
	regidate date DEFAULT sysdate,
	PRIMARY KEY (cmt_no)
);


CREATE TABLE market_group_buy
(
	no number NOT NULL,
	mem_no number NOT NULL,
	animal_code number NOT NULL,
	title nvarchar2(50) NOT NULL,
	content nvarchar2(2000) NOT NULL,
	regidate date DEFAULT sysdate,
	count number DEFAULT 0,
	deadline date NOT NULL,
	PRIMARY KEY (no)
);


CREATE TABLE market_group_buy_cmt
(
	cmt_no number NOT NULL,
	no number NOT NULL,
	cmt_content nvarchar2(200) NOT NULL,
	hit number DEFAULT 0,
	regidate date DEFAULT sysdate,
	PRIMARY KEY (cmt_no)
);


CREATE TABLE market_sell
(
	no number NOT NULL,
	mem_no number NOT NULL,
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
	no number NOT NULL,
	cmt_content nvarchar2(200) NOT NULL,
	hit number DEFAULT 0,
	regidate date DEFAULT sysdate,
	PRIMARY KEY (cmt_no)
);


CREATE TABLE mating
(
	mating_no number NOT NULL,
	ani_no number NOT NULL,
	mating_loc number NOT NULL,
	mating_regidate date DEFAULT SYSDATE,
	PRIMARY KEY (mating_no)
);


CREATE TABLE member
(
	mem_no number NOT NULL,
	mem_id varchar2(20) NOT NULL,
	mem_name nvarchar2(20) NOT NULL,
	mem_nickname nvarchar2(10) NOT NULL UNIQUE,
	mem_gender varchar2(1) NOT NULL CHECK (mem_gender IN ('F', 'M', 'U'),
	mem_birth date,
	mem_loc number NOT NULL,
	mem_log number NOT NULL,
	mem_interani varchar2(6) NOT NULL,
	PRIMARY KEY (mem_no)
);


CREATE TABLE miss_find
(
	no number NOT NULL,
	mem_no number NOT NULL,
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
	mem_no number NOT NULL,
	no number NOT NULL,
	cmt_content nvarchar2(200) NOT NULL,
	hit number DEFAULT 0,
	regidate date DEFAULT sysdate,
	PRIMARY KEY (cmt_no)
);


CREATE TABLE miss_see
(
	no number NOT NULL,
	mem_no number NOT NULL,
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
	mem_no number NOT NULL,
	no number NOT NULL,
	cmt_content nvarchar2(200) NOT NULL,
	hit number DEFAULT 0,
	regidate date DEFAULT sysdate,
	PRIMARY KEY (cmt_no)
);


CREATE TABLE notice
(
	no number NOT NULL,
	am_no number NOT NULL,
	title nvarchar2(50) NOT NULL,
	content nvarchar2(2000) NOT NULL,
	regidate date DEFAULT SYSDATE,
	count number DEFAULT 0,
	PRIMARY KEY (no)
);


CREATE TABLE reservation
(
	rv_no number NOT NULL,
	mem_no number NOT NULL,
	store_no number NOT NULL,
	apply_date date DEFAULT sysdate,
	booking_date date NOT NULL,
	PRIMARY KEY (rv_no)
);


CREATE TABLE rna_movie
(
	movie_no number NOT NULL,
	mem_no number NOT NULL,
	movie_title nvarchar2(50) NOT NULL,
	movie_count number DEFAULT 0,
	movie_content nvarchar2(2000) NOT NULL,
	movie_hit number DEFAULT 0,
	movie_regidate date DEFAULT sysdate,
	PRIMARY KEY (movie_no)
);


CREATE TABLE rna_movie_cmt
(
	cmt_no number NOT NULL,
	mem_no number NOT NULL,
	movie_no number NOT NULL,
	cmt_content nvarchar2(200) NOT NULL,
	hit number DEFAULT 0,
	regidate date DEFAULT sysdate,
	PRIMARY KEY (cmt_no)
);


CREATE TABLE rna_photo
(
	photo_no number NOT NULL,
	mem_no number NOT NULL,
	photo_count number DEFAULT 0,
	photo_title nvarchar2(50) NOT NULL,
	photo_content nvarchar2(2000) NOT NULL,
	photo_hit number DEFAULT 0,
	photo_regidate date DEFAULT sysdate,
	PRIMARY KEY (photo_no)
);


CREATE TABLE rna_photo_cmt
(
	cmt_no number NOT NULL,
	mem_no number NOT NULL,
	photo_no number NOT NULL,
	cmt_content nvarchar2(200) NOT NULL,
	hit number DEFAULT 0,
	regidate date DEFAULT sysdate,
	PRIMARY KEY (cmt_no)
);


CREATE TABLE rna_photo_link
(
	link_no number NOT NULL,
	photo_no number NOT NULL,
	link nvarchar2(300) NOT NULL,
	PRIMARY KEY (link_no)
);


CREATE TABLE rna_quest
(
	quest_no number NOT NULL,
	mem_no number NOT NULL,
	quest_title nvarchar2(50) NOT NULL,
	quest_content nvarchar2(2000) NOT NULL,
	quest_hit number DEFAULT 0,
	quest_regidate date DEFAULT sysdate,
	quest_count number DEFAULT 0,
	origin_no number DEFAULT 0,
	PRIMARY KEY (quest_no)
);


CREATE TABLE rna_quest_cmt
(
	cmt_no number NOT NULL,
	mem_no number NOT NULL,
	quest_no number NOT NULL,
	cmt_content nvarchar2(200) NOT NULL,
	hit number DEFAULT 0,
	regidate date,
	PRIMARY KEY (cmt_no)
);


CREATE TABLE rna_tip
(
	tip_no number NOT NULL,
	mem_no number NOT NULL,
	tip_title nvarchar2(50) NOT NULL,
	tip_content nvarchar2(2000) NOT NULL,
	tip_count number DEFAULT 0,
	tip_regidate date DEFAULT sysdate,
	tip_hit number DEFAULT 0,
	PRIMARY KEY (tip_no)
);


CREATE TABLE rna_tip_cmt
(
	cmt_no number NOT NULL,
	mem_no number NOT NULL,
	tip_no number NOT NULL,
	cmt_content nvarchar2(200) NOT NULL,
	hit number,
	regidate date DEFAULT sysdate,
	PRIMARY KEY (cmt_no)
);


CREATE TABLE store_category
(
	store_code number NOT NULL,
	store_name nvarchar2(30) NOT NULL,
	PRIMARY KEY (store_code)
);



/* Create Foreign Keys */

ALTER TABLE notice
	ADD FOREIGN KEY (am_no)
	REFERENCES admin_member (am_no)
;


ALTER TABLE mating
	ADD FOREIGN KEY (ani_no)
	REFERENCES animal (ani_no)
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


ALTER TABLE bird_movie_cmt
	ADD FOREIGN KEY (movie_no)
	REFERENCES bird_movie (movie_no)
;


ALTER TABLE bird_photo_cmt
	ADD FOREIGN KEY (photo_no)
	REFERENCES bird_photo (photo_no)
;


ALTER TABLE bird_photo_link
	ADD FOREIGN KEY (photo_no)
	REFERENCES bird_photo (photo_no)
;


ALTER TABLE bird_quest_cmt
	ADD FOREIGN KEY (quest_no)
	REFERENCES bird_quest (quest_no)
;


ALTER TABLE bird_tip_cmt
	ADD FOREIGN KEY (tip_no)
	REFERENCES bird_tip (tip_no)
;


ALTER TABLE cat_movie_cmt
	ADD FOREIGN KEY (movie_no)
	REFERENCES cat_movie (movie_no)
;


ALTER TABLE cat_photo_cmt
	ADD FOREIGN KEY (photo_no)
	REFERENCES cat_photo (photo_no)
;


ALTER TABLE cat_photo_link
	ADD FOREIGN KEY (photo_no)
	REFERENCES cat_photo (photo_no)
;


ALTER TABLE cat_quest_cmt
	ADD FOREIGN KEY (quest_no)
	REFERENCES cat_quest (quest_no)
;


ALTER TABLE cat_tip_cmt
	ADD FOREIGN KEY (tip_no)
	REFERENCES cat_tip (tip_no)
;


ALTER TABLE dog_movie_cmt
	ADD FOREIGN KEY (movie_no)
	REFERENCES dog_movie (movie_no)
;


ALTER TABLE dog_photo_cmt
	ADD FOREIGN KEY (photo_no)
	REFERENCES dog_photo (photo_no)
;


ALTER TABLE dog_photo_link
	ADD FOREIGN KEY (photo_no)
	REFERENCES dog_photo (photo_no)
;


ALTER TABLE dog_quest_cmt
	ADD FOREIGN KEY (quest_no)
	REFERENCES dog_quest (quest_no)
;


ALTER TABLE dog_tip_cmt
	ADD FOREIGN KEY (tip_no)
	REFERENCES dog_tip (tip_no)
;


ALTER TABLE etc_movie_cmt
	ADD FOREIGN KEY (movie_no)
	REFERENCES etc_movie (movie_no)
;


ALTER TABLE etc_photo_cmt
	ADD FOREIGN KEY (photo_no)
	REFERENCES etc_photo (photo_no)
;


ALTER TABLE etc_photo_link
	ADD FOREIGN KEY (photo_no)
	REFERENCES etc_photo (photo_no)
;


ALTER TABLE etc_quest_cmt
	ADD FOREIGN KEY (quest_no)
	REFERENCES etc_quest (quest_no)
;


ALTER TABLE etc_tip_cmt
	ADD FOREIGN KEY (tip_no)
	REFERENCES etc_tip (tip_no)
;


ALTER TABLE freeboard_cmt
	ADD FOREIGN KEY (free_no)
	REFERENCES freeboard (free_no)
;


ALTER TABLE market_buy_cmt
	ADD FOREIGN KEY (no)
	REFERENCES market_buy (no)
;


ALTER TABLE group_buy
	ADD FOREIGN KEY (no)
	REFERENCES market_group_buy (no)
;


ALTER TABLE market_group_buy_cmt
	ADD FOREIGN KEY (no)
	REFERENCES market_group_buy (no)
;


ALTER TABLE market_sell_cmt
	ADD FOREIGN KEY (no)
	REFERENCES market_sell (no)
;


ALTER TABLE animal
	ADD FOREIGN KEY (mem_no)
	REFERENCES member (mem_no)
;


ALTER TABLE bird_movie
	ADD FOREIGN KEY (mem_no)
	REFERENCES member (mem_no)
;


ALTER TABLE bird_movie_cmt
	ADD FOREIGN KEY (mem_no)
	REFERENCES member (mem_no)
;


ALTER TABLE bird_photo
	ADD FOREIGN KEY (mem_no)
	REFERENCES member (mem_no)
;


ALTER TABLE bird_photo_cmt
	ADD FOREIGN KEY (mem_no)
	REFERENCES member (mem_no)
;


ALTER TABLE bird_quest
	ADD FOREIGN KEY (mem_no)
	REFERENCES member (mem_no)
;


ALTER TABLE bird_quest_cmt
	ADD FOREIGN KEY (mem_no)
	REFERENCES member (mem_no)
;


ALTER TABLE bird_tip
	ADD FOREIGN KEY (mem_no)
	REFERENCES member (mem_no)
;


ALTER TABLE bird_tip_cmt
	ADD FOREIGN KEY (mem_no)
	REFERENCES member (mem_no)
;


ALTER TABLE cat_movie
	ADD FOREIGN KEY (mem_no)
	REFERENCES member (mem_no)
;


ALTER TABLE cat_movie_cmt
	ADD FOREIGN KEY (mem_no)
	REFERENCES member (mem_no)
;


ALTER TABLE cat_photo
	ADD FOREIGN KEY (mem_no)
	REFERENCES member (mem_no)
;


ALTER TABLE cat_photo_cmt
	ADD FOREIGN KEY (mem_no)
	REFERENCES member (mem_no)
;


ALTER TABLE cat_quest
	ADD FOREIGN KEY (mem_no)
	REFERENCES member (mem_no)
;


ALTER TABLE cat_quest_cmt
	ADD FOREIGN KEY (mem_no)
	REFERENCES member (mem_no)
;


ALTER TABLE cat_tip
	ADD FOREIGN KEY (mem_no)
	REFERENCES member (mem_no)
;


ALTER TABLE cat_tip_cmt
	ADD FOREIGN KEY (mem_no)
	REFERENCES member (mem_no)
;


ALTER TABLE dog_movie
	ADD FOREIGN KEY (mem_no)
	REFERENCES member (mem_no)
;


ALTER TABLE dog_movie_cmt
	ADD FOREIGN KEY (mem_no)
	REFERENCES member (mem_no)
;


ALTER TABLE dog_photo
	ADD FOREIGN KEY (mem_no)
	REFERENCES member (mem_no)
;


ALTER TABLE dog_photo_cmt
	ADD FOREIGN KEY (mem_no)
	REFERENCES member (mem_no)
;


ALTER TABLE dog_quest
	ADD FOREIGN KEY (mem_no)
	REFERENCES member (mem_no)
;


ALTER TABLE dog_quest_cmt
	ADD FOREIGN KEY (mem_no)
	REFERENCES member (mem_no)
;


ALTER TABLE dog_tip
	ADD FOREIGN KEY (mem_no)
	REFERENCES member (mem_no)
;


ALTER TABLE dog_tip_cmt
	ADD FOREIGN KEY (mem_no)
	REFERENCES member (mem_no)
;


ALTER TABLE etc_movie
	ADD FOREIGN KEY (mem_no)
	REFERENCES member (mem_no)
;


ALTER TABLE etc_movie_cmt
	ADD FOREIGN KEY (mem_no)
	REFERENCES member (mem_no)
;


ALTER TABLE etc_photo
	ADD FOREIGN KEY (mem_no)
	REFERENCES member (mem_no)
;


ALTER TABLE etc_photo_cmt
	ADD FOREIGN KEY (mem_no)
	REFERENCES member (mem_no)
;


ALTER TABLE etc_quest
	ADD FOREIGN KEY (mem_no)
	REFERENCES member (mem_no)
;


ALTER TABLE etc_quest_cmt
	ADD FOREIGN KEY (mem_no)
	REFERENCES member (mem_no)
;


ALTER TABLE etc_tip
	ADD FOREIGN KEY (mem_no)
	REFERENCES member (mem_no)
;


ALTER TABLE etc_tip_cmt
	ADD FOREIGN KEY (mem_no)
	REFERENCES member (mem_no)
;


ALTER TABLE freeboard
	ADD FOREIGN KEY (mem_no)
	REFERENCES member (mem_no)
;


ALTER TABLE group_buy
	ADD FOREIGN KEY (mem_no)
	REFERENCES member (mem_no)
;


ALTER TABLE market_buy
	ADD FOREIGN KEY (mem_no)
	REFERENCES member (mem_no)
;


ALTER TABLE market_group_buy
	ADD FOREIGN KEY (mem_no)
	REFERENCES member (mem_no)
;


ALTER TABLE market_sell
	ADD FOREIGN KEY (mem_no)
	REFERENCES member (mem_no)
;


ALTER TABLE miss_find
	ADD FOREIGN KEY (mem_no)
	REFERENCES member (mem_no)
;


ALTER TABLE miss_find_cmt
	ADD FOREIGN KEY (mem_no)
	REFERENCES member (mem_no)
;


ALTER TABLE miss_see
	ADD FOREIGN KEY (mem_no)
	REFERENCES member (mem_no)
;


ALTER TABLE miss_see_cmt
	ADD FOREIGN KEY (mem_no)
	REFERENCES member (mem_no)
;


ALTER TABLE reservation
	ADD FOREIGN KEY (mem_no)
	REFERENCES member (mem_no)
;


ALTER TABLE rna_movie
	ADD FOREIGN KEY (mem_no)
	REFERENCES member (mem_no)
;


ALTER TABLE rna_movie_cmt
	ADD FOREIGN KEY (mem_no)
	REFERENCES member (mem_no)
;


ALTER TABLE rna_photo
	ADD FOREIGN KEY (mem_no)
	REFERENCES member (mem_no)
;


ALTER TABLE rna_photo_cmt
	ADD FOREIGN KEY (mem_no)
	REFERENCES member (mem_no)
;


ALTER TABLE rna_quest
	ADD FOREIGN KEY (mem_no)
	REFERENCES member (mem_no)
;


ALTER TABLE rna_quest_cmt
	ADD FOREIGN KEY (mem_no)
	REFERENCES member (mem_no)
;


ALTER TABLE rna_tip
	ADD FOREIGN KEY (mem_no)
	REFERENCES member (mem_no)
;


ALTER TABLE rna_tip_cmt
	ADD FOREIGN KEY (mem_no)
	REFERENCES member (mem_no)
;


ALTER TABLE miss_find_cmt
	ADD FOREIGN KEY (no)
	REFERENCES miss_find (no)
;


ALTER TABLE miss_see_cmt
	ADD FOREIGN KEY (no)
	REFERENCES miss_see (no)
;


ALTER TABLE rna_movie_cmt
	ADD FOREIGN KEY (movie_no)
	REFERENCES rna_movie (movie_no)
;


ALTER TABLE rna_photo_cmt
	ADD FOREIGN KEY (photo_no)
	REFERENCES rna_photo (photo_no)
;


ALTER TABLE rna_photo_link
	ADD FOREIGN KEY (photo_no)
	REFERENCES rna_photo (photo_no)
;


ALTER TABLE rna_quest_cmt
	ADD FOREIGN KEY (quest_no)
	REFERENCES rna_quest (quest_no)
;


ALTER TABLE rna_tip_cmt
	ADD FOREIGN KEY (tip_no)
	REFERENCES rna_tip (tip_no)
;



