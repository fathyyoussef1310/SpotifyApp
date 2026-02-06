import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/QuranResponse.dart';
import '../../data/user_repo.dart';

abstract class TracksState {}

class TrackInitial extends TracksState {}

class TrackLoading extends TracksState {}

class TrackLoaded extends TracksState {
  final QuranResponse data;
  TrackLoaded(this.data);
}
class TrackError extends TracksState {
  final String error;
  TrackError(this.error);
}

class TracksCubit extends Cubit<TracksState> {
  final UserRepo repo;
  QuranResponse? _originalData;
  TracksCubit(this.repo) : super(TrackInitial());
  Future<void> fetchData() async {
    emit(TrackLoading());
    try {
      final data = await repo.fetchData();
      _originalData = data;
      emit(TrackLoaded(data));
    } catch (e) {
      emit(TrackError("Error cause $e"));
    }
  }
  void searchSurah(String query) {
    if (_originalData == null || _originalData!.data == null) return;
    if (query.isEmpty) {
      emit(TrackLoaded(_originalData!));
    } else {
      final filteredList = _originalData!.data!.where((surah) {
        final englishName = surah.englishName?.toLowerCase() ?? "";
        final arabicName = surah.name ?? "";
        return englishName.contains(query.toLowerCase()) || arabicName.contains(query);
      }).toList();
      emit(TrackLoaded(QuranResponse(
        code: _originalData!.code,
        message: _originalData!.message,
        data: filteredList,
      )));
    }
  }
}