-- Create our Database let the character set defualt
CREATE DATABASE IF NOT EXISTS sqlWeek3;
use sqlWeek3;
select database();
show tables;
-- Create User table
CREATE TABLE IF NOT EXISTS users (
user_id INT AUTO_INCREMENT PRIMARY KEY,
username VARCHAR(255) NOT NULL,
password VARCHAR(255) NOT NULL,
email VARCHAR(255) NOT NULL );
-- Create Post table
-- Posts are being limited to 16K of text. If graphics were desired would change to a BLOB
-- Post_data , as Text type,  is being cached outside the in memory DB 
-- If a user is deleted all their posts are deleted as well
CREATE TABLE IF NOT EXISTS posts (
post_id INT AUTO_INCREMENT PRIMARY KEY,
user_id INT NOT NULL,
created_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
post_data TEXT,
FOREIGN KEY (user_id)
        REFERENCES USERS (user_id)
        ON UPDATE CASCADE ON DELETE CASCADE );
-- Create Comments table
-- Comments are being limite to 16K of text as well (see post table comments)
-- If a post is deleted all the comments are deleted as well, a comment may be orphaned by a user
-- Application logic resets the comment_id sequence for new posts.
CREATE TABLE IF NOT EXISTS comments (
comment_id INT  AUTO_INCREMENT ,
post_id INT NOT NULL,
user_id INT ,
created_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
comment_data TEXT,
PRIMARY KEY (comment_id , post_id),
FOREIGN KEY (user_id)
        REFERENCES USERS (user_id)
        ON UPDATE CASCADE ON DELETE SET NULL );
Show tables;
desc users;
desc posts;
desc comments;
-- Student Note :  Due to some install problems the ENGINE types do not match
-- To display the foreign key relations need to query the constraints table
select * from information_schema.referential_constraints where constraint_schema = 'sqlweek3';