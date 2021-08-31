-- 고객센터 사항 메시지 테이블

drop table complain cascade constraint purge;

select * from complain

create table complain (
c_no	varchar2(10 char) not null,
c_id	varchar2(10 char)  not null,
c_reason	varchar2(10 char) not null,
c_content	varchar2(1000char) not null,
c_date	date not null,
c_phone	varchar2(12 char) not null,
c_email	varchar2(25 char) not null,
c_state varchar2(10 char) not null

);

insert into complain values(complain_no_seq.nextval,'a','otherUser','동준이가 괴롭힙니다',sysdate,'01055557777','chw1235@kakao.com',1);
insert into complain values(complain_no_seq.nextval,'b','otherUser','동준이가 괴롭힙니다',sysdate,'01055557777','chw1235@kakao.com',1);

insert into complain values(complain_no_seq.nextval,'동준7','contrects','환불요청이 거부됬습니다',sysdate,'01055557777','chw1235@kakao.com',1);
insert into complain values(complain_no_seq.nextval,'동준7','contrects','환불요청이 거부됬습니다',sysdate,'01055557777','chw1235@kakao.com',1);
insert into complain values(complain_no_seq.nextval,'동준7','contrects','환불요청이 거부됬습니다',sysdate,'01055557777','chw1235@kakao.com',1);
insert into complain values(complain_no_seq.nextval,'동준7','contrects','환불요청이 거부됬습니다',sysdate,'01055557777','chw1235@kakao.com',1);


insert into complain values(complain_no_seq.nextval,'주영2','accounts','입점시켜 주세요',sysdate,'01055557777','chw1235@kakao.com',1);
insert into complain values(complain_no_seq.nextval,'주영2','accounts','입점시켜 주세요',sysdate,'01055557777','chw1235@kakao.com',1);

insert into complain values(complain_no_seq.nextval,'현지2','ETC','하기 싫다',sysdate,'01055557777','chw1235@kakao.com',1);
insert into complain values(complain_no_seq.nextval,'현지2','ETC','피곤합니다',sysdate,'01055557777','chw1235@kakao.com',1);
insert into complain values(complain_no_seq.nextval,'진경3','ETC','css언제 끝나요?',sysdate,'01055557777','chw1235@kakao.com',1);
insert into complain values(complain_no_seq.nextval,'진경3','ETC','css언제 끝나요?',sysdate,'01055557777','chw1235@kakao.com',1);
insert into complain values(complain_no_seq.nextval,'진경3','ETC','css언제 끝나요?',sysdate,'01055557777','chw1235@kakao.com',1);


insert into complain values(complain_no_seq.nextval,'admin','ETC','제발제발',sysdate,(select m_phone from member where m_id = 'admin'),
(select m_email from member where m_id = 'admin'));




create sequence complain_no_seq;

select * from complain where c_reason like '%otherUser%'
---메시지 테이블 to end




--멤버 테이블
create table member(
m_id	varchar2(10 char) primary key not null,
m_pw	varchar2(12 char) not null,
m_name	varchar2(10 char) not null,
m_addr	varchar2(200 char) not null,
m_phone	varchar2(12 char) not null,
m_email	varchar2(25 char) not null,
m_grade char(1) not null,
m_photo varchar2(20 char)
);

alter table member modify m_photo varchar2(100);

insert into member values(
'admin', 'admin', 'admin', '경기도 여주시',
'01011111111', 'kdj9878@naver.com', '1',
null
);
update member set m_grade=3 where m_id='aa';

insert into member values(
'동준', 'k', 'kdj', '경기도 여주시',
'01032084487', 'wlsrud54@naver.com', '1',
null
);



insert into member values('nihonzin', '1234', '일본인','일본', '01000000000', 'a@p.com', '3', null)
insert into member values('ii', 'ii', 'bb','bb', '01000000000', 'a@p.com', '3', null)
insert into member values('jj', 'jj', 'cc','cc', '01000000000', 'a@p.com', '3', null)
insert into member values('kk', 'kk', 'dd','dd', '01000000000', 'a@p.com', '3', null);
insert into member values('jk', 'jk', 'dd','dd', '01000000000', 'a@p.com', '1', null);
insert into member values('dj', 'dj', 'dj','dj', '01012345678', 'a@p.com', '1', null);
insert into member values('jy', 'jy', 'jy','jy', '01012345678', 'a@na.com', '1', null);
insert into member values('kjk', 'kjk', 'kjk','kjk', '01012345678', 'a@na.com', '1', null);
insert into member values('jkjk', 'jkjk', 'jkjk','jkjk', '01012345878', 'a@na.acom', '1', '100.jpg');
insert into member values('jkjk2', 'jkjk', 'jkjk','jkjk', '01012345878', 'a@na.acom', '1', '100.jpg');

insert into store values('nihonzin',store_seq.nextval,'라면가게','라면','rs.img');

select * from member;
delete from member where m_id = 'k';
delete from member where m_id = 'kdj1234';



