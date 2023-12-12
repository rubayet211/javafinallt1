package dev.controller;

import dev.domain.Student;
import dev.service.StudentService;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.validation.Valid;
import java.sql.SQLException;

@Controller
public class UserController {

    private StudentService studentService;

    public UserController(StudentService StudentService) {
        this.studentService = StudentService;
    }

    @InitBinder
    public void intiBinder(WebDataBinder webDataBinder) {
        StringTrimmerEditor stringTrimmerEditor = new StringTrimmerEditor(true);
        webDataBinder.registerCustomEditor(String.class, stringTrimmerEditor);
    }

    @RequestMapping("/create")
    public String fourth(Model model) {
        model.addAttribute("user", new Student());
        return "registration";
    }

    @RequestMapping("/store")
    public String fifth(@Valid @ModelAttribute("user") Student user, BindingResult bindingResult) throws SQLException {
        if (bindingResult.hasErrors()) {
            return "registration";
        }
        else {
            studentService.createStudent(user);
            return "confirm";
        }
    }

    @RequestMapping("/get/{email}")
    public String sixth(@PathVariable ("email") String email, Model model) throws SQLException {
        Student user = StudentService.getSt(email);
        model.addAttribute("user", user);
        return "update";
    }

    @RequestMapping("/update")
    public String sixth(@Valid @ModelAttribute("user") Student user, BindingResult bindingResult) throws SQLException {
        if (bindingResult.hasErrors()) {
            return "update";
        }
        else {
            StudentService.update(user);
            return "/";
        }
    }
}
