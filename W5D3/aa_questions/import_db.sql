


DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS questions;
DROP TABLE IF EXISTS question_follows;
DROP TABLE IF EXISTS replies;
DROP TABLE IF EXISTS question_likes;
PRAGMA foreign_keys = ON;

CREATE TABLE users (
    id INTEGER PRIMARY KEY,
    fname TEXT NOT NULL,
    lname TEXT NOT NULL
);


CREATE TABLE questions (
    id INTEGER PRIMARY KEY,
    title TEXT NOT NULL,
    body TEXT NOT NULL,
    author_id INTEGER NOT NULL,

    FOREIGN KEY (author_id) REFERENCES users(id)
);


CREATE TABLE question_follows (
    id INTEGER PRIMARY KEY,
    user_id INTEGER NOT NULL,
    question_id INTEGER NOT NULL,
        
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (question_id) REFERENCES questions(id)
);


CREATE TABLE replies (
    id INTEGER PRIMARY KEY,
    question_id INTEGER NOT NULL,
    author_id INTEGER NOT NULL,
    parent_reply_id INTEGER,
    body TEXT NOT NULL,

    FOREIGN KEY (author_id) REFERENCES users(id),
    FOREIGN KEY (question_id) REFERENCES questions(id),
    FOREIGN KEY (parent_reply_id) REFERENCES replies(id)


);


CREATE TABLE question_likes (
    id INTEGER PRIMARY KEY,
    user_id INTEGER NOT NULL,
    question_id INTEGER NOT NULL,
        
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (question_id) REFERENCES questions(id)
);


INSERT INTO 
users(fname, lname)
VALUES
('Ben', 'Giller'), ('Grecia', 'Ro'),('Great','Instructor');

INSERT INTO 
questions(title, body, author_id)
VALUES
('Bathroom?', 'Can I go to the bathroom please?', (SELECT users.id FROM users WHERE users.fname = 'Ben' AND users.lname='Giller') ),
('Bathroom_again?', 'Can I go to the bathroom again?', (SELECT users.id FROM users WHERE users.fname = 'Grecia' AND users.lname='Ro') );

INSERT INTO
question_follows(user_id,question_id)
VALUES
( (SELECT users.id FROM users WHERE fname='Ben' AND lname='Giller'),(SELECT questions.id FROM questions WHERE title='Bathroom?') ),
((SELECT users.id FROM users WHERE fname='Grecia' AND lname='Ro'),(SELECT questions.id FROM questions WHERE title='Bathroom_again?'));

INSERT INTO 
replies(question_id, author_id, parent_reply_id, body)
VALUES
(
(SELECT questions.id FROM questions WHERE title='Bathroom?'), (SELECT users.id FROM users WHERE fname='Great' AND lname='Instructor'), 
(SELECT replies.parent_reply_id FROM replies WHERE body='No'),'No'),
(
(SELECT questions.id FROM questions WHERE title='Bathroom_again?'), (SELECT users.id FROM users WHERE fname='Great' AND lname='Instructor'), 
(SELECT replies.parent_reply_id FROM replies WHERE body='Yes'),'Yes');


INSERT INTO
question_likes (user_id,question_id)
VALUES
( (SELECT users.id FROM users WHERE fname='Grecia' AND lname='Ro'),(SELECT questions.id FROM questions WHERE title='Bathroom?') ),
((SELECT users.id FROM users WHERE fname='Ben' AND lname='Giller'),(SELECT questions.id FROM questions WHERE title='Bathroom_again?'));