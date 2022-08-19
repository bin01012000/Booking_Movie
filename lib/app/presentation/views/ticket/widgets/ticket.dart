import 'package:flutter/material.dart';
import 'package:flutter_gallery_3d/gallery3d.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../widgets/unicorn_outline_button.dart';

class Ticket extends StatefulWidget {
  const Ticket({Key? key}) : super(key: key);

  @override
  _TicketState createState() => _TicketState();
}

List<DataModel> dataList = [
  DataModel("assets/images/Image.png"),
  DataModel("assets/images/Image1.png"),
  DataModel("assets/images/Image2.png"),
];
int selectedindex = 0;

class DataModel {
  final String imageTicket;

  DataModel(
    this.imageTicket,
  );
}

late PageController _pageController;

class _TicketState extends State<Ticket> with TickerProviderStateMixin {
  int currentIndex = 0;
  @override
  void initState() {
    super.initState();
    _pageController =
        PageController(initialPage: currentIndex, viewportFraction: 0.8);
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  int _activePage = 0;
  Widget buildGallery3D() {
    return Wrap(spacing: 20.sp, children: [
      Center(
        child: Gallery3D(
            itemCount: dataList.length,
            width: 250.sp,
            height: 460.sp,
            isClip: false,

            // ellipseHeight: 80,
            itemConfig: GalleryItemConfig(
              width: 250.sp,
              height: 460.sp,
              radius: 10,
              isShowTransformMask: false,
              // shadows: [
              //   BoxShadow(
              //       color: Color(0x90000000), offset: Offset(2, 0), blurRadius: 5)
              // ]
            ),
            currentIndex: currentIndex,
            onItemChanged: (index) {
              setState(() {
                currentIndex = index;
                _activePage = index;
              });
            },
            itemBuilder: (context, index) {
              return carouselView(index);
            }),
      ),
      Container(
        margin: EdgeInsets.only(top: 20.sp),
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
                        backgroundColor: _activePage == index
                            ? const Color.fromRGBO(124, 98, 214, 1)
                            : const Color.fromRGBO(255, 255, 255, 0.2),
                      ),
                    ),
                  )),
        ),
      ),
    ]);
  }

  // ignore: unused_element
  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < dataList.length; i++) {
      list.add(i == selectedindex ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return SizedBox(
      height: 10,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        margin: const EdgeInsets.symmetric(horizontal: 4.0),
        height: isActive ? 10 : 8.0,
        width: isActive ? 12 : 8.0,
        decoration: BoxDecoration(
          boxShadow: [
            isActive
                ? BoxShadow(
                    color: const Color(0XFF2FB7B2).withOpacity(0.72),
                    blurRadius: 4.0,
                    spreadRadius: 1.0,
                    offset: const Offset(
                      0.0,
                      0.0,
                    ),
                  )
                : const BoxShadow(
                    color: Colors.transparent,
                  )
          ],
          shape: BoxShape.circle,
          color: isActive ? const Color(0XFF6BC4C9) : const Color(0XFFEAEAEA),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      children: [
        Container(
          padding: const EdgeInsets.only(top: 20),
          child: buildGallery3D(),
          margin: const EdgeInsets.fromLTRB(0, 20, 0, 20),
        ),
      ],
    ));
  }
}

Widget carouselView(int index) {
  return AnimatedBuilder(
    animation: _pageController,
    builder: (context, child) {
      double _value = 0.0;
      if (_pageController.hasClients) {
        if (_pageController.position.haveDimensions) {
          _value = index.toDouble() - (_pageController.page ?? 0);
          _value = (_value * 0.058).clamp(-1, 1);
        }
      }
      return Transform.rotate(
        angle: 3.14 * _value,
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
        width: 248.sp,
        height: 460.sp,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.sp),
          image: DecorationImage(
            image: AssetImage(data.imageTicket),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              clipBehavior: Clip.hardEdge,
              height: 132.sp,
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
                      width: double.infinity,
                      height: 50.0,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/Code barre.png'),
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
      background: const [],
      height: 460.sp,
      isDateTimeButton: true,
      width: 250.sp,
    ),
  );
}
