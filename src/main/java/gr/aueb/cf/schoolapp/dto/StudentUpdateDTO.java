package gr.aueb.cf.schoolapp.dto;

import gr.aueb.cf.schoolapp.core.StudyDirection;

import java.time.LocalDate;

public class StudentUpdateDTO extends BaseStudentDTO{
    private Integer id;

    public StudentUpdateDTO(){

    }

    public StudentUpdateDTO(String firstname, String lastname, String fatherName, String phoneNum,
                            String email, Integer registrationYear, StudyDirection studyDirection,
                            Integer cityId, LocalDate birthdate, Integer id) {
        super(firstname, lastname, fatherName, phoneNum, email, registrationYear, studyDirection, cityId, birthdate);
        this.id = id;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    @Override
    public String toString() {
        return "StudentUpdateDTO{" +
                "id=" + id +
                '}' + super.toString();
    }
}
