import 'package:flutter/material.dart';
import 'package:fab_circular_menu_plus/fab_circular_menu_plus.dart';

import 'package:sathixhprofile/eduexpan.dart';
import 'package:sathixhprofile/getintouch.dart';
import 'package:sathixhprofile/homepage.dart';

import 'package:sathixhprofile/skills.dart';

class Fabmenu extends StatefulWidget {
  Fabmenu({Key? key}) : super(key: key);

  @override
  _FabmenuState createState() => _FabmenuState();
}

class _FabmenuState extends State<Fabmenu> {
  final GlobalKey<FabCircularMenuPlusState> fabKey = GlobalKey();
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = 0; // Initialize to profile content
  }

  @override
  Widget build(BuildContext context) {
    Widget? currentContent;
    switch (_selectedIndex) {
      case 0:
        currentContent = Homepage();
        break;

      case 1:
        currentContent = EduExpansion();
        break;
      case 2:
        currentContent = VloggerContent();
        break;
      case 3:
        currentContent = GetInTouch();
        break;
      default:
        currentContent = Homepage();
    }

    return SafeArea(
      child: Scaffold(
        body: currentContent,
        floatingActionButton: Builder(
          builder: (context) => FabCircularMenuPlus(
            key: fabKey,
            alignment: Alignment.bottomRight,
            ringColor: Color(0xFF0043D0),
            ringDiameter: 400.0,
            ringWidth: 80.0,
            fabSize: 70.0,
            fabElevation: 10.0,
            fabIconBorder: const CircleBorder(),
            fabColor: Color(0xFF0043D0),
            fabOpenIcon: Icon(Icons.menu, color: Colors.white),
            fabCloseIcon: Icon(Icons.close, color: Colors.white),
            fabMargin: const EdgeInsets.all(0.0),
            animationDuration: const Duration(milliseconds: 1000),
            animationCurve: Curves.easeInOutCirc,
            onDisplayChange: (isOpen) {},
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: IconButton(
                  onPressed: () {
                    setState(() {
                      _selectedIndex = 0;
                      fabKey.currentState?.close();
                    });
                  },
                  icon: ImageIcon(
                    color: Colors.white,
                    size: 40,
                    AssetImage("assets/gif/smart-house-unscreen.gif"),
                  ),
                ),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    _selectedIndex = 1;
                    fabKey.currentState?.close();
                  });
                },
                icon: ImageIcon(
                  color: Colors.white,
                  AssetImage("assets/gif/graduate-unscreen.gif"),
                  size: 40,
                ),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    _selectedIndex = 2;
                    fabKey.currentState?.close();
                  });
                },
                icon: ImageIcon(
                  color: Colors.white,
                  size: 40,
                  AssetImage("assets/gif/vlogger-unscreen.gif"),
                ),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    _selectedIndex = 3;
                    fabKey.currentState?.close();
                  });
                },
                icon: ImageIcon(
                    color: Colors.white,
                    size: 40,
                    AssetImage("assets/gif/profile-unscreen.gif")),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text('Profile Content')));
  }
}

class GraduateContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Graduate Content'));
  }
}

class SocialMediaContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Social Media Content'));
  }
}
