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
  TracksCubit(this.repo) : super(TrackInitial());

  Future<void> fetchData() async {
    emit(TrackLoading());
    try {
      final data = await repo.fetchData();
      emit(TrackLoaded(data));
    } catch (e) {
      emit(TrackError(e.toString()));
    }
  }
}
