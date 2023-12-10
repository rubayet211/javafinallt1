package dev.repository;

import dev.domain.User;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;

import javax.sql.DataSource;
import java.sql.*;
import java.time.LocalDate;

@Repository
public class UserRepository {

    private DataSource dataSource;

    public UserRepository(DataSource dataSource) {
        this.dataSource = dataSource;
    }

    public void create(User user) throws SQLException {
        Connection connection = dataSource.getConnection();
        PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO users (full_name, email, password, date_of_birth) VALUES (?, ?, ?, ?)");
        preparedStatement.setString(1, user.getFullname());
        preparedStatement.setString(2, user.getEmail());
        preparedStatement.setString(3, user.getPassword());
        preparedStatement.setDate(4, Date.valueOf(user.getDateOfBirth()));
        preparedStatement.execute();
    }

    public void update(User user) throws SQLException {
        Connection connection = dataSource.getConnection();
        PreparedStatement preparedStatement = connection.prepareStatement("UPDATE users set full_name = ?, password = ?, date_of_birth = ? WHERE email = ?");
        preparedStatement.setString(1, user.getFullname());
        preparedStatement.setString(2, user.getPassword());
        preparedStatement.setDate(3, Date.valueOf(user.getDateOfBirth()));
        preparedStatement.setString(4, user.getEmail());
        preparedStatement.execute();
    }

    public User get(String email) throws SQLException {
        Connection connection = dataSource.getConnection();
        PreparedStatement preparedStatement = connection.prepareStatement("SELECT full_name, email, password, date_of_birth FROM users WHERE email = ?");
        preparedStatement.setString(1, email);
        ResultSet resultSet = preparedStatement.executeQuery();
        while (resultSet.next()) {
             return new User(resultSet.getString("full_name"), resultSet.getString("email"), resultSet.getString("password"), resultSet.getDate("date_of_birth").toLocalDate());
        }
        return new User();
    }
}
