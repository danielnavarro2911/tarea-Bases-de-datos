CREATE DATABASE Colegio

USE Colegio


CREATE TABLE SCHOOL (
    SchoolId INT PRIMARY KEY,
    SchoolName VARCHAR(50),
    Description VARCHAR(200),
    Address VARCHAR(50),
    Phone VARCHAR(50),
    PostCode VARCHAR(50),
    PostAddress VARCHAR(50)
);


CREATE TABLE CLASS (
    ClassId INT PRIMARY KEY,
    SchoolId INT,
    ClassName VARCHAR(50),
    Description VARCHAR(1000),
    FOREIGN KEY (SchoolId) REFERENCES SCHOOL(SchoolId)
);


CREATE TABLE STUDENT (
    StudentId INT PRIMARY KEY,
    ClassId INT,
    StudentName VARCHAR(50),
    StudentNumber INT,
    TotalGrade FLOAT,
    Address VARCHAR(100),
    Phone VARCHAR(50),
    Email VARCHAR(100),
    FOREIGN KEY (ClassId) REFERENCES CLASS(ClassId)
);


CREATE TABLE COURSE (
    CourseId INT PRIMARY KEY,
    CourseName VARCHAR(50),
    SchoolId INT,
    Description VARCHAR(1000),
    FOREIGN KEY (SchoolId) REFERENCES SCHOOL(SchoolId)
);


CREATE TABLE STUDENT_COURSE (
    StudentId INT,
    CourseId INT,
    PRIMARY KEY (StudentId, CourseId),
    FOREIGN KEY (StudentId) REFERENCES STUDENT(StudentId),
    FOREIGN KEY (CourseId) REFERENCES COURSE(CourseId)
);


CREATE TABLE TEACHER (
    TeacherId INT PRIMARY KEY,
    SchoolId INT,
    TeacherName VARCHAR(50),
    Description VARCHAR(1000),
    FOREIGN KEY (SchoolId) REFERENCES SCHOOL(SchoolId)
);


CREATE TABLE TEACHER_COURSE (
    TeacherId INT,
    CourseId INT,
    PRIMARY KEY (TeacherId, CourseId),
    FOREIGN KEY (TeacherId) REFERENCES TEACHER(TeacherId),
    FOREIGN KEY (CourseId) REFERENCES COURSE(CourseId)
);


CREATE TABLE GRADE (
    GradeId INT PRIMARY KEY,
    StudentId INT,
    CourseId INT,
    Grade FLOAT,
    Comment VARCHAR(1000),
    FOREIGN KEY (StudentId) REFERENCES STUDENT(StudentId),
    FOREIGN KEY (CourseId) REFERENCES COURSE(CourseId)
);