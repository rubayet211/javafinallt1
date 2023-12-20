package dev.repository;

import dev.domain.Gender;
import dev.domain.Student;
import org.springframework.stereotype.Repository;

import javax.sql.DataSource;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Repository
public class StudentRepository {

    private final DataSource dataSource;

    public StudentRepository(DataSource dataSource) {
        this.dataSource = dataSource;
    }

    public void createStudent(Student student) throws SQLException {
        try (Connection connection = dataSource.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(
                     "INSERT INTO student (id, name, email, dateOfBirth, gender, quota, country) VALUES (?, ?, ?, ?, ?, ?, ?)"
             )) {
            preparedStatement.setInt(1, student.getId());
            preparedStatement.setString(2, student.getName());
            preparedStatement.setString(3, student.getEmail());
            preparedStatement.setDate(4, Date.valueOf(student.getDateOfBirth()));
            preparedStatement.setString(5, student.getGender().toString());
            preparedStatement.setString(6, student.getQuota());
            preparedStatement.setString(7, student.getCountry());
            preparedStatement.execute();
        }
    }

    public List<Student> findAll() throws SQLException {
        List<Student> students = new ArrayList<>();
        String sql = "SELECT id, name, email, dateOfBirth, gender, quota, country FROM student";

        try (Connection connection = dataSource.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(sql);
             ResultSet resultSet = preparedStatement.executeQuery()) {

            while (resultSet.next()) {
                Student student = new Student();
                student.setId(resultSet.getInt("id"));
                student.setName(resultSet.getString("name"));
                student.setEmail(resultSet.getString("email"));
                student.setDateOfBirth(resultSet.getDate("dateOfBirth").toLocalDate());
                student.setGender(Gender.valueOf(resultSet.getString("gender")));
                student.setQuota(resultSet.getString("quota"));
                student.setCountry(resultSet.getString("country"));
                students.add(student);
            }
        }

        return students;
    }
    public Student findById(int id) throws SQLException {
        Connection connection = dataSource.getConnection();
        String sql = "SELECT * FROM student WHERE id = ?";
        try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setLong(1, id);
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    Student student = new Student();
                    student.setId(resultSet.getInt("id"));
                    student.setName(resultSet.getString("name"));
                    student.setEmail(resultSet.getString("email"));
                    student.setDateOfBirth(resultSet.getDate("dateOfBirth").toLocalDate());
                    student.setGender(Gender.fromString(resultSet.getString("gender")));
                    student.setQuota(resultSet.getString("quota"));
                    student.setCountry(resultSet.getString("country"));
                    return student;
                } else {
                    return null;
                }
            }
        }
    }

    public void updateStudentById(Student updatedStudent) throws SQLException {
        Connection connection = dataSource.getConnection();
        String sql = "UPDATE student SET name=?, email=?, dateOfBirth=?, gender=?, quota=?, country=? WHERE id=?";
        try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setString(1, updatedStudent.getName());
            preparedStatement.setString(2, updatedStudent.getEmail());
            preparedStatement.setDate(3, Date.valueOf(updatedStudent.getDateOfBirth()));
            preparedStatement.setString(4, updatedStudent.getGender().toString());
            preparedStatement.setString(5, updatedStudent.getQuota());
            preparedStatement.setString(6, updatedStudent.getCountry());
            preparedStatement.setInt(7, updatedStudent.getId());
            preparedStatement.executeUpdate();
        }
    }

    public void deleteById(int id) throws SQLException {
        Connection connection = dataSource.getConnection();
        String sql = "DELETE FROM student WHERE id = ?";
        try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setInt(1, id);
            preparedStatement.executeUpdate();
        }
    }


}
