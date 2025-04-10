package gr.aueb.cf.schoolapp.controller;

import gr.aueb.cf.schoolapp.dao.IStudentDAO;
import gr.aueb.cf.schoolapp.dao.StudentDAOImpl;
import gr.aueb.cf.schoolapp.dto.StudentReadOnlyDTO;
import gr.aueb.cf.schoolapp.exceptions.StudentDAOException;
import gr.aueb.cf.schoolapp.exceptions.StudentNotFoundException;
import gr.aueb.cf.schoolapp.service.IStudentService;
import gr.aueb.cf.schoolapp.service.StudentServiceImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/school-app/students/delete")
public class StudentDeleteController extends HttpServlet {

    IStudentDAO studentDAO = new StudentDAOImpl();
    IStudentService studentService = new StudentServiceImpl(studentDAO);
    String message = "";
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        int id = Integer.parseInt(req.getParameter("id"));

        try {
            StudentReadOnlyDTO student = studentService.getStudentById(id);
            studentService.deleteStudent(id);
            req.setAttribute("id", id);
            req.setAttribute("student", student);
            req.setAttribute("firstname",student.getFirstname());
            req.setAttribute("lastname", student.getLastname());
            req.setAttribute("email", student.getEmail());
            req.getRequestDispatcher("/WEB-INF/jsp/student-deleted.jsp").forward(req, resp);
        } catch (StudentDAOException | StudentNotFoundException e) {
            message = e.getMessage();
            req.setAttribute("message", message);
            req.getRequestDispatcher("/WEB-INF/jsp/students.jsp").forward(req,
                    resp);
        }
    }

}
