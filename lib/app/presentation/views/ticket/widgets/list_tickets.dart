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
int selectedindex = 0;

class DataModel {
  final String imageName;

  DataModel(
    this.imageName,
  );
}

class _ListTicketState extends State<ListTicket> {
  late PageController _pageController;
  int _currentPage = 0;
  double positionPage = 1;
  int _activePage = 0;
  @override
  void initState() {
    super.initState();
    _pageController =
        PageController(initialPage: _currentPage, viewportFraction: 0.8);
  }

  @override
  void dispose() {
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
                  onPageChanged: (int index) {
                    setState(() {
                      _activePage = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    return carouselView(index);
                  }),
            ),
            SizedBox(
              height: 10.sp,
            ),
            Container(
              color: Colors.black12,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List<Widget>.generate(
                    dataList.length,
                    (index) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: InkWell(
                            onTap: () {
                              _pageController.animateToPage(index,
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.easeIn);
                            },
                            child: CircleAvatar(
                              radius: 5,
                              // check if a dot is connected to the current page
                              // if true, give it a different color
                              backgroundColor: _activePage == index
                                  ? const Color.fromRGBO(124, 98, 214, 1)
                                  : const Color.fromRGBO(255, 255, 255, 0.2),
                            ),
                          ),
                        )),
              ),
            ),
          ],
        ));
  }

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < dataList.length; i++) {
      list.add(i == selectedindex ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return Container(
      height: 10,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 150),
        margin: EdgeInsets.symmetric(horizontal: 4.0),
        height: isActive ? 10 : 8.0,
        width: isActive ? 12 : 8.0,
        decoration: BoxDecoration(
          boxShadow: [
            isActive
                ? BoxShadow(
                    color: Color(0XFF2FB7B2).withOpacity(0.72),
                    blurRadius: 4.0,
                    spreadRadius: 1.0,
                    offset: Offset(
                      0.0,
                      0.0,
                    ),
                  )
                : BoxShadow(
                    color: Colors.transparent,
                  )
          ],
          shape: BoxShape.circle,
          color: isActive ? Color(0XFF6BC4C9) : Color(0XFFEAEAEA),
        ),
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
                                fit: BoxFit.contain)),
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
