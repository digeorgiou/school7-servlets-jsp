package gr.aueb.cf.schoolapp.validator;

import gr.aueb.cf.schoolapp.dto.BaseStudentDTO;
import gr.aueb.cf.schoolapp.dto.StudentInsertDTO;
import gr.aueb.cf.schoolapp.exceptions.StudentDAOException;
import gr.aueb.cf.schoolapp.service.IStudentService;

import java.time.LocalDate;
import java.util.HashMap;
import java.util.Map;

public class StudentValidator<T> {

    private StudentValidator() {}

    public static <T extends BaseStudentDTO> Map<String, String> validate(T dto){
        Map<String, String> errors = new HashMap<>();

        if (dto.getFirstname().length() < 2 || dto.getFirstname().length() > 32) {
            errors.put("firstname", "Το όνομα πρέπει να είναι 2 και 32 χαρακτήρες");
        }

        if (dto.getFirstname().matches("^.*\\s+.*$")) {
            errors.put("firstname", "Το όνομα δεν πρέπει να περιλαμβάνει κενά");
        }

        if (dto.getLastname().length() < 2 || dto.getLastname().length() > 32) {
            errors.put("lastname", "Το επώνυμο πρέπει να είναι 2 και 32 χαρακτήρες");
        }

        if (dto.getLastname().matches("^.*\\s+.*$")) {
            errors.put("lastname", "Το επώνυμο δεν πρέπει να περιλαμβάνει κενά");
        }

        if (dto.getFatherName() != null && !dto.getFatherName().trim().isEmpty()) {
            if (dto.getFatherName().length() < 2) {  // Example validation
                errors.put("fathername", "Το όνομα πατέρα πρέπει να έχει τουλάχιστον 2 χαρακτήρες");
            }
            if (dto.getFatherName().length() < 2 || dto.getFatherName().length() > 32) {
                errors.put("fathernane", "Το Επώνυμο Πατρός πρέπει να είναι μεταξύ 2 και 32 ψηφία");
            }
        }

        if (dto.getPhoneNum().length() < 8 || dto.getPhoneNum().length() > 15) {
            errors.put("phoneNum", "Ο Αριθμός Τηλεφώνου πρέπει να είναι μεταξύ 8 και 15 ψηφία");
        }

        if (dto.getPhoneNum().matches("^.*\\s+.*$")) {
            errors.put("phoneNum", "Ο Αριθμός Τηλεφώνου δεν πρέπει να περιλαμβάνει κενά");
        }

        if (dto.getBirthDate() == null) {
            errors.put("birthDate", "Η ημερομηνία γέννησης είναι υποχρεωτική");
        } else {
            LocalDate minDate = LocalDate.now().minusYears(100);
            LocalDate maxDate = LocalDate.now().minusYears(10);

            if (dto.getBirthDate().isBefore(minDate)) {
                errors.put("birthDate", "Η ημερομηνία γέννησης δεν μπορεί να είναι πριν από " + minDate.getYear());
            }
            if (dto.getBirthDate().isAfter(maxDate)) {
                errors.put("birthDate", "Ο μαθητής πρέπει να είναι τουλάχιστον 10 ετών");
            }
        }

        if (dto.getStudyDirection() == null) {
            errors.put("studyDirection", "Η κατεύθυνση σπουδών είναι υποχρεωτική");
        }

        if (dto.getEmail() == null || dto.getEmail().trim().isEmpty()) {
            errors.put("email", "Το email είναι υποχρεωτικό");
        } else if (!dto.getEmail().matches("^[\\w-\\.]+@([\\w-]+\\.)+[\\w-]{2,4}$")) {
            errors.put("email", "Παρακαλώ εισάγετε ένα έγκυρο email");
        }

        if (dto.getRegistrationYear() == null) {
            errors.put("registrationYear", "Η χρονιά εγγραφής είναι υποχρεωτική");
        } else {
            int currentYear = LocalDate.now().getYear();
            if (dto.getRegistrationYear() < 2000 || dto.getRegistrationYear() > currentYear) {
                errors.put("registrationYear",
                        "Η χρονιά εγγραφής πρέπει να είναι μεταξύ 2000 και " + currentYear);
            }
        }

        return errors;
    }

}
