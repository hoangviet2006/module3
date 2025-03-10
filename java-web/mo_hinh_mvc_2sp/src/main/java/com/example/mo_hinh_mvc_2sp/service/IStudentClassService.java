package com.example.mo_hinh_mvc_2sp.service;

import com.example.mo_hinh_mvc_2sp.model.Student;
import com.example.mo_hinh_mvc_2sp.dto.StudentDto;

import java.util.List;

public interface IStudentClassService {
    List<StudentDto> getAll();
    boolean addStudent(Student student);
    boolean updateStudent(int id,Student student);
    boolean deleteStudent(int stt);
    List<StudentDto> searchStudent(String name);
}
