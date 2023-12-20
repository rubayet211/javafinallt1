package dev.service;

import dev.domain.Student;
import dev.repository.StudentRepository;
import org.springframework.stereotype.Service;

import javax.validation.ValidationException;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.Period;
import java.util.List;
import java.util.Optional;

@Service
public class StudentService {

    private final StudentRepository studentRepository;

    public StudentService(StudentRepository studentRepository) {
        this.studentRepository = studentRepository;
    }

    public void createStudent(Student student) throws SQLException {

        student.setName(student.getName().toUpperCase());
        validateDateOfBirth(student.getDateOfBirth());
        studentRepository.createStudent(student);
    }

    public List<Student> getAllStudents() throws SQLException {
        return studentRepository.findAll();
    }

    public Student getStudentById(int id) throws SQLException {
        return studentRepository.findById(id);
    }

    public void updateStudentById(Student updatedStudent) throws SQLException {
        validateDateOfBirth(updatedStudent.getDateOfBirth());
        studentRepository.updateStudentById(updatedStudent);
    }

    public void deleteStudentById(int id) throws SQLException {
        studentRepository.deleteById(id);
    }

    private void validateDateOfBirth(LocalDate dateOfBirth) throws ValidationException {
        if (dateOfBirth == null) {
            throw new ValidationException("Date of Birth is required");
        }

        LocalDate currentDate = LocalDate.now();
        Period period = Period.between(dateOfBirth, currentDate);
        int age = period.getYears();

        if (age < 18) {
            throw new ValidationException("Must be at least 18 years old");
        }
    }
}
