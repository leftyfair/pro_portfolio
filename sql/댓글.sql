drop table reply_tbl; 

create table reply_tbl(
    rno int primary key, 
    bno int not null, 
    reply nvarchar2(1000) not null, 
    writer varchar2(50) not null, 
    replyDate date default sysdate,
    modifyDate date default sysdate,
    constraint fk_reply_board foreign key(bno)
    references board_tbl(bno) on delete cascade
);

drop sequence seq_reply; 
create sequence seq_reply; 

insert into reply_tbl(rno, bno, reply, writer)
values (seq_reply.nextval, 1, '대글내용 01', 'tester');
insert into reply_tbl(rno, bno, reply, writer)
values (seq_reply.nextval, 1, '대글내용 02', 'tester');
insert into reply_tbl(rno, bno, reply, writer)
values (seq_reply.nextval, 1, '대글내용 03', 'tester');
insert into reply_tbl(rno, bno, reply, writer)
values (seq_reply.nextval, 1, '대글내용 04', 'tester');

insert into reply_tbl(rno, bno, reply, writer)
values (seq_reply.nextval, 1, '대글내용 05', 'joy');
insert into reply_tbl(rno, bno, reply, writer)
values (seq_reply.nextval, 1, '대글내용 06', 'joy');

commit;

select * from reply_tbl;