select * from member;
delete from member;
delete from member where m_phone = '01032084487';
drop table member cascade constraint purge;

drop sequence member_seq;

update member set m_email = 'aa' where m_id = 'aaa'

--임시 멤버 테이블
create table temp_member(
t_m_id varchar2(10 char)not null,
t_m_email varchar2(300 char)not null,
t_m_key varchar2(21 char)not null

)

delete from TEMP_MEMBER where t_m_id = '2'

select * from temp_member;
delete from temp_member where t_m_email = 'kdj9878@gmail.com';
delete from TEMP_MEMBER;
drop table temp_member cascade constraint purge;
update temp_member set t_m_key = 'y' where t_m_id = 'kdj9878';
delete from temp_member where t_m_id = 'bb'


--멤버 핸드폰 인증번호 테이블
create table member_phone_check(
m_p_no number(20) primary key,
m_p_number varchar2(12 char) not null,
m_p_id varchar2(10 char) not null,
m_p_successInfo varchar2(5 char)not null
);

create sequence member_phone_seq;
select * from member_phone_check;

select m_p_id from member_phone_check where m_p_number = 01032084487;

insert into member_phone_check values(member_phone_seq.nextval, '01011111111', 'admin', 'false');
insert into member_phone_check values(member_phone_seq.nextval, '01032084487', '831054', 'true');

--update 

delete from MEMBER_PHONE_CHECK;
drop table member_phone_check cascade constraint purge;
drop sequence member_phone_seq;

--상점 테이블
create table store(
s_id varchar2(10 char) not null,
s_no number(8) primary key not null,
s_name varchar2(10 char) not null,
s_exp varchar2(100 char) not null,
s_img varchar2(100 char) not null,
constraint m_id_s_id
foreign key(s_id) references member(m_id)
	on delete cascade
);


create sequence store_seq;

drop table store cascade constraint purge;
drop sequence store_seq;
insert into store values('cjyv1029',store_seq.nextval,'라면가게','라면','rs.img');
insert into store values('aa',store_seq.nextval,'라면가게','라면','rs.img');
select * from STORE;

delete from store;
drop sequence store_seq;

--제품 테이블(아직 추가 안함)
create table product(
p_rn number(8) not null,
p_no number(8) primary key not null,
p_stock number(5) not null,
p_name varchar2(100 char) not null,
p_price number(7) not null,
p_content varchar2(1000 char) not null,
p_label varchar2(10 char) not null,
p_photo1 varchar2(100 char) not null,
p_photo2 varchar2(100 char),
p_photo3 varchar2(100 char),
constraint p_rn_no
	foreign key(p_rn) references store(s_no)
	on delete cascade
);
select * from PRODUCT;
create sequence product_seq;
drop table product cascade constraint purge;
drop sequence product_seq;

alter table lesson modify l_name varchar2(100 char);

delete from LESSON;
delete from PRODUCT;
select * from PRODUCT

insert into PRODUCT values(1, product_seq.nextval, 100, '간장라면', 8000, '간장맛 라면입니다', '음식', '쇼유라멘.jpg', null, null);
insert into PRODUCT values(1, product_seq.nextval, 100, '시오라면', 7000, '소금맛 라면입니다', '음식', '시오라멘.jpg', null, null);
insert into PRODUCT values(1, product_seq.nextval, 100, '신라면', 5000, '매운 라면입니다', '음식', '신라면.jpg', null, null);

select  l_label as c_label, l_name as c_name, l_price as c_price, l_photo as c_photo, l_no
from lesson
where l_name like '%고%'





--강의 테이블(아직 추가 안함)

create table lesson(
l_rn number(8) not null,
l_no number(8) primary key not null,
l_name varchar2(10 char) not null,
l_price number(7) not null,
l_content varchar2(1000 char) not null,
l_label varchar2(10 char) not null,
l_photo varchar2(100 char) not null,
l_video varchar2(100 char) not null,
constraint s_rn_no
	foreign key(l_rn) references store(s_no)
	on delete cascade
);
create sequence lesson_seq;

delete from lesson where l_no = 61;
select * from LESSON
update lesson set l_video = '체리.mp4' where l_no = 62;
drop table lesson cascade constraint purge;
drop sequence lesson_seq;



-------------------------------------
create table p_order(
o_no number(8)not null,
o_id varchar2(10 char)not null,
o_m_addr varchar2(200 char)not null,
o_quantidey number(20)not null,	
o_phone varchar2(12 char)not null,
o_o_nop number(10)not null primary key

);

select * from p_order;
delete from p_order;
insert into p_order values(62, 'aa', '집', 2, '01032084487', p_order_seq.nextval);
insert into p_order values(63, 'aa', '집', 6, '01032084487', p_order_seq.nextval);
insert into p_order values(64, 'aa', '집', 3, '01032084487', p_order_seq.nextval);
create sequence p_order_seq;
drop sequence p_order_seq;

