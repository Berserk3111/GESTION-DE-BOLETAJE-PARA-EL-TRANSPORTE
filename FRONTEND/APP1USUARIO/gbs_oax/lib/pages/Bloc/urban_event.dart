part of 'Urban_bloc.dart';

@immutable
abstract class UrbanEvent {}

class OnSelectedSeatsEvent extends UrbanEvent {
  final String selectedSeats;

  OnSelectedSeatsEvent(this.selectedSeats);
}
