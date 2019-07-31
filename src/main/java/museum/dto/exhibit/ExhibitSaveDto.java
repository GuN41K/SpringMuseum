package museum.dto.exhibit;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import museum.entity.Exhibit;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class ExhibitSaveDto {

  @NotBlank private String name;
  @NotBlank private String material;
  @NotBlank private String technology;

  @NotNull private Long authorId;
  @NotNull private Long hallId;
}
