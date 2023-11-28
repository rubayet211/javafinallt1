package dev.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@Controller
public class FirstController {

    @RequestMapping("/first")
    public void first(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String name = request.getParameter("q") == null ? "" : request.getParameter("q");
        PrintWriter printWriter = response.getWriter();
        printWriter.write("Hello Spring World!!!" + name);
    }

    @RequestMapping("/second")
    public String second() {
        /*System.out.println("I am invoked");*/
        return "first";
    }

    @RequestMapping("/third")
    public String third(Model model) {
        model.addAttribute("name", "Mir Md Kawsur");
        model.addAttribute("email", "kawsur@aiub.edu");
        return "first";
    }

    @RequestMapping("/fourth")
    public String fourth() {
        return "registration";
    }

    @RequestMapping("/fifth")
    public String fifth(HttpServletRequest request, HttpServletResponse response, Model model) {
        String fullname = request.getParameter("fullname");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        model.addAttribute("fullname", fullname);
        model.addAttribute("email", email);
        model.addAttribute("password", password);
        return "confirm";
    }
}
