package gr.aueb.cf.schoolapp.dto;

import gr.aueb.cf.schoolapp.core.RoleType;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@AllArgsConstructor
@Getter
@Setter
public class UserReadOnlyDTO extends BaseUserDTO {

    private Integer id;
    private String role;

    public UserReadOnlyDTO() {}

    public UserReadOnlyDTO(Integer id, String username, String password, String role
                           ) {
        super(username, password);
        this.id = id;
        this.role = role;
    }

}
