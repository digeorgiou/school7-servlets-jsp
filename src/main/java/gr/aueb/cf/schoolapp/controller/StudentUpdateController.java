package gr.aueb.cf.schoolapp.controller;

import gr.aueb.cf.schoolapp.core.StudyDirection;
import gr.aueb.cf.schoolapp.dao.CityDAOImpl;
import gr.aueb.cf.schoolapp.dao.ICityDAO;
import gr.aueb.cf.schoolapp.dao.IStudentDAO;
import gr.aueb.cf.schoolapp.dao.StudentDAOImpl;
import gr.aueb.cf.schoolapp.dto.StudentInsertDTO;
import gr.aueb.cf.schoolapp.dto.StudentReadOnlyDTO;
import gr.aueb.cf.schoolapp.dto.StudentUpdateDTO;
import gr.aueb.cf.schoolapp.exceptions.StudentAlreadyExistsException;
import gr.aueb.cf.schoolapp.exceptions.StudentDAOException;
import gr.aueb.cf.schoolapp.exceptions.StudentNotFoundException;
import gr.aueb.cf.schoolapp.model.City;
import gr.aueb.cf.schoolapp.model.Student;
import gr.aueb.cf.schoolapp.service.CityServiceImpl;
import gr.aueb.cf.schoolapp.service.ICityService;
import gr.aueb.cf.schoolapp.service.IStudentService;
import gr.aueb.cf.schoolapp.service.StudentServiceImpl;
import gr.aueb.cf.schoolapp.validator.StudentValidator;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet("/school-app/students/update")
public class StudentUpdateController extends HttpServlet {

    IStudentDAO studentDAO = new StudentDAOImpl();
    IStudentService studentService = new StudentServiceImpl(studentDAO);

    ICityDAO cityDAO = new CityDAOImpl();
    ICityService cityService = new CityServiceImpl(cityDAO);

