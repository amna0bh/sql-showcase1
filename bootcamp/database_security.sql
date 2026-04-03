CREATE DATABASE security_log_analysis;
USE security_log_analysis;

CREATE TABLE login_attempts (
id INT PRIMARY KEY, 
user_id INT,
ip_address VARCHAR(45),
country VARCHAR(50), 
login_time DATETIME,
success BOOLEAN
);

INSERT INTO login_attempts VALUES
(1,101,'82.23.12.1','Germany','2026-03-10 10:21:00',TRUE),
(2,101,'82.23.12.1','Germany','2026-03-10 10:22:00',FALSE),
(3,101,'82.23.12.1','Germany','2026-03-10 10:23:00',FALSE),
(4,205,'192.168.1.5','USA','2026-03-11 12:30:00',TRUE),
(5,205,'192.168.1.5','USA','2026-03-11 12:31:00',FALSE),
(6,330,'51.22.91.4','Russia','2026-03-12 02:15:00',FALSE),
(7,330,'51.22.91.4','Russia','2026-03-12 02:16:00',FALSE);

USE security_log_analysis; 

CREATE TABLE users (
user_id INT PRIMARY KEY,
username VARCHAR(50),
email VARCHAR(100),
role VARCHAR(50),
account_created DATE
);

USE security_log_analysis;
CREATE TABLE devices (
device_id INT PRIMARY KEY,
device_type VARCHAR(50),
operating_system VARCHAR(50),
browser VARCHAR(50)
);

INSERT INTO users VALUES

(101, 'Amna', 'amna@company.com','radnica','2021-03-03'),
(205, 'Ahmed', 'ahmed@company.com','administrator','2025-04-04'),
(330,'Alisa','alisa@company.com','radnica','2024-02-02'),
(412,'Mujo','mujo@company.com','radnik','2023-01-01'),
(550,'Suljo','suljo@company.com','šef','2022-05-05');

INSERT INTO devices VALUES
(1,'Laptop','Windows','Chrome'),
(2,'Phone','Android','Firefox'),
(3,'Desktop','Linux','Edge'),
(4,'Tablet','iOS','Safari');

INSERT INTO security_log_analysis.login_attempts (id, user_id, device_id, ip_address, country, login_time, success) VALUES
(1,101,1,'82.23.12.1','Germany','2026-03-10 10:21:00',TRUE),
(2,101,1,'82.23.12.1','Germany','2026-03-10 10:22:00',FALSE),
(3,101,2,'82.23.12.1','Germany','2026-03-10 10:23:00',FALSE),
(4,205,3,'192.168.1.5','USA','2026-03-11 12:30:00',TRUE),
(5,205,3,'192.168.1.5','USA','2026-03-11 12:31:00',FALSE),
(6,330,2,'51.22.91.4','Russia','2026-03-12 02:15:00',FALSE),
(7,330,2,'51.22.91.4','Russia','2026-03-12 02:16:00',FALSE),
(8,412,1,'45.90.10.2','France','2026-03-13 09:00:00',TRUE),
(9,550,4,'120.44.21.3','China','2026-03-14 03:20:00',FALSE),
(10,205,1,'82.23.12.1','Germany','2026-03-10 10:30:00',FALSE);




