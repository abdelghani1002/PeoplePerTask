-- Active: 1700478060584@@127.0.0.1@3306@peoplepertask
create database peoplepertask;
use peoplepertask;

create table users (
	id int primary key auto_increment,
    `fullName` varchar(255) not null,
    `email` varchar(255) not null,
    `password` varchar(255) not null,
    `job` varchar(255) not null,
    `profil_image_src` varchar(255) not null
);

insert into users (fullName, email, password, job, profil_image_src) values
('astuehmeier0', 'jrosenstock0@feedburner.com', '$2a$04$pmD2oaZEbYjLgbx5G3wadOJ142fzw2BGbfj/OKWtJFc/2jgWiL8eW', 'Programmer IV', '1st //Floor'),
('dalldis1', 'gnizet1@de.vu', '$2a$04$iw8A5ASmpG7io/F3/B4PpuVPvoMFAo6znrkk3syF2TYmTsjWv1UiC', 'Database Administrator III', '/Sui/te 56'),
('emitchard2', 'dboggs2@unesco.org', '$2a$04$KDTTXp6D50jYlWBXAo/IP.kqt/z1kxTNz/2zN9p2rfUE/.r8bVnim', 'Internal Auditor', '20th //Floor'),
('fgillingham3', 'aalps3@smh.com.au', '$2a$04$0M.RBJ.aEdAMuNnosrIOIONG3I5GAwbv8XMrLFygXYoieUor3yTeW', 'Financial Advisor', 'PO Box //43504'),
('tmeran4', 'egrouvel4@dot.gov', '$2a$04$616thui15puZQn2lPeVcgeGKm8oCC1Ir0.cvaCPpAqopTiMCi.5F6', 'Clinical Specialist', '/Ap/t 981'),
('atyers5', 'eblade5@psu.edu', '$2a$04$V43jnyNaEJu0iAZm0STL2OF8LgIOgOhkqHAqjfSMygFFj/T24nC1m', 'Mechanical Systems Engineer', 'PO Box //21067'),
('spickford6', 'gmcgeouch6@npr.org', '$2a$04$Cowfwn0yBqFjyGnTM6.s9uqecv3GPD7dWsDgWUTU3SMaiDFrKihQK', 'Librarian', '/Roo/m 208'),
('rchittock7', 'hfick7@goo.gl', '$2a$04$tS2UGlpqLLKExV4bdgt76OArHlSjmLb45j7lzlhIXSUhRXQsbtXcu', 'Graphic Designer', '15th //Floor'),
('dcamm8', 'rminichi8@techcrunch.com', '$2a$04$iVmS4E2byToWARJWNnwh8ul0AsQwEqsT0x4Q4gyJ7.Tt89fXJmsBm', 'Structural Engineer', '17th //Floor'),
( 'adwyer9', 'npring9@fastcompany.com', '$2a$04$h7svq1wZQwaxNHAQFrKsj.skUz8ogarmuKdr6rZqnAUR/4i3KB7zq', 'Engineer II', 'PO/Box/14955');


create table freelancers (
	id int primary key auto_increment,
    freelancerName varchar(255) unique,
    skills varchar(255),
    user_id int UNIQUE,
    FOREIGN KEY (user_id) REFERENCES users(id)  on delete CASCADE
);

insert into freelancers (freelancerName, skills, user_id) values
('phinkens0', 'web design, SEO, skill3', 10),
('avanoort1', 'skill1, skill2, skill3', 8),
('slynch2', 'skill1, skill2, skill3, skill4', 3),
('dtommen3', 'skill1', 7),
('moliver4', 'skill1, skill2, skill3', 9),
('dcorrington5', 'skill1, skill2, skill3, skill4', 6),
('zhealks6', 'skill1, skill2', 4),
('mmcreath7', 'web design, SEO, skill3', 2),
('jcyples8', 'skill1, skill2', 5),
('rkirkup9', 'skill1, skill2, skill3, skill4', 1);

