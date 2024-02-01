import 'package:tracking_app/src/packages/data/routes/domain/places/places.dart';
import 'package:tracking_app/src/packages/data/routes/infrastructure/api_dtos.dart';

class PlacesMapper {
  const PlacesMapper();

  Place fromApiDto(FeatureDto dto) {
    final id = dto.id;
    final type = dto.type;
    final placeType = dto.placeType;
    final relevance = dto.relevance;
    final textEs = dto.textEs;
    final placeNameEs = dto.placeNameEs;
    final text = dto.text;
    final placeName = dto.placeName;
    final center = dto.center;

    return Place(
      id: id,
      type: type,
      placeType: placeType,
      relevance: relevance,
      textEs: textEs,
      placeNameEs: placeNameEs,
      text: text,
      placeName: placeName,
      center: center,
    );
  }

  List<Place> fromApiDtoList(List<FeatureDto> dtos) =>
      dtos.map((dto) => fromApiDto(dto)).toList();
}
