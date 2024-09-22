import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed

/// A class representing a User.
class User with _$User {
  /// The [User] class has the following properties:
  /// - [id]: The unique identifier for the user.
  /// - [crewId]: The identifier for the crew the user belongs to.
  /// - [name]: The name of the user.
  /// - [image]: The URL or path to the user's image.
  /// - [userId]: Another identifier for the user.
  const factory User({
    required int id,
    required int crewId,
    required String name,
    required String image,
    required int userId,
  }) = _User;

  /// Creates a [User] instance from a JSON object. 
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  /// Creates an empty [User] instance.
  factory User.empty() => const _User(
        id: 0,
        crewId: 0,
        name: '',
        image: '',
        userId: 0,
      );
}
