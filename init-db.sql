create database if not exists testdb;
use testdb;

create table if not exists users (
id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(255) NOT NULL
);

INSERT INTO users (name) VALUES ('surjit');
INSERT INTO users (name) VALUES ('kausik');