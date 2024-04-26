import 'package:flutter/material.dart';
import 'package:sathixhprofile/indrag.dart';
import 'package:sathixhprofile/widget/magcover.dart';
import 'package:sathixhprofile/widget/magzine.dart';

// import '../../../../core/core.dart';

// import '../widgets/infinite_dragable_slider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
    this.enableEntryAnimation = false,
    this.initialIndex = 0,
  });

  final bool enableEntryAnimation;
  final int initialIndex;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  final List<Magazine> magazines = Magazine.fakeMagazinesValues;
  late int currentIndex;

  @override
  void initState() {
    currentIndex = widget.initialIndex;

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(50, 0, 10, 0),
            child: Container(
              height: 350,
              width: 350,
              child: InfiniteDragableSlider(
                iteamCount: Magazine.fakeMagazinesValues.length,
                itemBuilder: (context, index) => MagazineCoverImage(
                    magazine: Magazine.fakeMagazinesValues[index]),
              ),
            ),
          ),
        ),
        SizedBox(height: 72),
        SizedBox(height: 12),
      ],
    );
  }
}
