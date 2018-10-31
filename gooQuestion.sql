/** 
   Есть таблица users [ id (int), email (str), score (int), company_id(int) ] 
   со связью один ко многим с таблицей companies [ id(int), name(str) ] 
   получить выборку [ id, email, score, company_id ] с максимальным score по каждой компании
 
   [Users]
       ID      |       email      |     score      |      company_id     
   --------------------------------------------------------------------
     1         | user1@test.home  |    8           |     1
     2         | user2@test.home  |    8           |     2
     3         | user3@test.home  |    4           |     1
     4         | user4@test.home  |    1           |     2
     5         | user5@test.home  |    2           |     1
     6         | user6@test.home  |    3           |     2 
     7         | user7@test.home  |    0           |     1
     8         | user8@test.home  |    6           |     2
     9         | user9@test.home  |    9           |     1


   [Result]
       ID      |       email      |     score      |      company_id     
   --------------------------------------------------------------------
     9         | user9@test.home  |    9           |     1
     2         | user2@test.home  |    8           |     2
 */
/**
 * Author:  andrey
 * Created: 31.10.2018
 */

CREATE TABLE `users` (
	`ID` INT NOT NULL Primary key,
	`email` varchar(100) NOT NULL,
	`score` INT NULL,
	`company_id` INT NULL
)
ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE `companies` (
	`ID` INT NOT NULL Primary key,
	`name` varchar(100) NOT NULL
)
ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO users.users
(ID, email, score, company_id)
VALUES(1, 'user1@test.home', 8, 1);
INSERT INTO users.users
(ID, email, score, company_id)
VALUES(2, 'user2@test.home', 8, 2);
INSERT INTO users.users
(ID, email, score, company_id)
VALUES(3, 'user3@test.home', 4, 1);
INSERT INTO users.users
(ID, email, score, company_id)
VALUES(4, 'user4@test.home', 1, 2);
INSERT INTO users.users
(ID, email, score, company_id)
VALUES(5, 'user5@test.home', 2, 1);
INSERT INTO users.users
(ID, email, score, company_id)
VALUES(6, 'user6@test.home', 3, 2);
INSERT INTO users.users
(ID, email, score, company_id)
VALUES(7, 'user7@test.home', 0, 1);
INSERT INTO users.users
(ID, email, score, company_id)
VALUES(8, 'user8@test.home', 6, 2);
INSERT INTO users.users
(ID, email, score, company_id)
VALUES(9, 'user9@test.home', 9, 1);

INSERT INTO users.companies
(ID, name)
VALUES(1, 'company 1');
INSERT INTO users.companies
(ID, name)
VALUES(2, 'company 2');

/**
* Вот собственно и сам запрос
* 
*/

SELECT ID, email, score, company_id
FROM users t1 WHERE score=(SELECT MAX(t2.score)
FROM users t2 WHERE t1.company_id = t2.company_id)
ORDER BY company_id ASC;

