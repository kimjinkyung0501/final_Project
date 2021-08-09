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
)

insert into member values(
'admin', 'admin', 'admin', '경기도 여주시',
'01011111111', 'kdj9878@naver.com', '1',
null
);

select * from member;
delete from member;

drop table member cascade constraint purge;

drop sequence member_seq;



--임시 멤버 테이블
create table temp_member(
t_m_id varchar2(10 char)not null,
t_m_email varchar2(20 char)not null,
t_m_key varchar2(21 char)not null

constraint temp_member_d
foreign key(t_m_id) references member(m_id)
on delete cascade

)

select * from temp_member;

delete from TEMP_MEMBER;
drop table temp_member cascade constraint purge;



--멤버 핸드폰 인증번호 테이블
create table member_phone_check(
m_p_no number(20) primary key,
m_p_number varchar2(12 char) not null,
m_p_id varchar2(10 char) not null,
m_p_successInfo varchar2(5 char)not null
)

create sequence member_phone_seq;
select * from member_phone_check;

select m_p_id from member_phone_check where m_p_number = 01032084487;

insert into member_phone_check values(member_phone_seq.nextval, '01011111111', 'admin', 'false');

delete from MEMBER_PHONE_CHECK;
drop table member_phone_check cascade constraint purge;
drop sequence member_phone_seq;

--상점 테이블

create table store(
s_id varchar2(10 char) not null,
s_no number(8) primary key not null,
s_name varchar2(10 char) not null

);
create sequence store_seq;

--제품 테이블(아직 추가 안함)
create table product(
p_rn number(8) not null,
p_no number(8) primary key not null,
p_stock number(5) not null,
p_name varchar2(10 char) not null,
p_price number(7) not null,
p_content varchar2(1000 char) not null,
p_label varchar2(10 char) not null,
p_option varchar2(50 char),
p_photo varchar2(100 char) not null,
constraint p_rn_no
	foreign key(p_rn) references store(s_no)
	on delete cascade
);

--강의 테이블(아직 추가 안함)
create table lession(
l_rn number(8) not null,
l_no number(8) primary key not null,
l_name varchar2(10 char) not null,
l_price number(7) not null,
l_content varchar2(10 char) not null,
l_label varchar2(10 char) not null,
l_photo varchar2(100 char) not null,
constraint s_rn_no
	foreign key(l_rn) references store(s_no)
	on delete cascade
);
create sequence lesson_seq;



