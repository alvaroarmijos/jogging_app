import 'package:tracking_app/src/packages/data/account/src/domain/user/user.dart';

class UserCacheDto {
  final String name;
  final String email;
  final int age;
  final double weight;

  UserCacheDto(
    this.name,
    this.email,
    this.age,
    this.weight,
  );

  factory UserCacheDto.fromEntity(User entity) {
    final name = entity.name;
    final email = entity.email;
    final age = entity.age;
    final weight = entity.weight;

    return UserCacheDto(
      name,
      email,
      age,
      weight,
    );
  }

  factory UserCacheDto.fromJson(Map jsonObj) {
    final String name = jsonObj['name'] ?? '';
    final String email = jsonObj['email'] ?? '';
    final int age = jsonObj['age'] ?? 0;
    final double weight = jsonObj['weight'] ?? 0.0;

    return UserCacheDto(
      name,
      email,
      age,
      weight,
    );
  }

  Map toJson() => {
        'name': name,
        'email': email,
        'age': age,
        'weight': weight,
      };
}
