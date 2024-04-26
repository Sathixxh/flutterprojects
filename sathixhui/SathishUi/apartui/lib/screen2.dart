import 'package:flutter/material.dart';
import 'package:houseui/screen3.dart';
import 'package:houseui/widgets/contwidgets.dart';

class Screen2 extends StatefulWidget {
  const Screen2({super.key});
  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView(children: [
          const SizedBox(
            height: 20.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    Icons.grid_view_outlined,
                    color: Colors.grey,
                  )),
              const Icon(
                Icons.edit_notifications,
                color: Colors.grey,
              ),
            ],
          ),
          const SizedBox(
            height: 15.0,
          ),
          const Text(
            'Hello Sri !',
            style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 88, 86, 86)),
          ),
          const SizedBox(height: 8.0),
          const Text(
            'Have a NiceDAy',
            style: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 73, 61, 155)),
          ),
          const SizedBox(
            height: 10.0,
          ),
          TextField(
            decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide(
                      color: Colors.grey.withOpacity(0.3),
                    )),
                hintText: 'search',
                hintStyle:
                    TextStyle(fontSize: 18.0, color: Colors.grey.shade500),
                border: InputBorder.none,
                prefixIcon: const Icon(Icons.search),
                suffixIcon: const Icon(Icons.format_list_bulleted_rounded)),
          ),
          const SizedBox(
            height: 10.0,
          ),
          const Text(
            'Recently Uploaded',
            style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16.0,
                color: Color.fromARGB(255, 90, 88, 88)),
          ),
          const SizedBox(height: 10.0),
          SizedBox(
              height: MediaQuery.of(context).size.height * 0.40,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Screen3(),
                          ));
                    },
                    child: Row(
                      children: [
                        myCard(context,
                            img:
                                "https://images.unsplash.com/photo-1602343168117-bb8ffe3e2e9f?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTJ8fGx1eHVyeSUyMGhvdXNlfGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=60",
                            bname: 'sathishflats',
                            price: '\$11000/month'),
                        myCard(context,
                            img:
                                "https://cdn.vox-cdn.com/thumbor/A-9F6MSZ4uQsgGZMY7xNmHyUjFQ=/0x0:5455x3610/620x413/filters:focal(2292x1369:3164x2241):format(webp)/cdn.vox-cdn.com/uploads/chorus_image/image/63921223/hK8mAb3U.0.jpeg",
                            bname: 'sriflats',
                            price: '\$10000/month'),
                      ],
                    ),
                  ),
                ],
              )),
          const SizedBox(
            height: 10.0,
          ),
          const Text(
            'Most Popular',
            style: TextStyle(
                color: Color.fromARGB(255, 126, 126, 126),
                fontSize: 16.0,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 20.0,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.14,
            width: double.infinity,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    myImage(context,
                        images:
                            'https://cdn.vox-cdn.com/thumbor/A-9F6MSZ4uQsgGZMY7xNmHyUjFQ=/0x0:5455x3610/620x413/filters:focal(2292x1369:3164x2241):format(webp)/cdn.vox-cdn.com/uploads/chorus_image/image/63921223/hK8mAb3U.0.jpeg'),
                    const SizedBox(
                      width: 20.0,
                    ),
                    myImage(context,
                        images:
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRkmXa9hbSFjYQ58RBaW3vvinjNw33grHcSkg&usqp=CAU'),
                    const SizedBox(
                      width: 20.0,
                    ),
                    myImage(context,
                        images:
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTo0dLAlXod0wsIMHT6fk4n1khD-4wNpPJsAULCtSgNXhxBMETgrNH5Sm57_RoIDo1rJlM&usqp=CAU'),
                    const SizedBox(
                      width: 20.0,
                    ),
                    myImage(context,
                        images:
                            'https://cdn.vox-cdn.com/thumbor/A-9F6MSZ4uQsgGZMY7xNmHyUjFQ=/0x0:5455x3610/620x413/filters:focal(2292x1369:3164x2241):format(webp)/cdn.vox-cdn.com/uploads/chorus_image/image/63921223/hK8mAb3U.0.jpeg'),
                    const SizedBox(
                      width: 20.0,
                    ),
                    myImage(context,
                        images:
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTo0dLAlXod0wsIMHT6fk4n1khD-4wNpPJsAULCtSgNXhxBMETgrNH5Sm57_RoIDo1rJlM&usqp=CAU'),
                  ],
                )
              ],
            ),
          ),
        ]),
      ),
    ));
  }
}
