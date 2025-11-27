📂 Cấu trúc Dự án
```text
code4app_database/
├── 01_Schema.sql          # Script tạo bảng (Chạy file này ĐẦU TIÊN)
├── 02_MockData.sql        # Script thêm dữ liệu mẫu (Chạy file này THỨ HAI)
├── procedures/            # Thư mục chứa các Stored Procedures
│   ├── sp_AddEmployee.sql
│   ├── sp_UpdateSalary.sql
│   ├── sp_AssignTask.sql
│   └── sp_GetEmployeesByDepartment.sql
├── test_cases.sql         # Script chạy thử nghiệm các hàm
└── README.md              # Hướng dẫn sử dụng
