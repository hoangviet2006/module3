package com.example.mo_hinh_mvc_2sp.service;

import com.example.mo_hinh_mvc_2sp.model.Student;
import com.example.mo_hinh_mvc_2sp.dto.StudentDto;
import com.example.mo_hinh_mvc_2sp.repository.StudentClassRepository;

import java.util.List;

public class StudentClassService implements IStudentClassService {
    StudentClassRepository classStudentRepository = new StudentClassRepository();
    @Override
    public List<StudentDto> getAll() {
        return classStudentRepository.getAll();
    }

    @Override
    public boolean addStudent(Student student) {
       return classStudentRepository.addStudent(student);
    }

    @Override
    public boolean updateStudent(int id, Student student) {
        StudentDto student1 = classStudentRepository.findById(id);
        if (student1!=null){
            classStudentRepository.updateStudent(id, student);
            return true;
        }
        return false;
    }

    @Override
    public boolean deleteStudent(int stt) {
        return classStudentRepository.deleteStudent(stt);
    }

    @Override
    public List<StudentDto> searchStudent(String name) {
        return classStudentRepository.searchStudent(name);
    }
}
