import 'package:tracking_app/src/packages/data/routes/src/domain/places/places.dart';
import 'package:tracking_app/src/packages/data/routes/src/infrastructure/api_dtos.dart';

class PlacesMapper {
  const PlacesMapper();

  Feature fromApiDto(FeatureDto apiDto) {
    final id = apiDto.id;
    final type = apiDto.type;
    final placeType = apiDto.placeType;
    final properties = _propertiesFromApiDto(apiDto.properties);
    final textEs = apiDto.textEs;
    final placeNameEs = apiDto.placeNameEs;
    final text = apiDto.text;
    final placeName = apiDto.placeName;
    final center = apiDto.center;
    final geometry = _geometryFromApiDto(apiDto.geometry);
    final context = _fromApiContextDtoList(apiDto.context);
    final matchingText = apiDto.matchingText;
    final matchingPlaceName = apiDto.matchingPlaceName;

    return Feature(
      id: id,
      type: type,
      placeType: placeType,
      properties: properties,
      textEs: textEs,
      placeNameEs: placeNameEs,
      text: text,
      placeName: placeName,
      center: center,
      geometry: geometry,
      context: context,
      matchingText: matchingText,
      matchingPlaceName: matchingPlaceName,
    );
  }

  List<Feature> fromApiDtoList(List<FeatureDto> dtos) =>
      dtos.map((dto) => fromApiDto(dto)).toList();

  Properties _propertiesFromApiDto(PropertiesDto dto) {
    final foursquare = dto.foursquare;
    final landmark = dto.landmark;
    final address = dto.address;
    final category = dto.category;
    final wikidata = dto.wikidata;

    return Properties(
      foursquare: foursquare,
      landmark: landmark,
      address: address,
      category: category,
      wikidata: wikidata,
    );
  }

  Geometry _geometryFromApiDto(GeometryDto dto) {
    final coordinates = dto.coordinates;
    final type = dto.type;

    return Geometry(
      coordinates: coordinates,
      type: type,
    );
  }

  Context _contextFromApiDto(ContextDto dto) {
    final id = dto.id;
    final mapboxId = dto.mapboxId;
    final textEs = dto.textEs;
    final text = dto.text;

    return Context(
      id: id,
      mapboxId: mapboxId,
      textEs: textEs,
      text: text,
    );
  }

  List<Context> _fromApiContextDtoList(List<ContextDto> dtos) =>
      dtos.map((dto) => _contextFromApiDto(dto)).toList();
}
