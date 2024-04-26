import 'package:flutter/material.dart';
import 'package:houseui/screen2.dart';

class Sc1 extends StatefulWidget {
  const Sc1({super.key});
  @override
  State<Sc1> createState() => _Sc1State();
}

class _Sc1State extends State<Sc1> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        _showModalBottomSheet();
      },
    );
  }

  void _showModalBottomSheet() {
    showModalBottomSheet(
      barrierColor: Colors.transparent,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0))),
      context: context,
      builder: (BuildContext context) {
        return Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0)),
          ),
          height: 300,
          //  width: MediaQuery.of(context).size.width,
          width: double.infinity,
          child: Column(
            children: [
              Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.030,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.50,
                    child: const Text(
                      'Find your Dream house ',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color.fromRGBO(67, 72, 76, 0.9),
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.95,
                    child: const Text(
                      'we always ready to provide you the best rental house within effordable price',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.grey, fontSize: 17.0),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.020,
                  ),
                  FloatingActionButton(
                    elevation: 0.0,
                    backgroundColor: const Color.fromRGBO(234, 237, 249, 1),
                    shape: const StarBorder.polygon(
                        sides: 4.0, pointRounding: 0.5),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Screen2(),
                          ));
                    },
                    child: const Icon(Icons.keyboard_double_arrow_right_rounded,
                        color: Color.fromRGBO(80, 118, 252, 1)),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.020,
                  ),
                  const Text(
                    'skip',
                    style: TextStyle(fontSize: 17.0),
                  )
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      'https://images.unsplash.com/photo-1602343168117-bb8ffe3e2e9f?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTJ8fGx1eHVyeSUyMGhvdXNlfGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=60'),
                  fit: BoxFit.fitHeight)),
        ),
      ),
    );
  }
}
