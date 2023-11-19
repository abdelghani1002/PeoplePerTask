-- Active: 1700406782891@@127.0.0.1@3306@peoplepertask
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
    user_id int UNIQUE,
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
    category_id int,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (category_id) REFERENCES categories(id)
);


create table categories(
	id int primary key auto_increment,
    photo_src varchar(255) not null,
    name varchar(255) not null,
	slogan varchar(255) not null
);

create table subcategories(
	id int primary key auto_increment,
    name varchar(255) not null,
    category_id int,
    FOREIGN KEY (category_id) REFERENCES categories(id)
);


insert into offers(`photo_src`, `title`, `price`, `delay`) VALUES
("../images/offers/offer1.png", "Design Responsive, SEO friendly & Fast Loading WordPress website", 205, 5),
("../images/offers/offer2.png", "Design Responsive, SEO friendly & Fast Loading WordPress website", 400, 4),
("../images/offers/offer3.png", "Design Responsive, SEO friendly & Fast Loading WordPress website", 360, 3),
("../images/offers/offer4.png", "Design Responsive, SEO friendly & Fast Loading WordPress website", 140, 2),
("../images/offers/offer5.png", "Design Responsive, SEO friendly & Fast Loading WordPress website", 50, 1);


INSERT into projects(`title`, `description`, `price`, `user_id`, `category_id`) values
("project1", "project1 description", 230, 1, 3),
("project1", "project1 description", 30, 3, 2),
("project1", "project1 description", 330, 2, 5),
("project1", "project1 description", 70, 5, 1),
("project1", "project1 description", 90, 3, 4);

insert into categories(`photo_src`, `name`, `slogan`) values
("../images/categories/cat1.webp", "Content Writing", "Engage your community"),
("../images/categories/cat2.webp", "SEO", "Boost your traffic"),
("../images/categories/cat3.webp", "Website Development", "Build your site"),
("../images/categories/cat4.webp", "Logo Design", "Elevate your brnad"),
("../images/categories/cat5.webp", "Voice-over", "Tell your story"),
("../images/categories/cat6.webp", "Illustration & Drawing", "Picture your idea"),
("../images/categories/cat7.webp", "Social Media Startegy", "Amplify your network"),
("../images/categories/cat8.webp", "SEM, Adwords & PPC", "get more customers"),
("../images/categories/cat9.webp", "Sales & Calls", "Convert more leads"),
("../images/categories/cat10.webp", "Admin Assistance", "Ease your workload"),
("../images/categories/cat11.webp", "Videography", "Visualise your story"),
("../images/categories/cat12.webp", "Translation", "Reach new audiences"),
("../images/categories/cat13.webp", "Graphic Design", "Bring it to life");


insert into subcategories(`name`, `category_id`) VALUES
("subcategory1", 3),
("subcategory2", 5),
("subcategory3", 3),
("subcategory4", 2),
("subcategory5", 1),
("subcategory6", 4),
("subcategory7", 5);

alter table projects
add constraint fk2
Foreign Key (category_id) REFERENCES categories(id);


# Challenge 1: Retrieve usernames and email addresses of all users from the 'Utilisateurs' table.
select `fullName`, `email` from users;

# Challenge 2: Fetch project titles and descriptions from the 'Projets' table where the project category is 'Programming'.
select `title`, `description` from projects
join categories on projects.category_id = categories.id
where categories.name = "programming";

# Challenge 3: Count the total number of testimonials in the 'Témoignages' table.
select COUNT(*) from testimonials;

# Challenge 4: Retrieve distinct categories available in the 'Catégories' table.
select DISTINCT * from categories;

# Challenge 5: Show the count of projects in each category from the 'Projets' table.
select `category_id`, count(*) as project_count from projects
GROUP BY category_id;

# Challenge 6: Find the project with the longest description length from the 'Projets' table.
select * from projects
where description = (SELECT max(description) from projects);

# Challenge 7: Retrieve usernames from the 'Utilisateurs' table where the email address contains 'gmail.com'.
SELECT * FROM users
WHERE email like "%gmail.com";

# Challenge 8: Fetch project titles, descriptions, and associated categories from the 'Projets' table joined with the 'Catégories' table.
select p.title, p.description, c.name from projects p
join categories c on p.category_id = c.id;

# Challenge 9: Create a view that displays project titles and associated clients names from the 'Projets' table and 'users' table.
create VIEW projects_User as
select p.title, u.fullName from projects p
join users u on p.user_id = u.id;
SELECT * from projects_User;

# Challenge 10: Display project titles and their corresponding categories, but rename the category column as 'Project_Category'.
select p.title, c.name as Project_Category from projects p
join categories c on p.category_id = c.id;

# Challenge 11: Delete all offers from the 'Offres' table where the amount is less than a specified value.
delete from offers
where price < 4;

# Challenge 12: Update the skills of a specific freelancer in the 'Freelances' table.
UPDATE freelancers
set skills = "C programming, SEO, translate"
where id = 23;

# Challenge 13: Retrieve project titles and descriptions from the 'Projets' table ordered by the project title alphabetically.
select `title`, `description` from projects
ORDER BY title;
