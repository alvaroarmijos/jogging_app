import '../domain/user/user.dart';

class UserCacheDto {
  final String name;
  final int age;
  final double weight;
  final String email;

  const UserCacheDto(
    this.name,
    this.age,
    this.weight,
    this.email,
  );

  factory UserCacheDto.fromEntity(User entity) {
    final name = entity.name;
    final age = entity.age;
    final weight = entity.weight;
    final email = entity.email;

    return UserCacheDto(name, age, weight, email);
  }

  factory UserCacheDto.fromJson(Map jsonObj) {
    final String name = jsonObj['name'] ?? '';
    final int age = jsonObj['age'] ?? 0;
    final double weight = jsonObj['weight'] ?? 0.0;
    final String email = jsonObj['email'] ?? '';

    return UserCacheDto(
      name,
      age,
      weight,
      email,
    );
  }

  Map toJson() => {
        'name': name,
        'age': age,
        'weight': weight,
        'email': email,
      };
}
