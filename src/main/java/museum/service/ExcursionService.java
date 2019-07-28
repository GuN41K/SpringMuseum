package museum.service;

import museum.dto.request.excursion.ExcursionRequestDto;
import museum.dto.response.excursion.ExcursionResponse;
import museum.entity.Excursion;

import java.time.LocalDateTime;
import java.util.List;

public interface ExcursionService {

  void save(ExcursionRequestDto excursionRequestDto);

  List<ExcursionResponse> findAll();

  Excursion findById(Long id);

  ExcursionResponse update(ExcursionRequestDto excursionRequestDto);

  void deleteById(Long id);

  List<ExcursionResponse> findByPeriod(LocalDateTime start, LocalDateTime end);
}
