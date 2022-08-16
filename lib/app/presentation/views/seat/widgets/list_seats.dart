import 'package:booking_movie_ticket/app/common/utils/value/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ListItem {
  String statusSeat;

  ListItem({
    required this.statusSeat,
  });
}

class MyGridView extends StatefulWidget {
  const MyGridView({Key? key}) : super(key: key);

  @override
  _MyGridViewState createState() => _MyGridViewState();
}

class _MyGridViewState extends State<MyGridView> {
  final List<ListItem> _items = [
    ListItem(statusSeat: "AVAILABLE"),
    ListItem(statusSeat: "RESERVED"),
    ListItem(statusSeat: "RESERVED"),
    ListItem(statusSeat: "AVAILABLE"),
    ListItem(statusSeat: "RESERVED"),
    ListItem(statusSeat: "RESERVED"),
    ListItem(statusSeat: "AVAILABLE"),
    ListItem(statusSeat: "RESERVED"),
    ListItem(statusSeat: "RESERVED"),
    ListItem(statusSeat: "AVAILABLE"),
    ListItem(statusSeat: "RESERVED"),
    ListItem(statusSeat: "RESERVED"),
    ListItem(statusSeat: "AVAILABLE"),
    ListItem(statusSeat: "RESERVED"),
    ListItem(statusSeat: "RESERVED"),
    ListItem(statusSeat: "AVAILABLE"),
    ListItem(statusSeat: "RESERVED"),
    ListItem(statusSeat: "RESERVED"),
    ListItem(statusSeat: "AVAILABLE"),
    ListItem(statusSeat: "RESERVED"),
    ListItem(statusSeat: "RESERVED"),
    ListItem(statusSeat: "AVAILABLE"),
    ListItem(statusSeat: "RESERVED"),
    ListItem(statusSeat: "RESERVED"),
    ListItem(statusSeat: "AVAILABLE"),
    ListItem(statusSeat: "RESERVED"),
    ListItem(statusSeat: "RESERVED"),
    ListItem(statusSeat: "AVAILABLE"),
    ListItem(statusSeat: "AVAILABLE"),
    ListItem(statusSeat: "RESERVED"),
    ListItem(statusSeat: "RESERVED"),
    ListItem(statusSeat: "AVAILABLE"),
    ListItem(statusSeat: "AVAILABLE"),
    ListItem(statusSeat: "RESERVED"),
    ListItem(statusSeat: "AVAILABLE"),
    ListItem(statusSeat: "AVAILABLE"),
    ListItem(statusSeat: "AVAILABLE"),
    ListItem(statusSeat: "AVAILABLE"),
    ListItem(statusSeat: "RESERVED"),
    ListItem(statusSeat: "AVAILABLE"),
  ];
  // set an int with value -1 since no card has been selected
  int selectedCard = -1;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        itemCount: _items.length,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 8,
        ),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                if (_items[index].statusSeat != "RESERVED") {
                  _items[index].statusSeat == "SELECTED"
                      ? _items[index].statusSeat = "AVAILABLE"
                      : _items[index].statusSeat = "SELECTED";
                }
              });
            },

            // check if the index is equal to the selected Card integer

            child: Container(
              color: Colors.transparent,
              child: Center(
                child: SvgPicture.asset("assets/icons/seatavaiable.svg",
                    color: _getColor(_items[index].statusSeat)),
              ),
            ),
          );
        });
  }

  Color _getColor(String status) {
    switch (status) {
      case "AVAILABLE":
        return Colors.white;
      case "RESERVED":
        return AppColors.red;
      case "SELECTED":
        return AppColors.green;
      default:
        return Colors.white;
    }
  }
}
