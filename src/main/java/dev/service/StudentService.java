package dev.service;

import dev.domain.Student;
import dev.repository.StudentRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.sql.SQLException;
import java.util.Optional;

@Service
public class StudentService {

    private final StudentRepository studentRepository;

    public StudentService(StudentRepository studentRepository) {
        this.studentRepository = studentRepository;
    }

    public void createStudent(Student student) throws SQLException {

        student.setName(student.getName().toUpperCase());
        studentRepository.create(student);
    }

    public void updateStudent(Student student) throws SQLException {

        studentRepository.update(student);
    }

    public Optional<Student> getStudentByID(int id) throws SQLException {
        return studentRepository.get(String.valueOf(id));
    }
}
