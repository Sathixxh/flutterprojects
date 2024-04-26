import 'package:flutter/material.dart';

class Sc3 extends StatefulWidget {
  const Sc3({super.key});

  @override
  State<Sc3> createState() => _Sc3State();
}

class _Sc3State extends State<Sc3> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 100,
                margin: const EdgeInsets.only(left: 10.0),
                child: const Row(
                  children: [
                    SizedBox(
                      width: 8.0,
                    ),
                    Icon(
                      Icons.arrow_back,
                      color: Color.fromARGB(255, 178, 178, 178),
                    ),
                    SizedBox(width: 100.0),
                    Text(
                      'Details',
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.w600),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.30,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                  image: DecorationImage(
                    image: NetworkImage(
                        "https://images.unsplash.com/photo-1602343168117-bb8ffe3e2e9f?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTJ8fGx1eHVyeSUyMGhvdXNlfGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=60"),
                    fit: BoxFit.cover,
                  ),
                  color: Color.fromARGB(255, 224, 107, 107),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.04,
                child: const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Duplex Home',
                      style: TextStyle(
                          fontSize: 18.0,
                          color: Color.fromARGB(255, 34, 34, 34),
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "\$2600/month",
                      style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 11, 94, 172)),
                    ),
                  ],
                ),
              ),
              // Container(
              //  // width: MediaQuery.of(context).size.width * 0.90,
              //   child: Column(
              //     mainAxisAlignment: MainAxisAlignment.start,
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [
              //       Row(
              //         mainAxisSize: MainAxisSize.max,
              //         children: [
              //           Icon(
              //             Icons.location_on,
              //             color: Color.fromARGB(255, 119, 118, 118),
              //             size: 15.0,
              //           ),
              //           Text(
              //             '111/A, Street-4,Sydney,Austraolia',
              //             style: TextStyle(
              //                 color: Color.fromARGB(255, 119, 118, 118)),
              //           ),
              //         ],
              //       )
              //     ],
              //   ),
              // ),
              const SizedBox(
                height: 20.0,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.45,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('House information',
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.w900)),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            color: const Color(0xFFF1F5F8),
                          ),
                          height: 70.0,
                          width: 70.0,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(
                                Icons.bed,
                                color: const Color(0xFF6371F1).withOpacity(0.6),
                              ),
                              const Text(
                                '3Bed',
                                style: TextStyle(
                                  color: Color(0xFF6371F1),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            color: const Color.fromARGB(255, 241, 245, 248),
                          ),
                          height: 70.0,
                          width: 70.0,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(
                                Icons.shower,
                                color: const Color.fromARGB(255, 99, 113, 241)
                                    .withOpacity(0.6),
                              ),
                              const Text(
                                '3Bed',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 99, 113, 241),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            color: const Color.fromARGB(255, 241, 245, 248),
                          ),
                          height: 70.0,
                          width: 70.0,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(
                                Icons.kitchen,
                                color: const Color.fromARGB(255, 99, 113, 241)
                                    .withOpacity(0.6),
                              ),
                              const Text(
                                '3Bed',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 99, 113, 241),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            color: const Color.fromARGB(255, 241, 245, 248),
                          ),
                          height: 70.0,
                          width: 70.0,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(
                                Icons.dining,
                                color: const Color.fromARGB(255, 99, 113, 241)
                                    .withOpacity(0.6),
                              ),
                              const Text(
                                '3Bed',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 99, 113, 241),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    const Text('House information',
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.w900)),
                    const SizedBox(
                      height: 10.0,
                    ),
                    RichText(
                      text: const TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                              text:
                                  'Some of the familiar house types are kutcha houses, bungalows, farmhouses, apartments, and villas, among others. While the modern school of architecture has ..........'),
                          TextSpan(
                              text: 'Readmore',
                              style: TextStyle(
                                  color: Color.fromRGBO(154, 176, 252, 0.9)))
                        ],
                      ),
                    ),
                    // Text(
                    //     'Some of the familiar house types are kutcha houses, bungalows, farmhouses, apartments, and villas, among others. While the modern school of architecture has .'),
                    const SizedBox(
                      height: 20.0,
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.08,
                      child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: const MaterialStatePropertyAll(
                                  Color.fromRGBO(80, 118, 251, 0.6)),
                              shape: MaterialStatePropertyAll(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ))),
                          onPressed: () {},
                          child: const Text(
                            'Rent Now',
                            style: TextStyle(fontSize: 20.0),
                          )),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
