create database if not exists quan_ly_sinh_vien;
use quan_ly_sinh_vien;
create table student(
id int primary key,
student_name varchar(50),
birthday date,
email varchar(50),
point_student int,
class_id int,
use_name varchar(50),
foreign key(class_id) references class(id),
foreign key(use_name) references jame(use_name)
);
insert into student(id,student_name,birthday,email,point_student,class_id,use_name) values(1,"Hoàng Việt",'2006-12-15',"haha@",7,1,"viet1");
insert into student(id,student_name,birthday,email,point_student,class_id,use_name) values(2,"xuân đạt",'2006-03-16',"haha@",5,1,"viet1");
insert into student(id,student_name,birthday,email,point_student,class_id,use_name) values(3,"Việt",'2006-12-17',"haha@",3,1,"viet1");
insert into student(id,student_name,birthday,email,point_student,class_id,use_name) values(4,"Việt",'2006-12-17',"haha@",3,1,"viet1");
insert into student(id,student_name,birthday,email,point_student,class_id,use_name) values(9,"Việt",'2006-12-17',"haha@",3,4,"viet1");
insert into student(id,student_name,birthday,email,point_student,class_id,use_name) values(10,"Việt",'2006-12-17',"haha@",3,4,"viet1");
select* from student;

create table class(
id int primary key,
name_class varchar(50)
);
insert into class(id,name_class)values(1,"c11");
insert into class(id,name_class)values(2,"c11");
insert into class(id,name_class)values(3,"c11");
insert into class(id,name_class)values(4,"c112");
update class set name_class ='c12' where id=2;
update class set name_class ='c13' where id=3;

 select *from student s 
 join class c on s.id=c.id;
create table room(
id int primary key,
name_room varchar(50),
class_id int,
foreign key(class_id) references class(id)
);
insert into room(id,name_room,class_id)values(1,"team",2);
insert into room(id,name_room,class_id)values(2,"andy",1);
insert into room(id,name_room,class_id)values(3,"alan",3);
create table jame(
use_name varchar(50) primary key,
passwork varchar(15)
);
insert into jame(use_name,passwork) values("viet","viet1");
insert into jame(use_name,passwork) values("viet1","viet1");
insert into jame(use_name,passwork) values("viet2","viet1");
select*from student;
drop table student;
select SUBSTRING_INDEX(student_name, ' ', -1) as Tên from student  
where SUBSTRING_INDEX(student_name, ' ', -1) like "h%" or SUBSTRING_INDEX(student_name, ' ', -1) like "H%";
SET SQL_SAFE_UPDATES = 0;
update student set class_id=2 where student_name="Hung";	
select*from student where month(birthday)=12;
select*from student where point_student>=3 and point_student<=5;
select max(point_student) as max_poin from student;
select id,student_name, birthday, avg(point_student) as diem_trung_binh from student
group by id,student_name, birthday
order by point_student  desc;
-- hiển thị lớp học có học viên theo học và số lượng học viên của mỗi lớp
select c.name_class, count(s.id) as so_luong_hoc_vien from student s
join class c on s.class_id = c.id
group by c.id ;
-- hiển thị điểm lớn nhất của mỗi lớp
select c.name_class,  max(point_student) as max_diem from student s
join class c on s.class_id= c.id
group by c.name_class;
-- lấy điểm trung bình của mỗi lớp
select c.name_class,  avg(point_student) as diem_trung_binh from student s
join class c on s.class_id= c.id
group by c.name_class;
-- lấy ra 3 học viên có điêm cao nhất
select * from student 
order by point_student desc 
limit 0, 3;
-- lấy ra học viên có số điểm cao nhất
select max(point_student) from student ;


