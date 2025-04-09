package gr.aueb.cf.schoolapp.dto;

import gr.aueb.cf.schoolapp.core.StudyDirection;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDate;
import java.time.LocalDateTime;

@NoArgsConstructor
@AllArgsConstructor
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
    private LocalDate birthdate;

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
                ", birthdate=" + birthdate +
                '}';
    }
}