create table testimonials (
	`id` int primary key auto_increment,
    `comment` text not null,
    `user_id` int,
    foreign key (user_id) references users(id) on delete set null
);

insert into testimonials (comment, user_id) values 
('In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.', 1),
('Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.', 2),
('Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.', 3),
('Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.', 4),
('Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.', 5),
('Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.', 6),
('Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.', 7),
('Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.', 8),
('In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.', 9),
('Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.', 10);

create table offers (
	id int primary key auto_increment,
    photo_src varchar(255) not null,
    title varchar(255) not null,
    price decimal(10, 2) not null,
    delay time not null,
    freelancer_id int not null,
    FOREIGN KEY (freelancer_id) references freelancers(id) on delete CASCADE
);

insert into offers(`photo_src`, `title`, `price`, `delay`, `freelancer_id`) VALUES
("../images/offers/offer1.png", "Design Responsive, SEO friendly & Fast Loading WordPress website", 205, "120:00:00", 5),
("../images/offers/offer2.png", "Design Responsive, SEO friendly & Fast Loading WordPress website", 400, "96:00:00", 7),
("../images/offers/offer3.png", "Design Responsive, SEO friendly & Fast Loading WordPress website", 360, "48:00:00", 9),
("../images/offers/offer4.png", "Design Responsive, SEO friendly & Fast Loading WordPress website", 140, "24:00:00", 2),
("../images/offers/offer5.png", "Design Responsive, SEO friendly & Fast Loading WordPress website", 50, "144:00:00", 4);

create table projects (
	id int primary key auto_increment,
    title varchar(255) not null,
    description text not null,
    price decimal(10, 2) not null,
    user_id int not null,
    category_id int,
    FOREIGN KEY (user_id) REFERENCES users(id) on delete CASCADE,
    FOREIGN KEY (category_id) REFERENCES categories(id) on delete set null
);

INSERT into projects(`title`, `description`, `price`, `user_id`, `category_id`) values
("project1", "project1 description", 230, 1, 3),
("project1", "project1 description", 30, 3, 2),
("project1", "project1 description", 330, 2, 5),
("project1", "project1 description", 70, 5, 1),
("project1", "project1 description", 90, 3, 4);

create table categories(
	id int primary key auto_increment,
    photo_src varchar(255) not null,
    name varchar(255) not null,
	slogan varchar(255) not null
);

insert into categories(`photo_src`, `name`, `slogan`) values ("../images/categories/cat13.webp", "Graphic Design", "Bring it to life")
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

create table subcategories(
	id int primary key auto_increment,
    name varchar(255) not null,
    category_id int,
    FOREIGN KEY (category_id) REFERENCES categories(id)
);

insert into subcategories(`name`, `category_id`) VALUES
("subcategory1", 3),
("subcategory2", 5),
("subcategory3", 3),
("subcategory4", 2),
("subcategory5", 1),
("subcategory6", 4),
("subcategory7", 5);

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
where CHARACTER_LENGTH(description) = (SELECT max(CHARACTER_LENGTH(description)) from projects);

# Challenge 7: Retrieve usernames from the 'Utilisateurs' table where the email address contains 'gmail.com'.
SELECT * FROM users
WHERE email like "%gmail.com";

# Challenge 8: Fetch project titles, descriptions, and associated categories from the 'Projets' table joined with the 'Catégories' table.
select p.title, p.description, c.name from projects p
join categories c on p.category_id = c.id;

# Challenge 9: Create a view that displays project titles and associated clients names from the 'Projets' table and 'users' table.
create VIEW projects_User as
select p.title, u.fullName as ClientName from projects p
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
set skills = "C programming, SEO, translate, logo design"
where id = 3;

# Challenge 13: Retrieve project titles and descriptions from the 'Projets' table ordered by the project title alphabetically.
select `title`, `description` from projects
ORDER BY title ; #desc
