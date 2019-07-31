package museum.dto.hall;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import museum.dto.exhibit.ExhibitIdInitialsDto;
import museum.dto.worker.WorkerIdFirstSecondNameDtoResponse;
import museum.entity.Hall;

import java.util.List;
import java.util.stream.Collectors;

@Getter
@Setter
@NoArgsConstructor
public class HallDtoResponse {

  private Long id;

  private String name;

  private WorkerIdFirstSecondNameDtoResponse worker;

  private List<ExhibitIdInitialsDto> exhibits;

  public HallDtoResponse(Hall hall) {
    this.id = hall.getId();
    this.name = hall.getName();
    this.worker = new WorkerIdFirstSecondNameDtoResponse(hall.getWorker());
    this.exhibits =
        hall.getExhibits().stream().map(ExhibitIdInitialsDto::new).collect(Collectors.toList());
  }
}