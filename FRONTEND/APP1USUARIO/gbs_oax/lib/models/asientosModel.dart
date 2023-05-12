class AsientoModel {
  final String rowSeats;
  final int seats;
  final List<int> freeSeats;

  AsientoModel(
      {required this.rowSeats, required this.seats, required this.freeSeats});

  static List<AsientoModel> listChairs = [
    AsientoModel(rowSeats: 'A', seats: 3, freeSeats: [2, 3]),
    AsientoModel(rowSeats: 'B', seats: 2, freeSeats: [1, 2]),
    AsientoModel(rowSeats: 'C', seats: 3, freeSeats: [1, 2, 3]),
    AsientoModel(rowSeats: 'D', seats: 3, freeSeats: [1, 2, 3]),
    AsientoModel(rowSeats: 'E', seats: 3, freeSeats: [1, 2, 3]),
    AsientoModel(rowSeats: 'F', seats: 3, freeSeats: [1, 2, 3]),
  ];
}
