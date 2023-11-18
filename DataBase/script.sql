create database peoplepertask;
use peoplepertask;

create table users (
	id int primary key auto_increment,
    fullName varchar(255) not null,
    email varchar(255) not null,
    userpassword varchar(255) not null,
    job varchar(255) not null,
    profil_image_src varchar(255) not null
);

create table freelancers (
	id int primary key auto_increment,
    freelancerName varchar(255),
    skills varchar(255),
    user_id int,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

create table testimonials (
	id int primary key auto_increment,
    testimonialText text not null,
    user_id int,
    foreign key (user_id) references users(id)
);

create table offers (
	id int primary key auto_increment,
    photo_src varchar(255) not null,
    title varchar(255) not null,
    price decimal(10, 2) not null,
    delay time not null,
    freelancer_id int,
    FOREIGN KEY (freelancer_id) references freelancers(id)
);

create table projects (
	id int primary key auto_increment,
    title varchar(255) not null,
    description text not null,
    price decimal(10, 2) not null,
    user_id int,
    FOREIGN KEY (user_id) REFERENCES users(id)
);


create table categories(
	id int primary key auto_increment,
    name varchar(255) not null,
	slogan varchar(255) not null
);

create table subcategories(
	id int primary key auto_increment,
    name varchar(255) not null,
    category_id int,
    FOREIGN KEY (category_id) REFERENCES categories(id)
);