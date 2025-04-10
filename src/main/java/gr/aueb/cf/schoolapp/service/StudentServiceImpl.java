package gr.aueb.cf.schoolapp.service;

import gr.aueb.cf.schoolapp.dao.IStudentDAO;
import gr.aueb.cf.schoolapp.dto.*;
import gr.aueb.cf.schoolapp.exceptions.*;
import gr.aueb.cf.schoolapp.mapper.Mapper;
import gr.aueb.cf.schoolapp.model.Student;
import gr.aueb.cf.schoolapp.model.Teacher;

import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

public class StudentServiceImpl implements IStudentService{

    private final IStudentDAO studentDAO;

    public StudentServiceImpl(IStudentDAO studentDAO){
        this.studentDAO = studentDAO;
    }

    @Override
    public StudentReadOnlyDTO insertStudent(StudentInsertDTO dto)
            throws StudentDAOException, StudentAlreadyExistsException {
        Student student;
        Student insertedStudent;

        try{
            student = Mapper.mapStudentInsertToModel(dto);

            // Check if email exists
            if (studentDAO.emailExists(dto.getEmail())) {
                throw new StudentAlreadyExistsException("Email already in use");
            }

            insertedStudent = studentDAO.insert(student);
            //logging
            return Mapper.mapStudentToReadOnlyDTO(insertedStudent).orElse(null);
        } catch(StudentDAOException e){
            //e.printStackTrace();
            // logging
            // rollback
            throw e;
        }catch(StudentAlreadyExistsException e){
            //e.printStackTrace();
            // logging
            // rollback
            throw e;
        }
    }

    @Override
    public StudentReadOnlyDTO updateStudent(Integer id, StudentUpdateDTO dto) throws StudentDAOException, StudentAlreadyExistsException, StudentNotFoundException {
        Student student;
        Student fetchedStudent;

        try{
            if(studentDAO.getById(id)== null)
                throw new StudentNotFoundException("Student with id " + id +
                        " was not found");

            fetchedStudent = studentDAO.getByEmail(dto.getEmail());

            if(fetchedStudent != null && !fetchedStudent.getId().equals(dto.getId())){
                throw new StudentAlreadyExistsException("Student with email: " + dto.getEmail() + " already exists");
            }
            student = Mapper.mapStudentUpdateToModel(dto);
            Student updatedStudent = studentDAO.update(student);
            //logging
            return Mapper.mapStudentToReadOnlyDTO(updatedStudent).orElse(null);
        } catch(StudentDAOException | StudentNotFoundException e){
            //e.printStackTrace();
            // logging
            // rollback
            throw e;
        }
    }

    @Override
    public void deleteStudent(Integer id)
            throws StudentDAOException, StudentNotFoundException {
        try{
            if(studentDAO.getById(id) == null){
                throw new StudentNotFoundException("Student not found");
            }
            studentDAO.delete(id);
        }catch (StudentDAOException | StudentNotFoundException e){
//            e.printStackTrace();
            //rollback
            throw e;
        }
    }

    @Override
    public StudentReadOnlyDTO getStudentById(Integer id) throws StudentDAOException, StudentNotFoundException {
        Student student;

        try{
            student = studentDAO.getById(id);


            StudentReadOnlyDTO dto =  Mapper.mapStudentToReadOnlyDTO(student)
                    .orElseThrow(()->new StudentNotFoundException("Student with this id was not found"));

            if (student.getBirthdate() != null) {
                dto.setBirthDate(student.getBirthdate());
                DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
                dto.setFormattedBirthDate(student.getBirthdate().format(formatter));
            }
            return dto;

        }catch(StudentNotFoundException | StudentDAOException e){
            //rollback
            throw e;
        }
    }

    @Override
    public List<StudentReadOnlyDTO> getAllStudents() throws StudentDAOException {
        List<Student> students;

        try{
            students = studentDAO.getAll();
            return students.stream()
                    .map(Mapper::mapStudentToReadOnlyDTO)
                    .flatMap(Optional::stream)
                    .collect(Collectors.toList());
        }catch (StudentDAOException e){
//            e.printStackTrace();
            throw e;
        }
    }

    @Override
    public List<StudentReadOnlyDTO> getStudentsByLastname(String lastname) throws StudentDAOException {
        List<Student> students;

        try{
            students = studentDAO.getByLastname(lastname);
            return students.stream()
                    .map(Mapper::mapStudentToReadOnlyDTO)
                    .flatMap(Optional::stream)
                    .collect(Collectors.toList());
        }catch (StudentDAOException e){
//            e.printStackTrace();
            throw e;
        }
    }

    @Override
    public List<StudentReadOnlyDTO> getFilteredStudents(StudentFiltersDTO filters) throws StudentDAOException {
        List<Student> students;

        try{
            students = studentDAO.getFilteredStudent(filters.getFirstname(),
                    filters.getLastname(), filters.getEmail());
            return students.stream()
                    .map(Mapper::mapStudentToReadOnlyDTO)
                    .flatMap(Optional::stream)
                    .collect(Collectors.toList());
        }catch (StudentDAOException e){
//            e.printStackTrace();
            throw e;
        }
    }
}
