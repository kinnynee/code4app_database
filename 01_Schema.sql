/* * DBP Assignment 3 - Group: code4app

 */

-- 1. Tạo bảng Department 
CREATE TABLE Department (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(100) NOT NULL
);

-- 2. Tạo bảng Employee 
-- Lưu ý: supervisor_id là khóa ngoại tham chiếu chính bảng này
CREATE TABLE Employee (
    emp_id INT PRIMARY KEY,
    last_name VARCHAR(50),
    middle_name VARCHAR(50),
    first_name VARCHAR(50),
    dob DATE,
    address VARCHAR(255),
    gender VARCHAR(10),
    salary DECIMAL(10, 2),
    supervisor_id INT,
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES Department(dept_id),
    FOREIGN KEY (supervisor_id) REFERENCES Employee(emp_id) 
);

-- 3. Tạo bảng Project 
CREATE TABLE Project (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(100) NOT NULL
);

-- 4. Tạo bảng Task 
-- Khóa chính là cặp (project_id, task_no)
CREATE TABLE Task (
    project_id INT,
    task_no INT,
    task_name VARCHAR(100),
    PRIMARY KEY (project_id, task_no),
    FOREIGN KEY (project_id) REFERENCES Project(project_id)
);

-- 5. Tạo bảng Works_on 
-- Khóa chính là bộ 3 (emp_id, project_id, task_no)
CREATE TABLE Works_on (
    emp_id INT,
    project_id INT,
    task_no INT,
    hours DECIMAL(5, 2),
    PRIMARY KEY (emp_id, project_id, task_no),
    FOREIGN KEY (emp_id) REFERENCES Employee(emp_id),
    -- FK tham chiếu đến bảng Task phải dùng cả project_id và task_no
    FOREIGN KEY (project_id, task_no) REFERENCES Task(project_id, task_no)
);