import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:pincodefind/widgets/cudform.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: F1(
      pageType: 'n',
    ),
  ));
}

class F1 extends StatefulWidget {
  final String pageType;
  const F1({Key? key, required this.pageType}) : super(key: key);
  @override
  State<F1> createState() => _F1State();
}

class _F1State extends State<F1> {
  final form1 = GlobalKey<FormState>();
  final TextEditingController pincodeController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController stateController = TextEditingController();
  final TextEditingController countryController = TextEditingController();

  Future<void> fetchData() async {
    String pincode = pincodeController.text;
    try {
      final response = await http
          .get(Uri.parse("https://api.postalpincode.in/pincode/$pincode"));
      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        if (data.isNotEmpty) {
          cityController.text = data[0]['PostOffice'][0]['District'];
          stateController.text = data[0]['PostOffice'][0]['State'];
          countryController.text = data[0]['PostOffice'][0]['Country'];
        } else {}
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Center(
          child: Form(
            key: form1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(25, 40, 25, 20),
                  child: Text(
                    "This app helps users find where a pincode is located. When users enter a pincode, it shows the district, state, and country related to that pincode. It uses an external tool (API) to get this information. It's useful because it saves time by automatically showing location details instead of users having to search for them manually.",
                    style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextFormFieldSathish(
                  prefixIcon: Icons.pin_drop_outlined,
                  onChange: (value) {
                    fetchData();
                  },
                  contentModifyPadding:
                      const EdgeInsets.symmetric(horizontal: 10.0),
                  controller: pincodeController,
                  labelText: 'Pincode',
                  hintText: 'Enter Pincode',
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(6),
                  ],
                  validator: (value) => validateNotNull(value, 'Pincode'),
                ),
                const SizedBox(height: 16),
                CustomTextFormFieldSathish(
                  readOnly: pincodeController.text.isNotEmpty ? false : true,
                  contentModifyPadding:
                      const EdgeInsets.symmetric(horizontal: 10.0),
                  controller: cityController,
                  prefixIcon: Icons.location_city,
                  labelText: 'City',
                  hintText: 'Enter City',
                  validator: (value) => validateNotNull(value, 'City'),
                ),
                const SizedBox(height: 16),
                CustomTextFormFieldSathish(
                  readOnly: pincodeController.text.isNotEmpty ? false : true,
                  contentModifyPadding:
                      const EdgeInsets.symmetric(horizontal: 10.0),
                  controller: stateController,
                  prefixIcon: Icons.location_city,
                  labelText: 'State',
                  hintText: 'Enter State',
                  validator: (value) => validateNotNull(value, 'State'),
                ),
                const SizedBox(height: 16),
                CustomTextFormFieldSathish(
                  readOnly: pincodeController.text.isNotEmpty ? false : true,
                  contentModifyPadding:
                      const EdgeInsets.symmetric(horizontal: 10.0),
                  controller: countryController,
                  prefixIcon: Icons.public,
                  labelText: 'Country',
                  hintText: 'Enter Country',
                  validator: (value) => validateNotNull(value, 'Country'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String? validateNotNull(String? value, String fieldName) {
    if (value == null || value.isEmpty) {
      return '$fieldName is required';
    }
    return null;
  }
}
