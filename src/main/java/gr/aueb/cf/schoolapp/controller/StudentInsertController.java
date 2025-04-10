package gr.aueb.cf.schoolapp.controller;

import gr.aueb.cf.schoolapp.core.StudyDirection;
import gr.aueb.cf.schoolapp.dao.CityDAOImpl;
import gr.aueb.cf.schoolapp.dao.ICityDAO;
import gr.aueb.cf.schoolapp.dao.IStudentDAO;
import gr.aueb.cf.schoolapp.dao.StudentDAOImpl;
import gr.aueb.cf.schoolapp.dto.StudentInsertDTO;
import gr.aueb.cf.schoolapp.dto.StudentReadOnlyDTO;
import gr.aueb.cf.schoolapp.exceptions.StudentAlreadyExistsException;
import gr.aueb.cf.schoolapp.exceptions.StudentDAOException;
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
import java.time.format.DateTimeParseException;

import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet("/school-app/students/insert")
public class StudentInsertController extends HttpServlet {

    IStudentDAO studentDAO = new StudentDAOImpl();
    IStudentService studentService = new StudentServiceImpl(studentDAO);
    ICityDAO cityDAO = new CityDAOImpl();
    ICityService cityService = new CityServiceImpl(cityDAO);

    StudentInsertDTO studentInsertDTO = new StudentInsertDTO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        req.setAttribute("studyDirections", StudyDirection.values());

        List<City> cities = null;
        try {
            cities = cityService.getAllCities();
        } catch (SQLException e) {
            String errorMessage = e.getMessage();
            req.getSession().setAttribute("errorMessage", errorMessage);
            req.getSession().removeAttribute("emailMessage");
            req.getRequestDispatcher("/WEB-INF/jsp/student-insert.jsp")
                    .forward(req, resp);
        }
        req.setAttribute("cities", cities);

        if (req.getSession().getAttribute("insertDTO") != null) {

            req.setAttribute("insertDTO", req.getSession().getAttribute("insertDTO"));

            req.getSession().removeAttribute("insertDTO");
        }
        req.getRequestDispatcher("/WEB-INF/jsp/student-insert.jsp").forward(req,
                resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");


        Map<String, String> errors = new HashMap<>();

        StudentInsertDTO insertDTO;
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
        String firstname = (req.getParameter("firstname") != null)?
                req.getParameter("firstname").trim() : "";
        String lastname = (req.getParameter("lastname") != null)?
                req.getParameter("lastname").trim() : "";
        String fathername = (req.getParameter("fathername") != null)?
                req.getParameter("fathername").trim() : "";
        String phoneNum = (req.getParameter("phoneNum") != null)?
                req.getParameter("phoneNum").trim() : "";
        String email = (req.getParameter("email") != null)?
                req.getParameter("email").trim() : "";
        Integer registrationYear =
                (req.getParameter("registrationYear") != null && !req.getParameter("registrationYear").trim().isEmpty())?
                Integer.parseInt(req.getParameter("registrationYear").trim()) : 0;
        StudyDirection studyDirection =
                (req.getParameter("studyDirection") != null)?
                StudyDirection.valueOf(req.getParameter("studyDirection").trim())
                        : null;
        Integer cityId = (req.getParameter("cityId") != null) ? Integer.parseInt(req.getParameter("cityId").trim()) : 0;
        String birthDateStr = (req.getParameter("birthDate") != null) ?
                req.getParameter("birthDate").trim() : "";
        LocalDate birthDate = null;

        if(!birthDateStr.isEmpty()) {
            try {
                DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
                birthDate = LocalDate.parse(birthDateStr, formatter);
            } catch (DateTimeParseException e) {
                errors.put("birthDate", "Μη έγκυρη ημερομηνία. Χρησιμοποιήστε μορφή ΗΗ/ΜΜ/ΕΕΕΕ");
            }
        }

        insertDTO = new StudentInsertDTO(firstname,lastname,fathername,
                phoneNum,email,registrationYear,studyDirection,cityId,
                birthDate);
        insertDTO.setFormattedBirthDate(birthDateStr);

        try {
            // Validate dto
            errors = StudentValidator.validate(insertDTO);

            if(!errors.isEmpty()) {
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
                req.getSession().setAttribute("insertDTO", insertDTO);

                resp.sendRedirect(req.getContextPath() + "/school-app" +
                        "/students/insert");
                return;
            }

            //Call Service

            StudentReadOnlyDTO readOnlyDTO =
                    studentService.insertStudent(insertDTO);
            HttpSession session = req.getSession(false);
            session.setAttribute("studentInfo", readOnlyDTO);
            //PRG Pattern
            resp.sendRedirect(req.getContextPath() + "/school-app/student-inserted");
        } catch (StudentAlreadyExistsException | StudentDAOException e){
            req.getSession().setAttribute("insertDTO", insertDTO);
            req.getSession().setAttribute("emailMessage", "Το email " +
                    "χρησιμοποιείται ήδη");
            req.getSession().removeAttribute("errorMessage");
            resp.sendRedirect(req.getContextPath() + "/school-app/students/insert");
        }


    }


}
