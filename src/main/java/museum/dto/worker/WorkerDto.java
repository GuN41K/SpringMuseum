package museum.dto.worker;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import museum.dto.excursion.ExcursionBeginEndDtoResponse;
import museum.dto.hall.HallIdNameDtoResponse;
import museum.entity.Post;
import museum.entity.Worker;

import java.util.List;
import java.util.stream.Collectors;

/**
 * DTO for Worker response.
 *
 * @author Rostyslav Khasanov
 * @version 1.0
 */
@Getter
@Setter
@NoArgsConstructor
public class WorkerDto {

  private Long id;

  private String firstName;

  private String secondName;

  private Post post;

  private List<HallIdNameDtoResponse> halls;
  private List<ExcursionBeginEndDtoResponse> excursions;
}