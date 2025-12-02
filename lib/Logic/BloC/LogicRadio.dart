import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotifyyapp/data/Radio_responses.dart';
import 'package:spotifyyapp/data/user_repo.dart';
abstract class RadioState {}
class RadioInitial extends RadioState {}
class RadioLoading extends RadioState {}
class RadioLoaded extends RadioState {
  final RadioResponses responses;
  RadioLoaded(this.responses);
}
class RadioError extends RadioState {
  final String message;
  RadioError(this.message);
}
class RadioCubit extends Cubit<RadioState> {
  final UserRepo repo;
  RadioCubit(this.repo) : super(RadioInitial());
  Future<void> fetchRadioStations() async {
    emit(RadioLoading());

    try {
      final RadioResponses radioData = await repo.fetchRadioStation();
      emit(RadioLoaded(radioData));
    } catch (e) {
      emit(RadioError(e.toString()));
    }
  }
}
