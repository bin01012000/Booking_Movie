import 'package:booking_movie_ticket/app/common/utils/value/styles/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ListItem {
  String isSelected;
  IconData icon;
  ListItem({
    required this.isSelected,
    required this.icon,
  });
}

class MyGridView extends StatefulWidget {
  const MyGridView({Key? key}) : super(key: key);

  @override
  _MyGridViewState createState() => _MyGridViewState();
}

class _MyGridViewState extends State<MyGridView> {
  final List<ListItem> _items = [
    ListItem(isSelected: "AVAILABLE", icon: Icons.chair),
    ListItem(isSelected: "RESERVED", icon: Icons.chair),
    ListItem(isSelected: "RESERVED", icon: Icons.chair),
    ListItem(isSelected: "AVAILABLE", icon: Icons.chair),
    ListItem(isSelected: "RESERVED", icon: Icons.chair),
    ListItem(isSelected: "RESERVED", icon: Icons.chair),
    ListItem(isSelected: "AVAILABLE", icon: Icons.chair),
    ListItem(isSelected: "RESERVED", icon: Icons.chair),
    ListItem(isSelected: "RESERVED", icon: Icons.chair),
    ListItem(isSelected: "AVAILABLE", icon: Icons.chair),
    ListItem(isSelected: "RESERVED", icon: Icons.chair),
    ListItem(isSelected: "RESERVED", icon: Icons.chair),
    ListItem(isSelected: "AVAILABLE", icon: Icons.chair),
    ListItem(isSelected: "RESERVED", icon: Icons.chair),
    ListItem(isSelected: "RESERVED", icon: Icons.chair),
    ListItem(isSelected: "AVAILABLE", icon: Icons.chair),
    ListItem(isSelected: "RESERVED", icon: Icons.chair),
    ListItem(isSelected: "RESERVED", icon: Icons.chair),
    ListItem(isSelected: "AVAILABLE", icon: Icons.chair),
    ListItem(isSelected: "RESERVED", icon: Icons.chair),
    ListItem(isSelected: "RESERVED", icon: Icons.chair),
    ListItem(isSelected: "AVAILABLE", icon: Icons.chair),
    ListItem(isSelected: "RESERVED", icon: Icons.chair),
    ListItem(isSelected: "RESERVED", icon: Icons.chair),
    ListItem(isSelected: "AVAILABLE", icon: Icons.chair),
    ListItem(isSelected: "RESERVED", icon: Icons.chair),
    ListItem(isSelected: "RESERVED", icon: Icons.chair),
    ListItem(isSelected: "AVAILABLE", icon: Icons.chair),
    ListItem(isSelected: "AVAILABLE", icon: Icons.chair),
    ListItem(isSelected: "RESERVED", icon: Icons.chair),
    ListItem(isSelected: "RESERVED", icon: Icons.chair),
    ListItem(isSelected: "AVAILABLE", icon: Icons.chair),
    ListItem(isSelected: "AVAILABLE", icon: Icons.chair),
    ListItem(isSelected: "RESERVED", icon: Icons.chair),
    ListItem(isSelected: "AVAILABLE", icon: Icons.chair),
    ListItem(isSelected: "AVAILABLE", icon: Icons.chair),
    ListItem(isSelected: "AVAILABLE", icon: Icons.chair),
    ListItem(isSelected: "AVAILABLE", icon: Icons.chair),
    ListItem(isSelected: "RESERVED", icon: Icons.chair),
    ListItem(isSelected: "AVAILABLE", icon: Icons.chair),
  ];
  // set an int with value -1 since no card has been selected
  int selectedCard = -1;
  final IconData chair = const IconData(0xe14d, fontFamily: 'MaterialIcons');
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
                child: Icon(
                  _items[index].icon,
                  color: _getColor(_items[index].isSelected),
                ),
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
        return const Color.fromRGBO(182, 17, 107, 1);
      case "SELECTED":
        return const Color.fromRGBO(9, 251, 211, 1);
      default:
        return Colors.white;
    }
  }
}
