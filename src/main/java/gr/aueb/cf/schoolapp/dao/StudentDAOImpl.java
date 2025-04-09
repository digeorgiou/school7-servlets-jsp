package gr.aueb.cf.schoolapp.dao;

import gr.aueb.cf.schoolapp.core.StudyDirection;
import gr.aueb.cf.schoolapp.exceptions.StudentDAOException;
import gr.aueb.cf.schoolapp.exceptions.TeacherDAOException;
import gr.aueb.cf.schoolapp.model.Student;
import gr.aueb.cf.schoolapp.model.Teacher;
import gr.aueb.cf.schoolapp.util.DBUtil;

import java.sql.*;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

public class StudentDAOImpl implements IStudentDAO{

    @Override
    public Student insert(Student student) throws StudentDAOException {
        String sql = "INSERT INTO students (firstname, lastname, fathername, " +
                "phone_num, email, registration_year, study_direction, " +
                "city_id, birth_date, uuid, created_at, updated_at)" +
                " VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        Student insertedStudent = null;

        try(Connection connection = DBUtil.getConnection();
            PreparedStatement ps = connection.prepareStatement(sql,
                    Statement.RETURN_GENERATED_KEYS)) {
            ps.setString(1, student.getFirstname());
            ps.setString(2, student.getLastname());
            ps.setString(3, student.getFatherName());
            ps.setString(4, student.getPhoneNum());
            ps.setString(5, student.getEmail());
            ps.setInt(6, student.getRegistrationYear());
            ps.setString(7, student.getStudyDirection().toString());
            ps.setInt(8, student.getCityId());
            ps.setDate(9, Date.valueOf(student.getBirthdate()));
            ps.setString(10, UUID.randomUUID().toString());
            ps.setTimestamp(11, Timestamp.valueOf(LocalDateTime.now()));
            ps.setTimestamp(12, Timestamp.valueOf(LocalDateTime.now()));
            ps.executeUpdate();

            ResultSet rsGeneratedKeys = ps.getGeneratedKeys();
            if(rsGeneratedKeys.next()) {
                int generatedId = rsGeneratedKeys.getInt(1);
                insertedStudent = getById(generatedId);
            }
            //logging
            return insertedStudent;

        } catch (SQLException e){
            throw new StudentDAOException("SQL error in insert Student with" +
                    "email: " + student.getEmail());
        }
    }

    @Override
    public Student update(Student student) throws StudentDAOException {
        String sql = "UPDATE students SET firstname = ?, lastname = ?, " +
                "fathername = ?, phone_num = ?, email = ?, registration_year = ?," +
                " study_direction = ?, city_id = ?, birth_date = ?, updated_at = ? WHERE id = ?";

        Student updatedStudent = null;

        try(Connection connection = DBUtil.getConnection();
            PreparedStatement ps = connection.prepareStatement(sql,
                    Statement.RETURN_GENERATED_KEYS)) {
            ps.setString(1, student.getFirstname());
            ps.setString(2, student.getLastname());
            ps.setString(3, student.getFatherName());
            ps.setString(4, student.getPhoneNum());
            ps.setString(5, student.getEmail());
            ps.setInt(6, student.getRegistrationYear());
            ps.setString(7, student.getStudyDirection().toString());
            ps.setInt(8, student.getCityId());
            ps.setDate(9, Date.valueOf(student.getBirthdate()));
            ps.setTimestamp(10, Timestamp.valueOf(LocalDateTime.now()));
            ps.setInt(11, student.getId());

            ps.executeUpdate();

            updatedStudent = getById(student.getId());
            //logging
            return updatedStudent;

        } catch (SQLException e){
            throw new StudentDAOException("SQL error in insert Student with" +
                    "email: " + student.getEmail());
        }
    }

    @Override
    public void delete(Integer id) throws StudentDAOException {
        String sql = "DELETE FROM STUDENTS WHERE id = ?";

        try (Connection connection = DBUtil.getConnection();
             PreparedStatement ps = connection.prepareStatement(sql)) {

            ps.setInt(1, id);
            ps.executeUpdate();
            // logging
        } catch (SQLException e) {
            // e.printStackTrace();
            // logging
            throw new StudentDAOException("SQL error in delete student with " +
                    "id: " + id);
        }
    }

