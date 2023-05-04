import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gbs_oax/pages/Bloc/Urban_bloc.dart';
import 'package:gbs_oax/pages/NavBar/pages/components/paint_seat.dart';

class SeatRow extends StatelessWidget {
  final int numSeats;
  final List<int> freeSeats;
  final String rowSeats;

  const SeatRow(
      {Key? key,
      required this.rowSeats,
      required this.numSeats,
      required this.freeSeats})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final urbanBloc = BlocProvider.of<UrbanBloc>(context);
    return Center(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(numSeats, (i) {
          if (freeSeats.contains(i + 1)) {
            return InkWell(
                onTap: () =>
                    urbanBloc.add(OnSelectedSeatsEvent('$rowSeats${i + 1}')),
                child: BlocBuilder<UrbanBloc, UrbanState>(
                    builder: (_, state) => PaintChair(
                        color: state.selectedSeats.contains('$rowSeats${i + 1}')
                            ? Colors.amber
                            : Colors.white)));
          }

          return PaintChair();
        }),
      ),
    );
  }
}
