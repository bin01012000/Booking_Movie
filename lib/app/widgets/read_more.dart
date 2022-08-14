import 'package:booking_movie_ticket/app/common/utils/value/styles/app_text_style.dart';
import 'package:flutter/material.dart';

class DescriptionTextWidget extends StatefulWidget {
  const DescriptionTextWidget({Key? key, required this.text}) : super(key: key);
  final String text;

  @override
  _DescriptionTextWidgetState createState() => _DescriptionTextWidgetState();
}

class _DescriptionTextWidgetState extends State<DescriptionTextWidget> {
  late String firstHalf;
  late String secondHalf;

  bool flag = true;

  @override
  void initState() {
    super.initState();

    if (widget.text.length > 100) {
      firstHalf = widget.text.substring(0, 100);
      secondHalf = widget.text.substring(100, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      child: secondHalf.isEmpty
          ? Text(firstHalf)
          : Column(
              children: <Widget>[
                InkWell(
                  child: Text(
                    flag
                        ? (firstHalf + "..." + "read more")
                        : (firstHalf + secondHalf),
                    style: AppTextStyle.st15500,
                    textAlign: TextAlign.center,
                  ),
                  onTap: () {
                    setState(() {
                      flag = !flag;
                    });
                  },
                ),
              ],
            ),
    );
  }
}
