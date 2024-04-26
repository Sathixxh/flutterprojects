import 'package:flutter/material.dart';
import 'package:houseui/screen2.dart';
import 'package:houseui/widgets/contwidgets.dart';

// import 'package:temptask/route.dart' as route;

class Screen3 extends StatefulWidget {
  const Screen3({super.key});

  @override
  State<Screen3> createState() => _Screen3State();
}

class _Screen3State extends State<Screen3> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.020,
              ),
              Row(
                children: [
                  InkWell(
                      onTap: () {
                        Navigator.pop(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Screen2(),
                            ));
                      },
                      child: const Icon(
                        Icons.arrow_back,
                        color: Color.fromARGB(255, 178, 178, 178),
                      )),
                  const SizedBox(width: 100.0),
                  const Text(
                    'Details',
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700),
                  )
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(30.0)),
                child: Image.network(
                  "https://images.unsplash.com/photo-1602343168117-bb8ffe3e2e9f?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTJ8fGx1eHVyeSUyMGhvdXNlfGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=60",
                  fit: BoxFit.cover,
                  width: MediaQuery.of(context).size.width * 0.90,
                  height: MediaQuery.of(context).size.height * 0.30,
                ),
              ),
              // Container(
              //   width: MediaQuery.of(context).size.width * 0.90,
              //   height: MediaQuery.of(context).size.height * 0.30,
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.all(Radius.circular(30.0)),
              //     image: DecorationImage(
              //       image: NetworkImage(
              //           'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTJsrvlpCyL2jHZB8HbxwI8OQtAMOymCgW_rzNG8AZi&s'),
              //       fit: BoxFit.cover,
              //     ),

              //   ),
              // ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.020,
              ),
              const Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Duplex Home',
                    style: TextStyle(
                        fontSize: 18.0,
                        color: Color.fromRGBO(74, 75, 75, 1),
                        fontWeight: FontWeight.bold),
                  ),
                  Text("\$11000/month",
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(61, 107, 135, 1),
                      )),
                ],
              ),
              const SizedBox(
                height: 10.0,
              ),
              const Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Icon(
                        Icons.location_on,
                        color: Color.fromARGB(255, 119, 118, 118),
                        size: 15.0,
                      ),
                      Text(
                        '111/A, Street-4,Guindy chennai',
                        style: TextStyle(
                            color: Color.fromARGB(255, 119, 118, 118)),
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 10.0,
              ),

              // RichText(
              //   textAlign: TextAlign.start,
              //     text: TextSpan(children: [
              //   WidgetSpan(
              //     child: Icon(
              //       Icons.location_on,
              //       color: Color.fromARGB(255, 119, 118, 118),
              //       size: 12.0,
              //     ),
              //   ),
              //   TextSpan(
              //     text:   '111/A, Street-4,Sydney,Austraolia',
              //     style: TextStyle(
              //         color: Color.fromARGB(255, 119, 118, 118), fontSize: 12.0),
              //   )
              // ])),
              const SizedBox(
                height: 0.08,
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text('House information',
                      style: TextStyle(
                          color: Color.fromARGB(255, 67, 67, 67),
                          fontSize: 16.0,
                          fontWeight: FontWeight.w900)),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      myIcons(context, iconData: (Icons.bed)),
                      myIcons(context, iconData: (Icons.bathroom)),
                      myIcons(context, iconData: (Icons.kitchen_outlined)),
                      myIcons(context, iconData: (Icons.dining_rounded)),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  const Text('House information',
                      style: TextStyle(
                          color: Color.fromARGB(255, 67, 67, 67),
                          fontSize: 16.0,
                          fontWeight: FontWeight.w900)),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  RichText(
                    text: const TextSpan(
                      children: [
                        TextSpan(
                            text:
                                'Some of the familiar house types are kutcha houses,    bungalows, farmhouses, apartments, and villas, among others. While the modern school of architecture has ..........',
                            style: TextStyle(
                                color: Color.fromRGBO(173, 174, 175, 1),
                                height: 1.2)),
                        WidgetSpan(
                            child: InkWell(
                          child: Text('read more',
                              style: TextStyle(
                                  color: Color.fromRGBO(154, 176, 252, 0.9))),
                        ))
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.08,
                    child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                const MaterialStatePropertyAll(Colors.indigo),
                            shape:
                                MaterialStatePropertyAll(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ))),
                        onPressed: () {},
                        child: const Text(
                          'Rent Now',
                          style: TextStyle(fontSize: 20.0, color: Colors.white),
                        )),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