    @Override
    public Student getById(Integer id) throws StudentDAOException {
        String sql = "SELECT * FROM students WHERE id = ?";
        Student student = null;
        ResultSet rs;

        try (Connection connection = DBUtil.getConnection();
             PreparedStatement ps = connection.prepareStatement(sql)) {

            ps.setInt(1, id);
            rs = ps.executeQuery();

            if (rs.next()) {
                student = new Student(rs.getInt("id"), rs.getString(
                        "firstname"), rs.getString("lastname"), rs.getString("fathername"),
                        rs.getString("phone_num")
                        , rs.getString("email"), rs.getInt("registration_year"),
                        StudyDirection.valueOf(rs.getString("study_direction").toUpperCase()),
                        rs.getInt("city_id"),
                        rs.getDate("birth_date").toLocalDate(),
                        rs.getString("uuid"),
                        rs.getTimestamp("created_at").toLocalDateTime(),
                        rs.getTimestamp("updated_at").toLocalDateTime());
            }
            return student;
        } catch (SQLException e) {
            e.printStackTrace();
            // logging
            throw new StudentDAOException("SQL error in get by id with id: " + id);
        }
    }

    @Override
    public List<Student> getAll() throws StudentDAOException {
        String sql = "SELECT * FROM students";
        Student student = null;
        List<Student> students = new ArrayList<>();
        ResultSet rs;

        try (Connection connection = DBUtil.getConnection();
             PreparedStatement ps = connection.prepareStatement(sql)) {
            rs = ps.executeQuery();

            while(rs.next()) {
                student = new Student(rs.getInt("id"), rs.getString(
                        "firstname"), rs.getString("lastname"), rs.getString("fathername"),
                        rs.getString("phone_num")
                        , rs.getString("email"), rs.getInt("registration_year"),
                        StudyDirection.valueOf(rs.getString("study_direction").toUpperCase()),
                        rs.getInt("city_id"),
                        rs.getDate("birth_date").toLocalDate(),
                        rs.getString("uuid"),
                        rs.getTimestamp("created_at").toLocalDateTime(),
                        rs.getTimestamp("updated_at").toLocalDateTime());
                students.add(student);
            }
            return students;
        }catch (SQLException e) {
            //e.printStackTrace();
            // logging
            throw new StudentDAOException("SQL error in get all");
        }
    }

