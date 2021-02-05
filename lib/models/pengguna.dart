part of 'models.dart';

class Pengguna extends Equatable {
  final String id;
  final String email;
  final String name;

  Pengguna(
    this.id,
    this.email, {
    this.name,
  });

  Pengguna copyWith({String name, String profilePictureUrl, int balance}) =>
      Pengguna(
        this.id,
        this.email,
        name: name ?? this.name,
      );

  @override
  List<Object> get props => [
        id,
        email,
        name,
      ];

  @override
  String toString() {
    return "[$id] - $name, $email";
  }
}
