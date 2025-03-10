create database if not exists studdentclass;
use studdentclass;
create table student(
stt int auto_increment primary key,
id int ,
`name` varchar(155)
);
INSERT INTO student (id, name) VALUES (1, 'Nguyễn Văn A');
INSERT INTO student (id, name) VALUES (2, 'Trần Thị B');
INSERT INTO student (id, name) VALUES (2, 'Trần Thị ');
INSERT INTO student (id, name) VALUES (3, 'Lê Văn C');
create table class(
class_id int,
class_name varchar(155),
foreign key (class_id) references student(stt)
);
INSERT INTO class (class_id, class_name) VALUES (1, 'C01');
INSERT INTO class (class_id, class_name) VALUES (2, 'C02');
INSERT INTO class (class_id, class_name) VALUES (3,'C03');
select student.stt,student.id,student.`name`,class.class_name from student left join class on student.id=class.class_id;

