package gr.aueb.cf.schoolapp.dto;

import gr.aueb.cf.schoolapp.core.StudyDirection;

import java.time.LocalDate;

public class StudentReadOnlyDTO extends BaseStudentDTO{
    private Integer id;
    private String uuid;


    public StudentReadOnlyDTO(Integer id, String uuid, String firstname,
                              String lastname, String fatherName, String phoneNum,
                              String email, Integer registrationYear, StudyDirection studyDirection,
                              Integer cityId, LocalDate birthdate) {
        super(firstname, lastname, fatherName, phoneNum, email, registrationYear, studyDirection, cityId, birthdate);
        this.id = id;
        this.uuid = uuid;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUuid() {
        return uuid;
    }

    public void setUuid(String uuid) {
        this.uuid = uuid;
    }

    @Override
    public String toString() {
        return "StudentReadOnlyDTO{" +
                "id=" + id +
                ", uuid='" + uuid + '\'' +
                '}' + super.toString();
    }
}
