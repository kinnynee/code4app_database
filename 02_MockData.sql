-- 1. Thêm dữ liệu Department
INSERT INTO Department (dept_id, dept_name) VALUES 
(1, 'Software Development'),
(2, 'Human Resources'),
(3, 'Marketing');

-- 2. Thêm dữ liệu Employee (Supervisor trước)
-- Ông sếp lương 5000
INSERT INTO Employee (emp_id, last_name, middle_name, first_name, dob, address, gender, salary, supervisor_id, dept_id) VALUES
(100, 'Tran', 'Trung', 'Kien', '2003-01-01', 'HCM City', 'Male', 5000.00, NULL, 1);

-- Nhân viên lính (Lương 2000 < 5000 -> Hợp lệ)
INSERT INTO Employee (emp_id, last_name, middle_name, first_name, dob, address, gender, salary, supervisor_id, dept_id) VALUES
(101, 'Nguyen', 'Van', 'A', '2003-05-10', 'Hanoi', 'Male', 2000.00, 100, 1),
(102, 'Le', 'Thi', 'B', '2003-08-20', 'Danang', 'Female', 2500.00, 100, 1);

-- 3. Thêm dữ liệu Project
INSERT INTO Project (project_id, project_name) VALUES
(10, 'Website Redesign'),
(20, 'Mobile App Dev');

-- 4. Thêm dữ liệu Task
-- Project 10 có 4 task (để test luật max 3 task)
INSERT INTO Task (project_id, task_no, task_name) VALUES
(10, 1, 'Frontend Setup'),
(10, 2, 'Backend Setup'),
(10, 3, 'Database Design'),
(10, 4, 'Testing');

-- 5. Thêm dữ liệu Works_on (Phân công việc ban đầu)
INSERT INTO Works_on (emp_id, project_id, task_no, hours) VALUES
(101, 10, 1, 20.5), -- NV 101 làm task 1
(101, 10, 2, 15.0); -- NV 101 làm task 2