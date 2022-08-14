import 'package:booking_movie_ticket/app/common/utils/value/styles/app_text_style.dart';
import 'package:booking_movie_ticket/app/presentation/views/home/widgets/body_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradient_like_css/gradient_like_css.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _controller = PageController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Container(
        width: 1.sw,
        height: 1.sh,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(50.sp)),
          gradient: linearGradient(170.53, ['#2e1371 2.71%', '#130b2b 97.75%']),
        ),
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            elevation: 0,
            centerTitle: true,
            backgroundColor: Colors.transparent,
            title: Text(
              "Home",
              style: AppTextStyle.st20700,
            ),
          ),
          backgroundColor: Colors.transparent,
          body: const BodyHome(),
        ),
      ),
    );
  }
}
