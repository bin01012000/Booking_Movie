import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ListItem {
  String isSelected;

  ListItem({
    required this.isSelected,
  });
}

class MyGridView extends StatefulWidget {
  const MyGridView({Key? key}) : super(key: key);

  @override
  _MyGridViewState createState() => _MyGridViewState();
}

class _MyGridViewState extends State<MyGridView> {
  final List<ListItem> _items = [
    ListItem(isSelected: "AVAILABLE"),
    ListItem(isSelected: "RESERVED"),
    ListItem(isSelected: "RESERVED"),
    ListItem(isSelected: "AVAILABLE"),
    ListItem(isSelected: "RESERVED"),
    ListItem(isSelected: "RESERVED"),
    ListItem(isSelected: "AVAILABLE"),
    ListItem(isSelected: "RESERVED"),
    ListItem(isSelected: "RESERVED"),
    ListItem(isSelected: "AVAILABLE"),
    ListItem(isSelected: "RESERVED"),
    ListItem(isSelected: "RESERVED"),
    ListItem(isSelected: "AVAILABLE"),
    ListItem(isSelected: "RESERVED"),
    ListItem(isSelected: "RESERVED"),
    ListItem(isSelected: "AVAILABLE"),
    ListItem(isSelected: "RESERVED"),
    ListItem(isSelected: "RESERVED"),
    ListItem(isSelected: "AVAILABLE"),
    ListItem(isSelected: "RESERVED"),
    ListItem(isSelected: "RESERVED"),
    ListItem(isSelected: "AVAILABLE"),
    ListItem(isSelected: "RESERVED"),
    ListItem(isSelected: "RESERVED"),
    ListItem(isSelected: "AVAILABLE"),
    ListItem(isSelected: "RESERVED"),
    ListItem(isSelected: "RESERVED"),
    ListItem(isSelected: "AVAILABLE"),
    ListItem(isSelected: "AVAILABLE"),
    ListItem(isSelected: "RESERVED"),
    ListItem(isSelected: "RESERVED"),
    ListItem(isSelected: "AVAILABLE"),
    ListItem(isSelected: "AVAILABLE"),
    ListItem(isSelected: "RESERVED"),
    ListItem(isSelected: "AVAILABLE"),
    ListItem(isSelected: "AVAILABLE"),
    ListItem(isSelected: "AVAILABLE"),
    ListItem(isSelected: "AVAILABLE"),
    ListItem(isSelected: "RESERVED"),
    ListItem(isSelected: "AVAILABLE"),
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
                if (_items[index].isSelected != "RESERVED") {
                  _items[index].isSelected == "SELECTED"
                      ? _items[index].isSelected = "AVAILABLE"
                      : _items[index].isSelected = "SELECTED";
                }
              });
            },

            // check if the index is equal to the selected Card integer

            child: Container(
              color: Colors.transparent,
              child: Center(
                child: _getImage(_items[index].isSelected),
              ),
            ),
          );
        });
  }

  _getImage(String status) {
    switch (status) {
      case "AVAILABLE":
        return SvgPicture.asset("assets/icons/seatavaiable.svg");
      case "RESERVED":
        return SvgPicture.asset("assets/icons/seatreseved.svg");
      case "SELECTED":
        return SvgPicture.asset("assets/icons/seatselected.svg");
      default:
        return SvgPicture.asset("assets/icons/seatavaiable.svg");
    }
  }
}
