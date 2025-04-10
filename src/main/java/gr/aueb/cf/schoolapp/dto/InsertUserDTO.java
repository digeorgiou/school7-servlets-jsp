package gr.aueb.cf.schoolapp.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.experimental.SuperBuilder;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class InsertUserDTO extends BaseUserDTO {

    private String role;

    public InsertUserDTO(String username, String password, String confirmPassword, String role) {
        super(username, password, confirmPassword);
        this.role = role;
    }

}
