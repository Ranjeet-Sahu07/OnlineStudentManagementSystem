-- Courses Table Schema
-- Creates table for storing course information

CREATE TABLE IF NOT EXISTS courses (
    course_id BIGINT PRIMARY KEY AUTO_INCREMENT,
    course_name VARCHAR(100) NOT NULL UNIQUE,
    duration_months INT NOT NULL,
    fee DECIMAL(10, 2) NOT NULL,
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Sample Data
INSERT INTO courses (course_name, duration_months, fee, description) VALUES
('Java Full Stack Development', 6, 50000.00, 'Complete Java, Spring Boot, React, and MySQL'),
('Data Science with Python', 8, 60000.00, 'Python, Machine Learning, Deep Learning, and Data Analysis'),
('Web Development Bootcamp', 4, 35000.00, 'HTML, CSS, JavaScript, Node.js, and MongoDB'),
('Cloud Computing with AWS', 5, 45000.00, 'AWS Services, EC2, S3, Lambda, and DevOps'),
('Mobile App Development', 6, 48000.00, 'Android, iOS, React Native, and Flutter');

-- View Courses
SELECT * FROM courses;