    StudentUpdateDTO updateDTO;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {


        List<City> cities = null;
        Integer id = Integer.parseInt(req.getParameter("id").trim());

        try {
            cities = cityService.getAllCities();
            StudentReadOnlyDTO studentReadOnlyDTO =
                    studentService.getStudentById(id);

            // Format birthdate when loading for the first time
            if (studentReadOnlyDTO.getBirthDate() != null) {
                studentReadOnlyDTO.setFormattedBirthDate(studentReadOnlyDTO.getBirthDate().format(DateTimeFormatter.ofPattern("dd/MM/yyyy")));
            }

            if (req.getSession().getAttribute("updateDTO") != null) {
                req.setAttribute("updateDTO", req.getSession().getAttribute("updateDTO"));
                req.getSession().removeAttribute("updateDTO");
            } else {
                req.setAttribute("updateDTO", studentReadOnlyDTO);
            }


            req.setAttribute("cities", cities);
            req.setAttribute("studyDirections", StudyDirection.values());
            if (req.getSession().getAttribute("updateDTO") != null) {
                // Move from session to request scope for JSP
                req.setAttribute("updateDTO", req.getSession().getAttribute(
                        "updateDTO"));
                //req.setAttribute("errors", req.getSession().getAttribute("errors"));
                // Clear session data (so it doesn't persist after refresh)
                req.getSession().removeAttribute("updateDTO");

            } else req.setAttribute("updateDTO", studentReadOnlyDTO);

            req.getRequestDispatcher("/WEB-INF/jsp/student-update.jsp")
                    .forward(req, resp);


        } catch (SQLException | StudentDAOException |
                 StudentNotFoundException e) {
            String errorMessage = e.getMessage();
            req.setAttribute("errorMessage", errorMessage);
            req.getRequestDispatcher("/WEB-INF/jsp/student-update.jsp")
                    .forward(req, resp);
        }

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");

            try {
            // Parse birthdate
            LocalDate birthDate = null;
            String birthDateStr = req.getParameter("birthDate");
            if (birthDateStr != null && !birthDateStr.trim().isEmpty()) {
                try {
                    birthDate = LocalDate.parse(birthDateStr, DateTimeFormatter.ofPattern("dd/MM/yyyy"));
                } catch (DateTimeParseException e) {
                    // Error will be handled by validator
                }
            }

            Map<String, String> errors = new HashMap<>();

            StudentUpdateDTO updateDTO;
            String firstnameMessage;
            String lastnameMessage;
            String fathernameMessage;
            String phoneNumMessage;
            String emailMessage;
            String registrationYearMessage;
            String studyDirectionMessage;
            String cityIdMessage;
            String birthDateMessage;
            String errorMessage;
            Student student;

            //Data binding
            String idStr = (req.getParameter("id") != null) ? req.getParameter(
                    "id").trim() : "";
            Integer id = Integer.parseInt(idStr);
            String firstname = (req.getParameter("firstname") != null) ?
                    req.getParameter("firstname").trim() : "";
            String lastname = (req.getParameter("lastname") != null) ?
                    req.getParameter("lastname").trim() : "";
            String fathername = (req.getParameter("fathername") != null) ?
                    req.getParameter("fathername").trim() : "";
            String phoneNum = (req.getParameter("phoneNum") != null) ?
                    req.getParameter("phoneNum").trim() : "";
            String email = (req.getParameter("email") != null) ?
                    req.getParameter("email").trim() : "";
            Integer registrationYear =
                    (req.getParameter("registrationYear") != null && !req.getParameter("registrationYear").trim().isEmpty()) ?
                            Integer.parseInt(req.getParameter("registrationYear").trim()) : 0;
            StudyDirection studyDirection =
                    (req.getParameter("studyDirection") != null) ?
                            StudyDirection.valueOf(req.getParameter("studyDirection").trim())
                            : null;
            Integer cityId = (req.getParameter("cityId") != null) ? Integer.parseInt(req.getParameter("cityId").trim()) : 0;


            updateDTO = new StudentUpdateDTO(firstname, lastname, fathername,
                    phoneNum, email, registrationYear, studyDirection, cityId,
                    birthDate, id);

            updateDTO.setFormattedBirthDate(birthDateStr);


            // Validate dto
            errors = StudentValidator.validate(updateDTO);

            if (!errors.isEmpty()) {
                firstnameMessage = errors.getOrDefault("firstname", "");
                lastnameMessage = errors.getOrDefault("lastname", "");
                fathernameMessage = errors.getOrDefault("fathername", "");
                phoneNumMessage = errors.getOrDefault("phoneNum", "");
                emailMessage = errors.getOrDefault("email", "");
                registrationYearMessage = errors.getOrDefault(
                        "registrationYear", "");
                studyDirectionMessage = errors.getOrDefault("studyDirection",
                        "");
                cityIdMessage = errors.getOrDefault("cityId", "");
                birthDateMessage = errors.getOrDefault("birthDate", "");


                req.getSession().setAttribute("firstnameMessage", firstnameMessage);
                req.getSession().setAttribute("lastnameMessage", lastnameMessage);
                req.getSession().setAttribute("fathernameMessage",
                        fathernameMessage);
                req.getSession().setAttribute("phoneNumMessage", phoneNumMessage);
                req.getSession().setAttribute("emailMessage", emailMessage);
                req.getSession().setAttribute("registrationYearMessage", registrationYearMessage);
                req.getSession().setAttribute("studyDirectionMessage", studyDirectionMessage);
                req.getSession().setAttribute("cityIdMessage", cityIdMessage);
                req.getSession().setAttribute("birthDateMessage", birthDateMessage);


                req.getSession().setAttribute("updateDTO", updateDTO);

                resp.sendRedirect(req.getContextPath() + "/school-app" +
                        "/students/update?id=" + id);
                return;
            }

            //Call the Service

            StudentReadOnlyDTO readOnlyDTO = studentService.updateStudent(id,
                    updateDTO);
            HttpSession session = req.getSession(false);
            session.setAttribute("studentInfo", readOnlyDTO);

            //PRG Pattern
            resp.sendRedirect(req.getContextPath() + "/school-app/student" +
                    "-updated");

        } catch (StudentAlreadyExistsException e) {
            // Specific handling for email exists error
            req.getSession().setAttribute("emailMessage", "Το email χρησιμοποιείται ήδη");
            // Recreate DTO with original values
            StudentUpdateDTO updatedStudent = new StudentUpdateDTO(
                    req.getParameter("firstname"),
                    req.getParameter("lastname"),
                    req.getParameter("fathername"),
                    req.getParameter("phoneNum"),
                    req.getParameter("email"),
                    Integer.parseInt(req.getParameter("registrationYear")),
                    StudyDirection.valueOf(req.getParameter("studyDirection")),
                    Integer.parseInt(req.getParameter("cityId")),
                    null,
                    Integer.parseInt(req.getParameter("id"))
            );
            updatedStudent.setFormattedBirthDate(req.getParameter("birthDate"));
            req.getSession().setAttribute("updateDTO", updatedStudent);
            resp.sendRedirect(req.getContextPath() + "/school-app/students/update?id=" + req.getParameter("id"));
        } catch (Exception e) {
            req.setAttribute("errorMessage", e.getMessage());
            req.getRequestDispatcher("/WEB-INF/jsp/student-update.jsp").forward(req, resp);
        }
    }
}
