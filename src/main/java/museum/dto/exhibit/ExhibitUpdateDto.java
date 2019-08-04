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
public class ExhibitUpdateDto {

  @NotNull private Long id;
  @NotBlank private String name;
  @NotBlank private String material;
  @NotBlank private String technology;

  @NotNull private Long authorId;
  @NotNull private Long hallId;

  public ExhibitUpdateDto(Exhibit exhibit) {
    this.id = exhibit.getId();
    this.name = exhibit.getName();
    this.material = exhibit.getMaterial();
    this.technology = exhibit.getTechnology();
    this.authorId = exhibit.getAuthor().getId();
    this.hallId = exhibit.getHall().getId();
  }
}
