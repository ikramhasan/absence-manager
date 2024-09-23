import 'package:absence_manager/features/absence/domain/absence.dart';
import 'package:absence_manager/features/absence/domain/i_absence_repository.dart';
import 'package:absence_manager/features/core/domain/failure.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'absence_state.dart';
part 'absence_cubit.freezed.dart';

/// A cubit managing the state of the absence feature.
class AbsenceCubit extends Cubit<AbsenceState> {
  /// Creates an [AbsenceCubit] instance with the given [IAbsenceRepository].
  AbsenceCubit(this._repository) : super(const AbsenceState.loading());

  final IAbsenceRepository _repository;

  int _currentPage = 1;
  int _totalPages = 1;
  List<Absence> _allAbsences = [];
  String? _currentType;
  DateTime? _currentDate;

  /// Fetches absences with members.
  ///
  /// Emits a loading state while fetching.
  /// Emits a loaded state with the absences if successful.
  /// Emits an error state with the failure otherwise.
  Future<void> fetchAbsencesWithMembers({
    int page = 1,
    int limit = 10,
    String? type,
    DateTime? date,
    bool reset = false,
    bool persist = false,
  }) async {
    if (reset) {
      _currentPage = 1;
      _allAbsences = [];
      _currentType = type;
      _currentDate = date;
    } else {
      if (page < 1 || page > _totalPages) {
        return;
      }
      if (page == 1) {
        emit(const AbsenceState.loading());
      }
    }

    final result = await _repository.fetchAbsencesWithMembers(
      page: page,
      limit: limit,
      type: type ?? _currentType,
      date: date ?? _currentDate,
    );

    result.fold(
      (failure) => emit(AbsenceState.error(failure)),
      (paginatedAbsences) {
        _currentPage = paginatedAbsences.currentPage;
        _totalPages = paginatedAbsences.totalPages;
        _allAbsences = persist
            ? [..._allAbsences, ...paginatedAbsences.absences]
            : paginatedAbsences.absences;
        emit(
          AbsenceState.loaded(
            absences: _allAbsences,
            currentPage: _currentPage,
            totalPages: _totalPages,
            hasMore: _currentPage < _totalPages,
          ),
        );
      },
    );
  }

  /// Loads more absences.
  void loadMoreAbsences() {
    if (_currentPage < _totalPages) {
      fetchAbsencesWithMembers(
        page: _currentPage + 1,
        type: _currentType,
        date: _currentDate,
        persist: true,
      );
    }
  }

  /// Filters absences by type and date.
  void filterAbsences({String? type, DateTime? date}) {
    fetchAbsencesWithMembers(type: type, date: date, reset: true);
  }
}
