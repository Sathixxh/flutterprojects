import 'package:flutter/material.dart';
import 'package:sathixhprofile/widget/magzine.dart';

class MagazineCoverImage extends StatelessWidget {
  const MagazineCoverImage({
    required this.magazine,
    super.key,
    this.height,
  });

  final Magazine magazine;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: AspectRatio(
        aspectRatio: .80,
        child: DecoratedBox(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                magazine.assetImage,
              ),
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}
