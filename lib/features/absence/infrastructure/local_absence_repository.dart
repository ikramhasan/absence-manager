import 'dart:convert';
import 'package:absence_manager/features/absence/domain/absence.dart';
import 'package:absence_manager/features/absence/domain/i_absence_repository.dart';
import 'package:absence_manager/features/core/domain/api_response.dart';
import 'package:absence_manager/features/core/domain/exceptions.dart';
import 'package:absence_manager/features/core/domain/failure.dart';
import 'package:absence_manager/features/core/domain/user.dart';
import 'package:flutter/services.dart';
import 'package:fpdart/fpdart.dart';

/// A concrete class representing the local absence repository.
class LocalAbsenceRepository implements IAbsenceRepository {
  /// Creates an instance of the [LocalAbsenceRepository].
  LocalAbsenceRepository(this.assetBundle);

  /// The asset bundle to read the local data.
  final AssetBundle assetBundle;

  @override
  Future<Either<Failure, List<Absence>>> fetchAbsencesWithMembers() async {
    try {
      final absenceResponse = await readAbsences();

      final userResponse = await readUsers();

      // Map users to absences
      final absences = absenceResponse.map((absence) {
        final user = userResponse.firstWhere(
          (user) => user.userId == absence.userId,
          orElse: () {
            throw UserNotFoundException();
          },
        );

        return absence.copyWith(user: user);
      }).toList();

      return right(absences);
    } on UserNotFoundException {
      return left(const Failure(code: 404, message: 'User not found.'));
    } catch (e) {
      return left(
        const Failure(code: 500, message: 'Failed to fetch absences.'),
      );
    }
  }

  @override
  Future<List<Absence>> readAbsences() async {
    return _readAndParseFile('absences.json', Absence.fromJson);
  }

  @override
  Future<List<User>> readUsers() async {
    return _readAndParseFile('members.json', User.fromJson);
  }

  Future<List<T>> _readAndParseFile<T>(
    String fileName,
    T Function(Map<String, dynamic>) fromJson,
  ) async {
    try {
      final fileContent =
          await assetBundle.loadString('lib/features/absence/data/$fileName');
    final jsonData = json.decode(fileContent) as Map<String, dynamic>;
    final apiResponse = ApiResponse<T>.fromJson(
      jsonData,
      (json) => fromJson(json! as Map<String, dynamic>),
    );
      return apiResponse.payload;
    } catch (e) {
      throw Exception('Failed to read and parse the file: $fileName');
    }
    
  }
}
