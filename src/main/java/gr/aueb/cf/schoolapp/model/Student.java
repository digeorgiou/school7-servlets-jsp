package gr.aueb.cf.schoolapp.model;

import gr.aueb.cf.schoolapp.core.StudyDirection;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDate;
import java.time.LocalDateTime;

public class Student {
    private Integer id;
    private String firstname;
    private String lastname;
    private String fatherName;
    private String phoneNum;
    private String email;
    private Integer registrationYear;
    private StudyDirection studyDirection;
    private Integer cityId;
    private LocalDate birthdate;
    private String uuid;
    private LocalDateTime createdAt;
    private LocalDateTime updatedAt;


    public Student() {
    }

    public Student(Integer id, String firstname, String lastname, String fatherName, String phoneNum, String email,
                   Integer registrationYear, StudyDirection studyDirection, Integer cityId,
                   LocalDate birthdate, String uuid, LocalDateTime createdAt, LocalDateTime updatedAt) {
        this.id = id;
        this.firstname = firstname;
        this.lastname = lastname;
        this.fatherName = fatherName;
        this.phoneNum = phoneNum;
        this.email = email;
        this.registrationYear = registrationYear;
        this.studyDirection = studyDirection;
        this.cityId = cityId;
        this.birthdate = birthdate;
        this.uuid = uuid;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
    }

    public Integer getId() {
        return id;
    }

    public String getFirstname() {
        return firstname;
    }

    public void setFirstname(String firstname) {
        this.firstname = firstname;
    }

    public String getLastname() {
        return lastname;
    }

    public void setLastname(String lastname) {
        this.lastname = lastname;
    }

    public String getFatherName() {
        return fatherName;
    }

    public void setFatherName(String fatherName) {
        this.fatherName = fatherName;
    }

    public String getPhoneNum() {
        return phoneNum;
    }

    public void setPhoneNum(String phoneNum) {
        this.phoneNum = phoneNum;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Integer getRegistrationYear() {
        return registrationYear;
    }

    public void setRegistrationYear(Integer registrationYear) {
        this.registrationYear = registrationYear;
    }

    public StudyDirection getStudyDirection() {
        return studyDirection;
    }

    public void setStudyDirection(StudyDirection studyDirection) {
        this.studyDirection = studyDirection;
    }

    public Integer getCityId() {
        return cityId;
    }

    public void setCityId(Integer cityId) {
        this.cityId = cityId;
    }

    public LocalDate getBirthdate() {
        return birthdate;
    }

    public void setBirthdate(LocalDate birthdate) {
        this.birthdate = birthdate;
    }

    public String getUuid() {
        return uuid;
    }

    public void setUuid(String uuid) {
        this.uuid = uuid;
    }

    public LocalDateTime getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(LocalDateTime createdAt) {
        this.createdAt = createdAt;
    }

    public LocalDateTime getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(LocalDateTime updatedAt) {
        this.updatedAt = updatedAt;
    }

    @Override
    public String toString() {
        return "Teacher{" +
                "id=" + id +
                ", firstname='" + firstname + '\'' +
                ", lastname='" + lastname + '\'' +
                ", fatherName='" + fatherName + '\'' +
                ", phoneNum='" + phoneNum + '\'' +
                ", email='" + email + '\'' +
                ", registration year='" + registrationYear + '\'' +
                ", study direction='" + studyDirection + '\'' +
                ", birth date='" + birthdate + '\'' +
                ", cityId=" + cityId +
                ", uuid='" + uuid + '\'' +
                ", createdAt=" + createdAt +
                ", updatedAt=" + updatedAt +
                '}';
    }
}