    @Override
    public Student getByUUID(String uuid) throws StudentDAOException {
        String sql = "SELECT * FROM students WHERE uuid = ?";
        Student student = null;
        ResultSet rs;

        try (Connection connection = DBUtil.getConnection();
             PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1,uuid);
            rs = ps.executeQuery();

            if(rs.next()) {
                student = new Student(rs.getInt("id"), rs.getString(
                        "firstname"), rs.getString("lastname"), rs.getString("fathername"),
                        rs.getString("phone_num")
                        , rs.getString("email"), rs.getInt("registration_year"),
                        StudyDirection.valueOf(rs.getString("study_direction").toUpperCase()),
                        rs.getInt("city_id"),
                        rs.getDate("birth_date").toLocalDate(),
                        rs.getString("uuid"),
                        rs.getTimestamp("created_at").toLocalDateTime(),
                        rs.getTimestamp("updated_at").toLocalDateTime());
            }
            return student;
        }catch (SQLException e) {
            //e.printStackTrace();
            // logging
            throw new StudentDAOException("SQL error in getByUuid of student " +
                    "with uuid: " + uuid);
        }
    }

    @Override
    public List<Student> getByLastname(String lastname) throws StudentDAOException {
        String sql = "SELECT * FROM students WHERE lastname LIKE ?";
        Student student = null;
        List<Student> students = new ArrayList<>();
        ResultSet rs;

        try (Connection connection = DBUtil.getConnection();
             PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1,lastname + "%");
            rs = ps.executeQuery();

            while(rs.next()) {
                student = new Student(rs.getInt("id"), rs.getString(
                        "firstname"), rs.getString("lastname"), rs.getString("fathername"),
                        rs.getString("phone_num")
                        , rs.getString("email"), rs.getInt("registration_year"),
                        StudyDirection.valueOf(rs.getString("study_direction").toUpperCase()),
                        rs.getInt("city_id"),
                        rs.getDate("birth_date").toLocalDate(),
                        rs.getString("uuid"),
                        rs.getTimestamp("created_at").toLocalDateTime(),
                        rs.getTimestamp("updated_at").toLocalDateTime());
                students.add(student);
            }
            return students;
        }catch (SQLException e) {
            //e.printStackTrace();
            // logging
            throw new StudentDAOException("SQL error in getByLastname of " +
                    "student with lastname: " + lastname);
        }
    }

    @Override
    public Student getByEmail(String email) throws StudentDAOException {
        String sql = "SELECT * FROM students WHERE email = ?";
        Student student = null;
        ResultSet rs;

        try (Connection connection = DBUtil.getConnection();
             PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1,email);
            rs = ps.executeQuery();

            if(rs.next()) {
                student = new Student(rs.getInt("id"), rs.getString(
                        "firstname"), rs.getString("lastname"), rs.getString("fathername"),
                        rs.getString("phone_num")
                        , rs.getString("email"), rs.getInt("registration_year"),
                        StudyDirection.valueOf(rs.getString("study_direction").toUpperCase()),
                        rs.getInt("city_id"),
                        rs.getDate("birth_date").toLocalDate(),
                        rs.getString("uuid"),
                        rs.getTimestamp("created_at").toLocalDateTime(),
                        rs.getTimestamp("updated_at").toLocalDateTime());
            }
            return student;
        }catch (SQLException e) {
            //e.printStackTrace();
            // logging
            throw new StudentDAOException("SQL error in getByEmail of student" +
                    " with email: " + email);
        }
    }

    @Override
    public List<Student> getFilteredStudent(String firstname, String lastname
            , String email) throws StudentDAOException {
        String sql = "SELECT * FROM students WHERE firstname LIKE ? AND " +
                "lastname LIKE ? AND email LIKE ?";
        Student student = null;
        List<Student> students = new ArrayList<>();
        ResultSet rs;

        try (Connection connection = DBUtil.getConnection();
             PreparedStatement ps = connection.prepareStatement(sql)) {

            ps.setString(1,firstname + "%");
            ps.setString(2,lastname + "%");
            ps.setString(3, email + "%");
            rs = ps.executeQuery();

            while(rs.next()) {
                student = new Student(rs.getInt("id"), rs.getString(
                        "firstname"), rs.getString("lastname"), rs.getString("fathername"),
                        rs.getString("phone_num")
                        , rs.getString("email"), rs.getInt("registration_year"),
                        StudyDirection.valueOf(rs.getString("study_direction").toUpperCase()),
                        rs.getInt("city_id"),
                        rs.getDate("birth_date").toLocalDate(),
                        rs.getString("uuid"),
                        rs.getTimestamp("created_at").toLocalDateTime(),
                        rs.getTimestamp("updated_at").toLocalDateTime());
                students.add(student);
            }
            return students;
        }catch (SQLException e) {
            //e.printStackTrace();
            // logging
            throw new StudentDAOException("SQL error in filtered get of " +
                    "student with name: " + firstname + " " + lastname);
        }
    }

    @Override
    public boolean emailExists(String email) throws StudentDAOException {
        String sql = "SELECT COUNT(*) FROM STUDENTS WHERE EMAIL = ?";

        try (Connection connection = DBUtil.getConnection();
             PreparedStatement ps = connection.prepareStatement(sql)) {

            ps.setString(1,email);
            ResultSet rs = ps.executeQuery();
            return rs.next() && rs.getInt(1) > 0;

        }catch (SQLException e) {
            throw new StudentDAOException("Error checking email existence");
        }
    }
}
