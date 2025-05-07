use nodejs;

create table userss (
	idx int auto_increment primary key,
    userid varchar(50) unique not null,
    password varchar(200) not null,
    name varchar(20) not null,
    email varchar(50) not null,
    url varchar(200)
);

create table postss (
	idx int auto_increment primary key,
    useridx int not null,
    createAt datetime default now(),
    text varchar(2000) not null,
    foreign key(useridx) references userss(idx)
);

select * from userss;
select * from postss;

select * from userss where userid='apple';
insert into userss (userid, password, name, email, url) values ('apple', '1111', '김사과', 'apple@apple.com', 'https://randomuser.me/api/portraits/women/32.jpg');
select * from userss where idx=2;

insert into postss (useridx, text) values (2, "안녕하세요!");

select u.userid, u.name, u.url, p.idx, p.useridx, p.text, p.createAt from userss as u join postss p on u.idx = p.useridx;

update postss set text='바뀐 글!!!' where idx=2;