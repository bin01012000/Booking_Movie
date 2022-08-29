import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ImageNetworkCustom extends StatefulWidget {
  const ImageNetworkCustom(
      {Key? key,
      required this.url,
      this.width = double.infinity,
      this.height = double.infinity})
      : super(key: key);
  final String url;
  final double width;
  final double height;

  @override
  State<ImageNetworkCustom> createState() => _ImageNetworkCustomState();
}

class _ImageNetworkCustomState extends State<ImageNetworkCustom> {
  @override
  Widget build(BuildContext context) {
    bool loading = false;
    return Image.network(
      widget.url,
      fit: BoxFit.cover,
      width: widget.width,
      height: widget.height,
      frameBuilder: (BuildContext context, Widget child, int? frame,
          bool wasSynchronouslyLoaded) {
        if (wasSynchronouslyLoaded) {
          return child;
        }
        return AnimatedOpacity(
          child: child,
          opacity: loading ? 0 : 1,
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeOut,
        );
      },
      errorBuilder:
          (BuildContext context, Object exception, StackTrace? stackTrace) {
        return const Text('😢');
      },
      loadingBuilder: (BuildContext context, Widget child,
          ImageChunkEvent? loadingProgress) {
        if (loadingProgress == null) {
          WidgetsBinding.instance?.addPostFrameCallback((_) {
            if (mounted) {
              setState(() => loading = false);
            }
          });

          return child;
        }
        loading = true;
        return Center(
          child: SpinKitCircle(
            color: Colors.white,
            size: 30.sp,
          ),
        );
      },
    );
  }
}
