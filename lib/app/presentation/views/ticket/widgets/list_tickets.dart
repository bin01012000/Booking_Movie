import 'dart:math';
import 'package:booking_movie_ticket/app/widgets/unicorn_outline_button.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ListTicket extends StatefulWidget {
  const ListTicket({Key? key}) : super(key: key);

  @override
  _ListTicketState createState() => _ListTicketState();
}

List<DataModel> dataList = [
  DataModel("assets/images/Image.png"),
  DataModel("assets/images/Image1.png"),
  DataModel("assets/images/Image2.png"),
];

class DataModel {
  final String imageName;

  DataModel(
    this.imageName,
  );
}

class _ListTicketState extends State<ListTicket> {
  late PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController =
        PageController(initialPage: _currentPage, viewportFraction: 0.8);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 40),
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 0.85,
              child: PageView.builder(
                  itemCount: dataList.length,
                  physics: const ClampingScrollPhysics(),
                  controller: _pageController,
                  itemBuilder: (context, index) {
                    return carouselView(index);
                  }),
            ),
            SizedBox(height: 20.sp),
            dotIndication(),
          ],
        ));
  }

  Widget dotIndication() {
    return DotsIndicator(
      dotsCount: dataList.length,
      position: 1,
      decorator: DotsDecorator(
        activeColor: Color.fromRGBO(124, 98, 214, 1),
        size: const Size.square(9.0),
        activeSize: const Size(9.0, 9.0),
        activeShape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
      ),
    );
  }

  Widget carouselView(int index) {
    return AnimatedBuilder(
      animation: _pageController,
      builder: (context, child) {
        double _value = 0.0;
        if (_pageController.position.haveDimensions) {
          _value = index.toDouble() - (_pageController.page ?? 0);
          _value = (_value * 0.058).clamp(-1, 1);
        }
        return Transform.rotate(
          angle: pi * _value,
          child: carouselCard(dataList[index]),
        );
      },
    );
  }

  Widget carouselCard(DataModel data) {
    return Center(
      child: UnicornOutlineButton(
        strokeWidth: 1,
        radius: 20.sp,
        gradient: const LinearGradient(
          colors: [
            Color.fromRGBO(96, 255, 202, 1),
            Color.fromRGBO(96, 255, 202, 0)
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        child: Container(
          width: 250,
          height: 460,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.sp),
            image: DecorationImage(
              image: AssetImage(data.imageName),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                width: 250,
                height: 132,
                decoration: BoxDecoration(
                    color: const Color.fromRGBO(255, 255, 255, 0.6),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20.sp),
                        bottomRight: Radius.circular(20.sp))),
                child: Column(
                  children: [
                    SizedBox(
                      height: 10.sp,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Date: April 23'),
                        SizedBox(
                          width: 30.sp,
                        ),
                        const Text('Time: 6 p.m.')
                      ],
                    ),
                    SizedBox(
                      height: 20.sp,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Row: 2'),
                        SizedBox(
                          width: 75.sp,
                        ),
                        const Text('Seats: 9 , 10')
                      ],
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 1.0, left: 30.0, right: 30.0),
                      child: Container(
                        width: 250.0,
                        height: 50.0,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image:
                                    AssetImage('assets/images/Code barre.png'),
                                fit: BoxFit.cover)),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        onPressed: () {},
        background: [],
        height: 460,
        isDateTimeButton: true,
        width: 250,
      ),
    );
  }
}
