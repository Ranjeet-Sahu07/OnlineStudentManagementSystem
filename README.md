# 🎓 Online Student Management System

## Spring + Hibernate Mini Project with Dependency Injection & Transaction Management

[![Java](https://img.shields.io/badge/Java-11+-orange.svg)](https://www.oracle.com/java/)
[![Spring](https://img.shields.io/badge/Spring-5.3.23-green.svg)](https://spring.io/)
[![Hibernate](https://img.shields.io/badge/Hibernate-5.6.14-blue.svg)](https://hibernate.org/)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)

---

## 📋 Table of Contents

- [Project Overview](#project-overview)
- [Features](#features)
- [Technologies Used](#technologies-used)
- [Project Structure](#project-structure)
- [Database Schema](#database-schema)
- [Setup Instructions](#setup-instructions)
- [How to Run](#how-to-run)
- [Code Documentation](#code-documentation)

---

## 🚀 Project Overview

This is a **complete console-based Student Management System** built using:
- ✅ **Spring Framework** (Java-based configuration, no XML)
- ✅ **Hibernate ORM** for database operations
- ✅ **Dependency Injection** (Constructor/Setter DI)
- ✅ **Transaction Management** (@Transactional)
- ✅ **Layered Architecture** (Model → DAO → Service → Controller)
- ✅ **CRUD Operations** on Students & Courses
- ✅ **Fee Payment & Refund System**

---

## ✨ Features

### Student Management
- ✅ Add new students
- ✅ View all students
- ✅ Update student details
- ✅ Delete students
- ✅ Assign courses to students

### Course Management
- ✅ Add new courses
- ✅ View all courses
- ✅ Update course details
- ✅ Delete courses

### Fee Management
- ✅ Pay fees (with transaction management)
- ✅ Refund fees (rollback on failure)
- ✅ View payment history
- ✅ Balance tracking

### Transaction Management
- ✅ **@Transactional** annotation for atomicity
- ✅ Automatic rollback on exceptions
- ✅ Payment records saved automatically

---

## 🛠️ Technologies Used

| Technology | Version | Purpose |
|------------|---------|----------|
| Java | 11+ | Programming Language |
| Spring Context | 5.3.23 | Dependency Injection |
| Spring ORM | 5.3.23 | ORM Integration |
| Spring TX | 5.3.23 | Transaction Management |
| Hibernate Core | 5.6.14 | ORM Framework |
| MySQL | 8.0.33 | Database |
| Maven | 3.6+ | Build Tool |
| SLF4J/Logback | 1.7.36/1.2.11 | Logging |

---

## 📁 Project Structure

```
OnlineStudentManagementSystem/
├── src/main/java/com/example/sms/
│   ├── config/
│   │   └── AppConfig.java              # Spring Java Configuration
│   ├── model/
│   │   ├── Student.java                # Student Entity
│   │   ├── Course.java                 # Course Entity
│   │   └── Payment.java                # Payment Entity
│   ├── dao/
│   │   ├── StudentDAO.java             # Student Data Access
│   │   ├── CourseDAO.java              # Course Data Access
│   │   └── PaymentDAO.java             # Payment Data Access
│   ├── service/
│   │   ├── StudentService.java         # Student Service Interface
│   │   ├── CourseService.java          # Course Service Interface
│   │   ├── FeeService.java             # Fee Service Interface
│   │   └── impl/
│   │       ├── StudentServiceImpl.java # Student Service Implementation
│   │       ├── CourseServiceImpl.java  # Course Service Implementation
│   │       └── FeeServiceImpl.java     # Fee Service with @Transactional
│   ├── controller/
│   │   └── MainApp.java                # Console-based Main Application
│   └── util/
│       └── HibernateUtil.java          # Hibernate SessionFactory Utility
│
├── src/main/resources/
│   ├── hibernate.cfg.xml               # Hibernate Configuration
│   └── application.properties          # Application Properties
│
├── SQL/
│   ├── students.sql                    # Students Table Schema
│   ├── courses.sql                     # Courses Table Schema
│   └── payments.sql                    # Payments Table Schema
│
├── pom.xml                             # Maven Dependencies
└── README.md                           # This File
```

---

## 🗄️ Database Schema

### Students Table
```sql
CREATE TABLE students (
    student_id BIGINT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone VARCHAR(15),
    course_id BIGINT,
    balance DECIMAL(10, 2) DEFAULT 0.00,
    enrollment_date DATE,
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);
```

### Courses Table
```sql
CREATE TABLE courses (
    course_id BIGINT PRIMARY KEY AUTO_INCREMENT,
    course_name VARCHAR(100) NOT NULL UNIQUE,
    duration_months INT,
    fee DECIMAL(10, 2)
);
```

### Payments Table
```sql
CREATE TABLE payments (
    payment_id BIGINT PRIMARY KEY AUTO_INCREMENT,
    student_id BIGINT NOT NULL,
    amount DECIMAL(10, 2) NOT NULL,
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    payment_type VARCHAR(20),
    FOREIGN KEY (student_id) REFERENCES students(student_id)
);
```

---

## ⚙️ Setup Instructions

### Prerequisites
- ✅ Java 11 or higher
- ✅ Maven 3.6+
- ✅ MySQL 8.0+
- ✅ IDE (IntelliJ IDEA / Eclipse / VS Code)

### Step 1: Clone the Repository
```bash
git clone https://github.com/Ranjeet-Sahu07/OnlineStudentManagementSystem.git
cd OnlineStudentManagementSystem
```

### Step 2: Create Database
```sql
CREATE DATABASE student_management_db;
USE student_management_db;

-- Run SQL scripts from SQL folder
source SQL/courses.sql;
source SQL/students.sql;
source SQL/payments.sql;
```

### Step 3: Update Database Configuration
Edit `src/main/resources/hibernate.cfg.xml`:
```xml
<property name="hibernate.connection.url">jdbc:mysql://localhost:3306/student_management_db</property>
<property name="hibernate.connection.username">YOUR_USERNAME</property>
<property name="hibernate.connection.password">YOUR_PASSWORD</property>
```

### Step 4: Build the Project
```bash
mvn clean install
```

---

## ▶️ How to Run

### Using Maven
```bash
mvn exec:java -Dexec.mainClass="com.example.sms.controller.MainApp"
```

### Using IDE
1. Import project as Maven project
2. Run `MainApp.java` from `src/main/java/com/example/sms/controller/`

### Console Menu
```
========== Student Management System ==========
1. Add Student
2. View All Students
3. Update Student
4. Delete Student
5. Add Course
6. View All Courses
7. Assign Course to Student
8. Pay Fees
9. Refund Fees
10. View Payment History
0. Exit
================================================
Enter your choice:
```

---

## 📚 Core Concepts Demonstrated

### 1. Dependency Injection (Spring Java Config)
```java
@Configuration
@ComponentScan(basePackages = "com.example.sms")
public class AppConfig {
    
    @Bean
    public StudentDAO studentDAO() {
        return new StudentDAO();
    }
    
    @Bean
    public StudentService studentService() {
        StudentServiceImpl service = new StudentServiceImpl();
        service.setStudentDAO(studentDAO()); // Setter DI
        return service;
    }
}
```

### 2. Transaction Management
```java
@Service
public class FeeServiceImpl implements FeeService {
    
    @Transactional
    public void payFees(Long studentId, BigDecimal amount) {
        // Update student balance
        Student student = studentDAO.getById(studentId);
        student.setBalance(student.getBalance().subtract(amount));
        studentDAO.update(student);
        
        // Save payment record
        Payment payment = new Payment(studentId, amount, "FEE_PAYMENT");
        paymentDAO.save(payment);
        
        // If any exception occurs, entire transaction rolls back
    }
}
```

### 3. Hibernate CRUD Operations
```java
public class StudentDAO {
    
    public void save(Student student) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        session.save(student);
        tx.commit();
        session.close();
    }
    
    public List<Student> getAll() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        List<Student> students = session.createQuery("FROM Student", Student.class).list();
        session.close();
        return students;
    }
}
```

---

## 📝 Complete Code Files

For the complete source code of all files, please check the repository structure. Key files already created:
- ✅ `pom.xml` - Maven dependencies
- ✅ `Student.java` - Complete Student entity with annotations
- ⚠️ Additional files need to be created (see [File Creation Guide](#file-creation-guide))

---

## 🎯 File Creation Guide

To complete the project, create the remaining files with the following structure:

### Model Classes (Already Started)
- ✅ `Student.java` (Created)
- 📝 `Course.java` - Course entity
- 📝 `Payment.java` - Payment entity

### DAO Classes
- 📝 `StudentDAO.java` - CRUD for students
- 📝 `CourseDAO.java` - CRUD for courses  
- 📝 `PaymentDAO.java` - CRUD for payments

### Service Layer
- 📝 `StudentService.java` (interface)
- 📝 `StudentServiceImpl.java`
- 📝 `CourseService.java` (interface)
- 📝 `CourseServiceImpl.java`
- 📝 `FeeService.java` (interface)
- 📝 `FeeServiceImpl.java` (with @Transactional)

### Configuration
- 📝 `AppConfig.java` - Spring Java Config
- 📝 `HibernateUtil.java` - SessionFactory utility
- 📝 `hibernate.cfg.xml` - Hibernate config

### Controller
- 📝 `MainApp.java` - Console menu application

### SQL Scripts
- 📝 `students.sql`
- 📝 `courses.sql`
- 📝 `payments.sql`

---

## 🤝 Contributing

Contributions are welcome! Feel free to:
1. Fork the repository
2. Create feature branches
3. Submit pull requests

---

## 📄 License

This project is open source and available under the [MIT License](LICENSE).

---

## 👨‍💻 Author

**Ranjeet Sahu**
- GitHub: [@Ranjeet-Sahu07](https://github.com/Ranjeet-Sahu07)

---

## 📞 Support

If you encounter any issues or have questions:
1. Check existing issues
2. Create a new issue with detailed description
3. Include error logs and screenshots

---

**⭐ If you find this project helpful, please give it a star!**
