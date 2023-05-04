import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'urban_event.dart';
part 'urban_state.dart';

class UrbanBloc extends Bloc<UrbanEvent, UrbanState> {
  UrbanBloc() : super(UrbanState()) {
    on<OnSelectedSeatsEvent>(_onSelectedSeats);
  }

  List<String> seats = [];

  Future<void> _onSelectedSeats(
      OnSelectedSeatsEvent event, Emitter<UrbanState> emit) async {
    if (seats.contains(event.selectedSeats)) {
      seats.remove(event.selectedSeats);
      emit(state.copyWith(selectedSeats: seats));
    } else {
      seats.add(event.selectedSeats);
      emit(state.copyWith(selectedSeats: seats));
    }
  }
}
