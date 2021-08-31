-- 공지사항
create table notice(
n_no number(8) primary key not null,
n_id varchar2 (10char) not null,
n_title varchar2 (100char) not null,
n_date date not null,
n_content varchar2 (1000char) not null,
n_photo varchar2 (10char),
n_count number(8) not null,
   constraint notice
   foreign key(n_id) references member(m_id)
   on delete cascade
);
create sequence notice_seq;
select * from NOTICE;

drop table notice cascade constraint purge;
drop sequence notice_seq;

-- 스토리
create table story(
s_no number(10) primary key not null,
s_id varchar2 (10char) not null,
s_title varchar2 (100char) not null,
s_date date not null,
s_content varchar2 (1000char) not null,
s_photo varchar2 (100char),
s_like_count number(8),
   constraint story
   foreign key(s_id) references member(m_id)
   on delete cascade
);
create sequence story_seq;
select * from STORY;

drop table story cascade constraint purge;
drop sequence story_seq;

-- 스토리 댓글
create table story_reply(
sr_pk number(10) primary key not null, -- 댓글고유번호
sr_id varchar2 (10char) not null, -- 작성자 id= m_id
sr_no number(10) not null, -- 댓글이 소속된 글 번호 = s_no
sr_content varchar2 (500char) not null,
sr_date date not null,
   constraint st_comment
   foreign key(sr_id) references member(m_id)
   on delete cascade,
   constraint st_comment2
   foreign key(sr_no) references story(s_no)
   on delete cascade
);

create sequence story_reply_seq;
select * from story_reply;
drop table st_reply cascade constraint purge;

-- 좋아요
create table story_like(
like_pk number(8) primary key not null,
ls_no number(8) not null,
lm_id varchar2 (100char) not null,
constraint story_like
   foreign key(ls_no) references story(s_no)
   on delete cascade,
constraint story_like2
   foreign key(lm_id) references member(m_id)
   on delete cascade
);

select * from STORY_LIKE, member where lm_id = m_id and lm_id = 'admin';


select * from story_like;
create sequence story_like_seq;
drop table story_like cascade constraint purge;
drop sequence story_like_seq;

