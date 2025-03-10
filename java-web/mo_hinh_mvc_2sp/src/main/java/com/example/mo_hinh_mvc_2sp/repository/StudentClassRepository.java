package com.example.mo_hinh_mvc_2sp.repository;

import com.example.mo_hinh_mvc_2sp.model.Student;
import com.example.mo_hinh_mvc_2sp.dto.StudentDto;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class StudentClassRepository implements IStudentClassRepository {
    private final static String SELECT_ALL = "select student.stt,student.id,student.`name`,class.class_name from student left join class on student.id=class.class_id";
    private final static String ADD_NEW = "insert into student ( id, `name`) value(?,?)";
    private final static String EDIT = "update student set  id=?, `name`=? WHERE stt=?";
    private final static String DELETE = "delete from student where stt=?";
    private final static String SEARCH = "SELECT * FROM student WHERE `name` LIKE ?";

    @Override
    public List<StudentDto> getAll() {
        Connection connection = BaseRepository.getConnectDB();
        List<StudentDto> studentClassList = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int stt = resultSet.getInt("stt");
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String className = resultSet.getString("class_name");
                StudentDto studentClass = new StudentDto(stt, id, name, className);
                studentClassList.add(studentClass);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return studentClassList;
    }

    @Override
    public boolean addStudent(Student student) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(ADD_NEW);
            preparedStatement.setInt(1, student.getId());
            preparedStatement.setString(2, student.getName());
            int row = preparedStatement.executeUpdate();
            return row == 1;
        } catch (SQLException e) {
            System.out.println("lỗi");
            return false;
        }
    }

    @Override
    public boolean updateStudent(int id, Student student) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(EDIT);
            preparedStatement.setInt(1, student.getId());
            preparedStatement.setString(2, student.getName());
            preparedStatement.setInt(3, student.getStt());
            int row = preparedStatement.executeUpdate();
            return row == 1;
        } catch (SQLException e) {
            System.out.println("lỗi");
            return false;
        }
    }

    @Override
    public boolean deleteStudent(int stt) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE);
            preparedStatement.setInt(1, stt);
            int row = preparedStatement.executeUpdate();
            return row == 1;
        } catch (SQLException e) {
            System.out.println("lỗi");
            return false;
        }
    }

    @Override
    public List<StudentDto> searchStudent(String name) {
        Connection connection = BaseRepository.getConnectDB();
        List<StudentDto> studentClassList = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SEARCH);
            preparedStatement.setString(1, "%" + name + "%");
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int stt = resultSet.getInt("stt");
                int id = resultSet.getInt("id");
                String nameSearch = resultSet.getString("name");
                String class_name = resultSet.getString("class_name");
                StudentDto studentClass = new StudentDto(stt,id,nameSearch,class_name);
                studentClassList.add(studentClass);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return studentClassList;
    }

    @Override
    public StudentDto findById(int stt) {
        Connection connection = BaseRepository.getConnectDB();
        StudentDto student = null;
        String query  = "select * from student where stt = ?";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1,stt);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                int stt1 = resultSet.getInt("stt");
                int idStudent = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String class_name =  resultSet.getString("class_name");
                student=new StudentDto(stt1,idStudent,name,class_name);
                break;
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return student;
    }
}
