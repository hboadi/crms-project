create table student 
(
case_id varchar(10), 
first_name varchar(20) not null, 
last_name varchar(20) not null, 
email varchar(30) not null, 
phone_number varchar(20), 

primary key (case_id),
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

    primary key (employee_id),
    foreign key (case_id) references student(case_id)
);

create table item
(
    item_id varchar(10),
    item_name varchar(50) not null,
    category varchar(30) not null,
    quantity int not null,
    price decimal(10,2) not null,

    primary key (item_id)
);

create table itemcopy 
( 
    copy_id varchar(10), 
    item_id varchar(10), 
    tag varchar(30) not null,
    status varchar(20) not null default 'available', 
    condition varchar(50),

    primary key (copy_id),
    foreign key (item_id) references item(item_id)
);

create table rental 
( 
    rental_id varchar(10), 
    item_id varchar(10) not null,
    item_name varchar(50) not null,
    renter_case_id varchar(10) not null,
    employee_id varchar(10) not null,
    status varchar(20) not null default 'active',
    checkout_date date not null default current_date,
    due_date date not null default (date('now', '+7 days')),

    primary key (rental_id),
    foreign key (item_id) references item(item_id),
    foreign key (renter_case_id) references student(case_id),
    foreign key (employee_id) references employee(employee_id)
);

create table return 
(
    return_id varchar(10),
    rental_id varchar(10) not null,
    return_date date not null default current_date,
    condition_on_return varchar(50),
    employee_id varchar(10) not null,

    primary key (return_id),
    foreign key (rental_id) references rental(rental_id),
    foreign key (employee_id) references employee(employee_id)
);

