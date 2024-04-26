import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:onboardscreen/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  _FavoritesPageState createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  List<Map<String, dynamic>> favoriteItems = [];

  @override
  void initState() {
    super.initState();
    fetchFavorites();
  }

  void fetchFavorites() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? favoriteItemsString = prefs.getStringList('favoriteItems');
    if (favoriteItemsString != null) {
      setState(() {
        favoriteItems = favoriteItemsString
            .map((itemJson) => jsonDecode(itemJson))
            .toList()
            .cast<Map<String, dynamic>>();
      });
    }
  }

  void removeFromFavorites(int index) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    favoriteItems.removeAt(index);
    List<String> favoriteItemsString =
        favoriteItems.map((item) => jsonEncode(item)).toList();
    await prefs.setStringList('favoriteItems', favoriteItemsString);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text('Favorites'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: favoriteItems.isEmpty
            ? Center(
                child: Text(
                  'No favorite items yet!',
                  style: TextStyle(fontSize: 18.0),
                ),
              )
            : SizedBox(
                child: ListView.builder(
                  itemCount: favoriteItems.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 232, 231, 231),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                          ),
                          child: ListTile(
                            title: Text(favoriteItems[index]['name']),
                            subtitle:
                                Text('\$${favoriteItems[index]['price']}'),
                            trailing: IconButton(
                                onPressed: () {
                                  removeFromFavorites(index);
                                },
                                icon: Icon(Icons.delete_forever)),
                            leading: CircleAvatar(
                              backgroundImage:
                                  AssetImage(favoriteItems[index]['image_url']),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        )
                      ],
                    );
                  },
                ),
              ),
      ),
    );
  }
}
