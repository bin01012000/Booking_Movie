import 'package:flutter/material.dart';

class ImageNetworkCustom extends StatefulWidget {
  const ImageNetworkCustom({Key? key, required this.url}) : super(key: key);
  final String url;

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
      frameBuilder: (BuildContext context, Widget child, int? frame,
          bool wasSynchronouslyLoaded) {
        if (wasSynchronouslyLoaded) {
          return child;
        }
        return AnimatedOpacity(
          child: child,
          opacity: loading ? 0 : 1,
          duration: const Duration(seconds: 3),
          curve: Curves.easeOut,
        );
      },
      loadingBuilder: (BuildContext context, Widget child,
          ImageChunkEvent? loadingProgress) {
        if (loadingProgress == null) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (mounted) {
              setState(() => loading = false);
            }
          });

          return child;
        }
        loading = true;
        return Center(
          child: CircularProgressIndicator(
            value: loadingProgress.expectedTotalBytes != null
                ? loadingProgress.cumulativeBytesLoaded /
                    int.parse(loadingProgress.expectedTotalBytes.toString())
                : null,
          ),
        );
      },
    );
  }
}
