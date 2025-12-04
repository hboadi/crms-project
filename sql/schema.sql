create table student 
(
case_id varchar(10), 
first_name varchar(20) not null, 
last_name varchar(20) not null, 
email varchar(30) not null, 
phone_number varchar(20), 

constraint student_pk primary key (case_id), 
constraint student_email_uk unique(email)
);


create table employee 
(
    employee_id varchar(10),
    case_id varchar(10),
    first_name varchar(20) not null,
    last_name varchar(20) not null,
    role varchar(20) not null,
    email varchar(30) not null,
    phone_number varchar(20),

    constraint employee_pk primary key (employee_id),
    constraint employee_case_fk foreign key (case_id) references student(case_id),
    constraint employee_email_uk unique(email)
