package gr.aueb.cf.schoolapp.dao;


import gr.aueb.cf.schoolapp.exceptions.StudentDAOException;
import gr.aueb.cf.schoolapp.model.Student;

import java.util.List;

public interface IStudentDAO {

    // Basic services
    Student insert(Student student) throws StudentDAOException;
    Student update(Student student) throws StudentDAOException;
    void delete(Integer id) throws StudentDAOException;
    Student getById(Integer id) throws StudentDAOException;
    List<Student> getAll() throws StudentDAOException;

    Student getByUUID(String uuid) throws StudentDAOException;
    List<Student> getByLastname(String lastname) throws StudentDAOException;
    Student getByEmail(String email) throws StudentDAOException;
    List<Student> getFilteredStudent(String firstname, String lastname,
                                     String email) throws StudentDAOException;

}
