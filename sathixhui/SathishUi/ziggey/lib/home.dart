import 'package:carousel_slider/carousel_slider.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onboardscreen/datas.dart';
import 'package:onboardscreen/favourite.dart';
import 'package:onboardscreen/menu.dart';
import 'package:onboardscreen/order.dart';
import 'package:onboardscreen/producDetails.dart';
import 'package:onboardscreen/profilepage.dart';
import 'package:onboardscreen/utils.dart';

class CurveNavigationWidget extends StatefulWidget {
  const CurveNavigationWidget({super.key});

  @override
  State<CurveNavigationWidget> createState() => _CurveNavigationWidgetState();
}

class _CurveNavigationWidgetState extends State<CurveNavigationWidget> {
  int index = 0;
  final _bottomNavigationKey = GlobalKey<CurvedNavigationBarState>();

  @override
  Widget build(BuildContext context) {
    List<Widget> screens = [
      HomePage(),
      MenuPage(),
      OrderPage(),
      ProfilePage(),
    ];

    return Scaffold(
      appBar: buildAppBar(),
      backgroundColor: Colors.white,
      body: screens[index],
      bottomNavigationBar: CurvedNavigationBar(
        color: primaryColor,
        backgroundColor: Colors.transparent,
        height: 70,
        index: index,
        items: const [
          ImageIcon(
              size: 40, AssetImage("assets/gif/smart-house-unscreen.gif")),
          ImageIcon(size: 40, AssetImage("assets/gif/vegan-food-unscreen.gif")),
          ImageIcon(
              size: 40, AssetImage("assets/gif/shopping-cart-unscreen.gif")),
          ImageIcon(size: 40, AssetImage("assets/gif/profile-unscreen.gif")),
        ],
        key: _bottomNavigationKey,
        onTap: (index) => setState(() {
          this.index = index;
        }),
      ),
    );
  }

  buildAppBar() {
    if (index == 0 || index == 1 || index == 2) {
      return AppBar(
        backgroundColor: primaryColor,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FavoritesPage()),
              );
            },
            icon: Icon(Icons.favorite_border),
          )
        ],
      );
    } else {
      // Return an empty container if on the ProfilePage to hide the app bar
      return PreferredSize(
        preferredSize: Size.fromHeight(0.0),
        child: Container(),
      );
    }
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
      child: ListView(
        children: [
          SizedBox(
            height: 10.0,
          ),
          Text(
            "Good Morning Sathixh",
            style: TextStyle(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 3.0,
          ),
          Text(
            "Let's Eat Well and Stay Healthy!",
            style: TextStyle(
                color: primaryColor, fontSize: 16, fontWeight: FontWeight.w200),
          ),
          SizedBox(
            height: 15.0,
          ),
          SizedBox(
            height: 50,
            child: TextFormField(
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromARGB(255, 232, 231, 231)),
                    borderRadius: BorderRadius.all(
                      Radius.circular(30.0),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromARGB(255, 241, 208, 99)),
                    borderRadius: BorderRadius.all(
                      Radius.circular(30.0),
                    ),
                  ),
                  filled: true,
                  fillColor: Color.fromARGB(255, 232, 231, 231),
                  focusColor: Colors.amber,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50.0)),
                  hintText: "Search",
                  labelStyle:
                      TextStyle(color: const Color.fromARGB(255, 83, 82, 82))),
            ),
          ),
          SizedBox(
            height: 15.0,
          ),
          CarouselSlider(
            options: CarouselOptions(
                enlargeCenterPage: true,
                height: 130.0,
                autoPlay: true,
                enlargeFactor: 0.35),
            items: offers.map((offer) {
              return Builder(
                builder: (BuildContext context) {
                  return Card(
                    color: const Color.fromARGB(255, 249, 198, 47),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    elevation: 2,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50.0)),
                      ),
                      height: 130.0,
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(offer["text"]),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                offer["imagePath"],
                                width: 90,
                                height: 90,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }).toList(),
          ),
          SizedBox(
            height: 20.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text("Categorise"), Text("ViewAll")],
          ),
          SizedBox(
            height: 20.0,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                for (var category in Categorise)
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Color.fromARGB(255, 232, 231, 231),
                    ),
                    height: 80.0,
                    width: 80.0,
                    margin: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset(category["imagePath"],
                            height: 40.0, width: 40.0),
                        Text(
                          category["name"],
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 10),
            child: Text("Popular "),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
                childAspectRatio: 0.8,
              ),
              itemCount: popularItems.length,
              itemBuilder: (BuildContext context, int index) {
                var item = popularItems[index];

                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ProductDetailsPage(item: popularItems[index]),
                      ),
                    );
                  },
                  child: Card(
                    surfaceTintColor: Colors.white,
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 10.0,
                        ),
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(15.0)),
                            child: Image.asset(
                              item['image_url'],
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                item['name'],
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 4.0),
                              Text(
                                item['description'],
                                // maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.grey[600],
                                ),
                              ),
                              SizedBox(height: 4.0),
                              Text(
                                '\$${item['price'].toStringAsFixed(2)}',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
