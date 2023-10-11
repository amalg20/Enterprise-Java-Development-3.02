-- ------ CREATE A SCHEMA BY FIRST, CHECK IF EXISTS OR NOT -------
DROP SCHEMA IF EXISTS blog;
CREATE SCHEMA blog;
USE blog;

--    -------- CREATE TABLE FOR BLOG ----------
CREATE TABLE author(
id INT NOT NULL AUTO_INCREMENT,
author VARCHAR(255),
PRIMARY KEY (id) );

CREATE TABLE article(
id INT NOT NULL AUTO_INCREMENT,
title VARCHAR(255),
word_count INT,
views INT,
author_id INT not null,
PRIMARY KEY (id),
FOREIGN KEY (author_id) REFERENCES author(id));


-- --------- INSERT VALUES TO AUTHOR TABLES--------
insert into author (author) values 
('Maria Charlotte'),
('Juan Perez'),
('Gemma Alcocer');


--  ------- INSERT VALUES (RECORDS) TO ARTICLE TABLE ----------
insert into article(title, word_count, views, author_id)values
('Best Paint Colors', 814, 14, 1),
('Small Space Decorating Tips', 1146, 221, 2),
('Hot Accessories', 986, 105, 1),
('Mixing Textures', 765, 22, 1),
('Kitchen Refresh', 1242, 307, 2),
('Homemade Art Hacks', 1002, 193, 1),
('Refinishing Wood Floors', 1571, 7542, 3);


--  -----CHECK IF THE VALUES INSERTED CORRECTLY TO THE BLOG TABLE -------
select * from article;
select * from author;

-- true