package gr.aueb.cf.schoolapp.controller;

import gr.aueb.cf.schoolapp.dao.CityDAOImpl;
import gr.aueb.cf.schoolapp.dao.ICityDAO;
import gr.aueb.cf.schoolapp.dao.IStudentDAO;
import gr.aueb.cf.schoolapp.dao.StudentDAOImpl;
import gr.aueb.cf.schoolapp.dto.StudentReadOnlyDTO;
import gr.aueb.cf.schoolapp.exceptions.StudentDAOException;
import gr.aueb.cf.schoolapp.exceptions.StudentNotFoundException;
import gr.aueb.cf.schoolapp.model.City;
import gr.aueb.cf.schoolapp.service.CityServiceImpl;
import gr.aueb.cf.schoolapp.service.ICityService;
import gr.aueb.cf.schoolapp.service.IStudentService;
import gr.aueb.cf.schoolapp.service.StudentServiceImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/school-app/students/details")
public class StudentDetailsController extends HttpServlet {

    IStudentDAO studentDAO = new StudentDAOImpl();
    IStudentService studentService = new StudentServiceImpl(studentDAO);
    ICityDAO cityDAO = new CityDAOImpl();
    ICityService cityService = new CityServiceImpl(cityDAO);
    String message = "";

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Integer id = Integer.parseInt(request.getParameter("id"));
        try {
            StudentReadOnlyDTO student = studentService.getStudentById(id);

            String cityName = cityService.getAllCities().stream()
                    .filter(city -> city.getId().equals(student.getCityId())).findFirst().map(City::getName)
                    .orElse("Άγνωστη Πόλη");

            String studyDirectionStr = student.getStudyDirection().toString();
            String registrationYearStr =
                    student.getRegistrationYear().toString();
            String birthDateStr = student.getFormattedBirthDate();

            request.setAttribute("cityName", cityName);
            request.setAttribute("student", student);
            request.setAttribute("studyDirectionStr", studyDirectionStr);
            request.setAttribute("registrationYearStr", registrationYearStr);
            request.setAttribute("birthDateStr", birthDateStr);

            request.getRequestDispatcher("/WEB-INF/jsp/student-details.jsp").forward(request, response);

        } catch (StudentNotFoundException | StudentDAOException e) {
            message = e.getMessage();
            request.setAttribute("message", message);
            request.getRequestDispatcher("/WEB-INF/jsp/students.jsp").forward(request, response);
        } catch (SQLException e) {
            message = e.getMessage();
            request.setAttribute("message", message);
            request.getRequestDispatcher("/WEB-INF/jsp/students.jsp").forward(request, response);
        }
    }
}