select p_name, p_photo1, p_price, s_name, o_quantidey, o_o_nop
from store, product, p_order
where s_no = p_rn and o_no = p_no and o_id = (select m_id from member where m_id = 'aa')



create table taken_p_order(
p2_no number(20) not null primary key,
p2_s_name varchar2(20 char)not null,
p2_o_id varchar2(10 char)not null,
p2_o_no number(20)not null,
p2_name varchar2(10 char)not null,
p2_email varchar2(20 char)not null,
p2_phone varchar2(15 char)not null,
p2_addr varchar2(200 char)not null,
p2_p_name varchar2(30 char)not null,
p2_p_photo varchar2(30 char)not null,
p2_p_quantidey number(30)not null,
p2_sumPrice number(30)not null,
p2_date varchar2(20 char),
o_o_nop number(20)not null,
constraint p_o_no_p2
	foreign key(p2_o_no) references product(p_no)
	on delete cascade,
constraint p_o_id_m2
	foreign key(p2_o_id) references member(m_id)
	on delete cascade
);


SELECT * 

FROM ALL_TAB_COLUMNS

WHERE TABLE_NAME = 'member';







alter table taken_p_order modify p2_p_photo varchar2(100 char);

-- Product Rank --
SELECT p2_o_no, p2_p_name, p2_p_photo,
sum(p2_p_quantidey) AS p2_p_quantidey
FROM taken_p_order
GROUP BY p2_o_no, p2_p_name, p2_p_photo
ORDER BY p2_p_quantidey DESC;


create sequence taken_p_order_seq;

select * from taken_p_order;

delete from taken_p_order;
drop table taken_p_order cascade constraint purge;
drop sequence taken_p_order_seq;


alter table lesson modify l_name varchar2(100 char);





create table p_order2(
o_no number(8) not null,
o_id varchar2(10 char) not null,
o_name	varchar2(10 char) not null,
o_addr varchar2(200 char) not null,
o_email	varchar2(25 char) not null,
o_quantidey number(8) not null,
o_phone varchar2(12 char) not null,
o_o_nop number(8) primary key not null,
constraint p_o_no_p
	foreign key(o_no) references product(p_no)
	on delete cascade,
constraint p_o_id_m
	foreign key(o_id) references member(m_id)
	on delete cascade

);
create sequence p_order2_seq;


select * from p_order2;








create table l_order2(
o_no number(8) not null,
o_id varchar2(10 char)not null,
o_email varchar2(25 char)not null,
o_o_noc number(8) primary key not null,
constraint l_o_no_p
foreign key(o_no) references lesson(l_no)
on delete cascade,
constraint l_o_no_m
foreign key(o_id) references member(m_id)
on delete cascade

);
select * from L_ORDER2;
create sequence l_order2_seq;

insert into L_ORDER2 values(62, 'aa', 'kdj9878', l_order2_seq.nextval);
delete from L_ORDER2 where o_email = 'a';

create table p_comment(
p_c_id varchar2(10 char)not null, 
p_c_no number(8)not null, 
p_c_photo varchar2(30 char) , 
p_c_content varchar2(300 char)not null, 
p_mark number(1) DEFAULT 0,
p_date date not null, 
p_c_pk number(8)primary key not null, 
constraint p_c_no_p
 foreign key(p_c_no) references product(p_no)
on delete cascade,
constraint p_c_id_m
 foreign key(p_c_id) references member(m_id)
on delete cascade
);

create sequence p_comment_seq;

create table l_comment(
l_c_id varchar2(10 char)not null, 
l_c_no number(8)not null, 
l_c_photo varchar2(30 char), 
l_c_content varchar2(300 char)not null, 
l_mark number(1) DEFAULT 0,
l_date date not null, 
l_c_pk number(8)primary key not null, 
constraint l_c_no_p
 foreign key(l_c_no) references lesson(l_no)
on delete cascade,
constraint l_c_id_m
 foreign key(l_c_id) references member(m_id)
on delete cascade
);

delete from L_COMMENT;

alter table l_comment modify l_c_photo varchar2(100 char);
alter table p_comment modify p_c_photo varchar2(100 char);

;select * from L_COMMENT;

create sequence l_comment_seq;



drop table l_comment cascade constraint purge;
drop table p_comment cascade constraint purge;



alter table p_order
add constraint p_order_member
foreign key(o_id) references member(m_id)
on delete cascade

--외래키 설정(product와 연결)
alter table p_order
add constraint p_order_product
foreign key(o_no) references store(s_no)
on delete cascade

delete from P_ORDER where o_id = 'aa';
delete from P_ORDER where o_id = '로그인 할 아이디';

select * from P_ORDER

insert into p_order values(1, 'aa', '경기도', 3, '01032084487',p_order_seq.nextval);
insert into p_order values(2, 'aa', '경기도', 1, '01032084487',p_order_seq.nextval);
insert into p_order values(3, 'aa', '경기도', 2, '01032084487',p_order_seq.nextval);

select s_name as c_name, s_no,s_img
from store ㅋㅋㅋ머하려구
where s_name like '%a%';


