package dev.repository;

import dev.domain.Student;
import org.springframework.stereotype.Repository;

import javax.sql.DataSource;
import java.sql.*;
import java.util.Optional;

@Repository
public class StudentRepository {

    private final DataSource dataSource;

    public StudentRepository(DataSource dataSource) {
        this.dataSource = dataSource;
    }

    public void create(Student student) throws SQLException {
        try (Connection connection = dataSource.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(
                     "INSERT INTO students (id, name, email, date_of_birth, gender, quota, country) VALUES (?, ?, ?, ?, ?, ?, ?)"
             )) {
            preparedStatement.setInt(1, student.getId());
            preparedStatement.setString(2, student.getName());
            preparedStatement.setString(3, student.getEmail());
            preparedStatement.setDate(4, Date.valueOf(student.getDateOfBirth()));
            preparedStatement.setString(5, student.getGender());
            preparedStatement.setString(6, student.getQuota());
            preparedStatement.setString(7, student.getCountry());
            preparedStatement.execute();
        }
    }

    public void update(Student student) throws SQLException {
        try (Connection connection = dataSource.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(
                     "UPDATE students SET name = ?, date_of_birth = ?, gender = ?, quota = ?, country = ? WHERE email = ?"
             )) {
            preparedStatement.setString(1, student.getName());
            preparedStatement.setDate(2, Date.valueOf(student.getDateOfBirth()));
            preparedStatement.setString(3, student.getGender());
            preparedStatement.setString(4, student.getQuota());
            preparedStatement.setString(5, student.getCountry());
            preparedStatement.setString(6, student.getEmail());
            preparedStatement.execute();
        }
    }

    public Optional<Student> get(String email) throws SQLException {
        try (Connection connection = dataSource.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(
                     "SELECT id, name, email, date_of_birth, gender, quota, country FROM students WHERE email = ?"
             )) {
            preparedStatement.setString(1, email);
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    return Optional.of(new Student(
                            resultSet.getInt("id"),
                            resultSet.getString("name"),
                            resultSet.getString("email"),
                            resultSet.getDate("date_of_birth").toLocalDate(),
                            resultSet.getString("gender"),
                            resultSet.getString("quota"),
                            resultSet.getString("country")
                    ));
                }
            }
        }
        return Optional.empty();
    }
}
