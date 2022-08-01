import 'dart:math';

import 'package:flutter/material.dart';
import 'package:item_selector/item_selector.dart';

class ListItem {
  bool isSelected;
  IconData icon;
  ListItem({
    required this.isSelected,
    required this.icon,
  });
}

class MyGridView extends StatefulWidget {
  @override
  _MyGridViewState createState() => _MyGridViewState();
}

class _MyGridViewState extends State<MyGridView> {
  List<ListItem> _items = [
    ListItem(isSelected: true, icon: Icons.chair),
    ListItem(isSelected: false, icon: Icons.chair),
    ListItem(isSelected: false, icon: Icons.chair),
    ListItem(isSelected: true, icon: Icons.chair),
    ListItem(isSelected: false, icon: Icons.chair),
    ListItem(isSelected: false, icon: Icons.chair),
    ListItem(isSelected: true, icon: Icons.chair),
    ListItem(isSelected: false, icon: Icons.chair),
    ListItem(isSelected: false, icon: Icons.chair),
    ListItem(isSelected: true, icon: Icons.chair),
    ListItem(isSelected: false, icon: Icons.chair),
    ListItem(isSelected: false, icon: Icons.chair),
    ListItem(isSelected: true, icon: Icons.chair),
    ListItem(isSelected: false, icon: Icons.chair),
    ListItem(isSelected: false, icon: Icons.chair),
    ListItem(isSelected: true, icon: Icons.chair),
    ListItem(isSelected: false, icon: Icons.chair),
    ListItem(isSelected: false, icon: Icons.chair),
    ListItem(isSelected: true, icon: Icons.chair),
    ListItem(isSelected: false, icon: Icons.chair),
    ListItem(isSelected: false, icon: Icons.chair),
    ListItem(isSelected: true, icon: Icons.chair),
    ListItem(isSelected: false, icon: Icons.chair),
    ListItem(isSelected: false, icon: Icons.chair),
    ListItem(isSelected: true, icon: Icons.chair),
    ListItem(isSelected: false, icon: Icons.chair),
    ListItem(isSelected: false, icon: Icons.chair),
    ListItem(isSelected: true, icon: Icons.chair),
    ListItem(isSelected: true, icon: Icons.chair),
    ListItem(isSelected: false, icon: Icons.chair),
    ListItem(isSelected: false, icon: Icons.chair),
    ListItem(isSelected: true, icon: Icons.chair),
  ];
  // set an int with value -1 since no card has been selected
  int selectedCard = -1;
  static const IconData chair = IconData(0xe14d, fontFamily: 'MaterialIcons');
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: false,
        scrollDirection: Axis.vertical,
        itemCount: _items.length,
        gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 8,
        ),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                if (_items[index].isSelected == true) {
                  // ontap of each card, set the defined int to the grid view index
                  selectedCard = index;
                } else {
                  return null;
                }
              });
            },

            // check if the index is equal to the selected Card integer

            child: Container(
              color: Colors.transparent,
              child: Center(
                  child: Icon(_items[index].icon,
                      color: _items[index].isSelected == false
                          ? Color.fromRGBO(182, 17, 107, 1)
                          : selectedCard == index
                              ? Color.fromRGBO(9, 251, 211, 1)
                              : Colors.white)),
            ),
          );
        });
  }
}
