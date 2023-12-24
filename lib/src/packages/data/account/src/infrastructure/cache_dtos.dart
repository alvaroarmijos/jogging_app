import '../domain/user/user.dart';

class UserCacheDto {
  final String name;
  final int age;
  final double weight;

  const UserCacheDto(
    this.name,
    this.age,
    this.weight,
  );

  factory UserCacheDto.fromEntity(User entity) {
    final name = entity.name;
    final age = entity.age;
    final weight = entity.weight;

    return UserCacheDto(
      name,
      age,
      weight,
    );
  }

  factory UserCacheDto.fromJson(Map jsonObj) {
    final String name = jsonObj['name'] ?? '';
    final int age = jsonObj['age'] ?? 0;
    final double weight = jsonObj['weight'] ?? 0.0;

    return UserCacheDto(
      name,
      age,
      weight,
    );
  }

  Map toJson() => {
        'name': name,
        'age': age,
        'weight': weight,
      };
}
