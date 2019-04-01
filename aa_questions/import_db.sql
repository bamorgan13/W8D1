PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS question_follows;
DROP TABLE IF EXISTS replies;
DROP TABLE IF EXISTS question_likes;
DROP TABLE IF EXISTS questions;
DROP TABLE IF EXISTS users;

CREATE TABLE users (

    id INTEGER PRIMARY KEY
    fname VARCHAR(255) NOT NULL
    lname VARCHAR(255) NOT NULL

);

CREATE TABLE questions (

    id INTEGER PRIMARY KEY
    title VARCHAR(255) NOT NULL
    body TEXT NOT NULL
    user_id INTEGER NOT NULL

    FOREIGN KEY user_id REFERENCES users(id)

);

CREATE TABLE question_follows (

    id INTEGER PRIMARY KEY
    user_id INTEGER NOT NULL
    question_id INTEGER NOT NULL

    FOREIGN KEY user_id REFERENCES users(id)
    FOREIGN KEY question_id REFERENCES questions(id)

);

CREATE TABLE replies (

    id INTEGER PRIMARY KEY
    question_id INTEGER NOT NULL
    parent_reply_id INTEGER
    user_id INTEGER NOT NULL
    body TEXT NOT NULL

    FOREIGN KEY question_id REFERENCES questions(id)
    FOREIGN KEY parent_reply_id REFERENCES replies(id)
    FOREIGN KEY user_id REFERENCES users(id)

);

CREATE TABLE question_likes (

    id INTEGER PRIMARY KEY
    user_id INTEGER NOT NULL
    question_id INTEGER NOT NULL

    FOREIGN KEY user_id REFERENCES users(id)
    FOREIGN KEY question_id REFERENCES questions(id)

);