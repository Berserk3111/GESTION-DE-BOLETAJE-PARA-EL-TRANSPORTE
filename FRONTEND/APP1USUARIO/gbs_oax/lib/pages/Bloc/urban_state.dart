part of 'Urban_bloc.dart';

@immutable
class UrbanState {
  final List<String> selectedSeats;

  UrbanState({List<String>? selectedSeats})
      : this.selectedSeats = selectedSeats ?? [];

  UrbanState copyWith({List<String>? selectedSeats}) =>
      UrbanState(selectedSeats: selectedSeats ?? this.selectedSeats);
}
