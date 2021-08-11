-- 멤버 테이블
create table member(
m_id	varchar2(10char) primary key not null,
m_pw	varchar2(12char) not null,
m_name	varchar2(10char) not null,
m_addr	varchar2(200char) not null,
m_phone	varchar2(12char) not null,
m_email	varchar2(25char) not null,
m_grade	char(1) not null,
m_photo varchar2(10char)
);

insert into member values('hj', 'hj', 'hj', 'a', '010', 'aaa', '1', 'a.jpg');
select * from member;


-- 공지사항
create table notice(
n_no number(8) primary key not null,
n_id varchar2 (10char) not null,
n_title varchar2 (100char) not null,
n_date date not null,
n_content varchar2 (1000char) not null,
n_photo varchar2 (100char),
	constraint notice
	foreign key(n_id) references member(m_id)
	on delete cascade
);
create sequence notice_seq;
insert into NOTICE values(notice_seq.nextval, 'admin', 'test', sysdate, 'test', 'm.jpg');
insert into NOTICE values(notice_seq.nextval, 'admin', '1111111111', sysdate, '11111111', 'm.jpg');
select * from NOTICE;

drop table notice cascade constraint purge;
drop sequence notice_seq;