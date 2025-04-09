package gr.aueb.cf.schoolapp.dto;

import gr.aueb.cf.schoolapp.core.StudyDirection;

import java.time.LocalDate;

public class StudentInsertDTO extends BaseStudentDTO{

    public StudentInsertDTO(){}

    public StudentInsertDTO(String firstname, String lastname, String fatherName,
                            String phoneNum, String email, Integer registrationYear,
                            StudyDirection studyDirection, Integer cityId, LocalDate birthdate) {
        super(firstname, lastname, fatherName, phoneNum, email, registrationYear, studyDirection, cityId, birthdate);
    }
}
