package dev.service;

import dev.domain.User;
import dev.repository.UserRepository;
import org.springframework.stereotype.Service;

import java.sql.SQLException;

@Service
public class UserService {

    private UserRepository userRepository;

    public UserService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    public void create(User user) throws SQLException {
        user.setFullname(user.getFullname().toUpperCase());
        userRepository.create(user);
    }

    public void update(User user) throws  SQLException {
        userRepository.update(user);
    }

    public User get(String email) throws SQLException {
        return userRepository.get(email);
    }
}
