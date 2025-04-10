package gr.aueb.cf.schoolapp.dto;

import gr.aueb.cf.schoolapp.core.StudyDirection;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

@NoArgsConstructor
@Getter
@Setter
public class BaseStudentDTO {
    private String firstname;
    private String lastname;
    private String fatherName;
    private String phoneNum;
    private String email;
    private Integer registrationYear;
    private StudyDirection studyDirection;
    private Integer cityId;
    private LocalDate birthDate;
    private String formattedBirthDate;

    public BaseStudentDTO(String firstname, String lastname, String fatherName, String phoneNum,
                          String email, Integer registrationYear, StudyDirection studyDirection,
                          Integer cityId, LocalDate birthDate) {

        this.firstname = firstname;
        this.lastname = lastname;
        this.fatherName = fatherName != null? fatherName.trim() : "";
        //converting null to empty string
        this.phoneNum = phoneNum;
        this.email = email;
        this.registrationYear = registrationYear;
        this.studyDirection = studyDirection;
        this.cityId = cityId;
        this.birthDate = birthDate;
    }


    @Override
    public String toString() {
        return "BaseStudentDTO{" +
                "firstname='" + firstname + '\'' +
                ", lastname='" + lastname + '\'' +
                ", fatherName='" + fatherName + '\'' +
                ", phoneNum='" + phoneNum + '\'' +
                ", email='" + email + '\'' +
                ", registrationYear=" + registrationYear +
                ", studyDirection=" + studyDirection +
                ", cityId=" + cityId +
                ", birthdate=" + birthDate +
                '}';
    }
}


