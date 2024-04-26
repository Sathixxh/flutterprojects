import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter/services.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final String labelText;
  final String hintText;
  final validator;
  final onChange;
  final bool readOnly;
  final onTap;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final EdgeInsets? contenModifytPadding;
  const CustomTextFormField(
      {super.key,
      required this.controller,
      required this.labelText,
      required this.hintText,
      this.validator,
      this.keyboardType = TextInputType.text,
      this.inputFormatters,
      this.readOnly = false,
      this.onChange,
      this.onTap,
      this.suffixIcon,
      this.prefixIcon,
      this.contenModifytPadding});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      onTap: onTap,
      readOnly: readOnly,
      style: const TextStyle(
          fontSize: 16.0, fontWeight: FontWeight.bold, color: Colors.black),
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(5.0),
          ),
        ),
        contentPadding: contenModifytPadding,
        labelText: labelText,
        hintText: hintText,
        prefixIcon: prefixIcon != null
            ? Icon(
                prefixIcon,
              )
            : null,
        suffixIcon: suffixIcon != null
            ? Icon(
                suffixIcon,
              )
            : null,
      ),
      validator: validator ?? (value) => validateNotNull(value, labelText),
      onChanged: onChange,
    );
  }
}

String? validateNotNull(String? value, String validateContent) {
  if (value == null || value.isEmpty) {
    return 'Please enter the $validateContent';
  }
  return null;
}

customListtile(context,
    {required IconData iconData, required String texttitle}) {
  return ListTile(
    // leading: iconData,
    // title: texttitle,
    leading: Icon(iconData),
    title: Text(texttitle),
  );
}

// style: TextStyle(color: const Color.fromRGBO(2,1,72,1),fontWeight: FontWeight.bold

CustomElevatedButton({
  required VoidCallback onPressed,
  required String text,
  Color backgroundColor = const Color.fromARGB(255, 110, 113, 201),
  Color textColor = Colors.black,
}) {
  return ElevatedButton(
    onPressed: onPressed,
    style: ElevatedButton.styleFrom(
      backgroundColor: backgroundColor,
      foregroundColor: textColor,
    ),
    child: Text(text),
  );
}

myCard(context,
    {required String img, required String bname, required String price}) {
  return SizedBox(
    height: 300.0,
    width: 220.0,
    child: Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(30.0))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            child: Image.network(
              img,
              height: MediaQuery.of(context).size.height * 0.24,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25.0),
                topRight: Radius.circular(25.0)),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.010,
          ),
          // Container(
          //   height: MediaQuery.of(context).size.height * 0.24,
          //   decoration: BoxDecoration(
          //     borderRadius: BorderRadius.only(
          //         topLeft: Radius.circular(25.0),
          //         topRight: Radius.circular(25.0)),
          //     image: DecorationImage(
          //       image: NetworkImage(img),
          //       fit: BoxFit.cover,
          //     ),
          //   ),
          // ),
          // SizedBox(
          //   height: MediaQuery.of(context).size.height * 0.7,
          // ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  bname,
                  style: TextStyle(
                      fontSize: 13.0,
                      color: Color.fromARGB(255, 97, 96, 96),
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  price,
                  style: TextStyle(
                      fontSize: 10.0,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 50, 81, 107)),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 5.0,
          ),
          // Padding(
          //   padding: const EdgeInsets.only(left: 8.0),
          //   child: RichText(
          //       text: TextSpan(children: [
          //     WidgetSpan(
          //       child: Icon(
          //         Icons.location_on,
          //         color: Color.fromARGB(255, 119, 118, 118),
          //         size: 12.0,
          //       ),
          //     ),
          //     WidgetSpan(
          //       child: SizedBox(
          //         width: 2.0,
          //       ),
          //     ),
          //     TextSpan(
          //       text: 'Chennai',
          //       style: TextStyle(
          //           color: Color.fromARGB(255, 119, 118, 118), fontSize: 12.0),
          //     )
          //   ])),
          // ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
            child: Row(
              children: [
                Icon(
                  Icons.location_on,
                  color: Color.fromARGB(255, 119, 118, 118),
                  size: 12.0,
                ),
                SizedBox(
                  width: 5.0,
                ),
                Text('Chennai')
              ],
            ),
          ),
          SizedBox(
            height: 5.0,
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
            child: Row(
              children: [
                Icon(
                  Icons.zoom_out_map_sharp,
                  color: Color.fromARGB(255, 119, 118, 118),
                  size: 12.0,
                ),
                SizedBox(
                  width: 5.0,
                ),
                Text("3200 sqft")
              ],
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.only(left: 10.0),
          //   child: RichText(
          //       text: TextSpan(children: [
          //     WidgetSpan(
          //       child: Icon(
          //         Icons.zoom_out_map_sharp,
          //         color: Color.fromARGB(255, 119, 118, 118),
          //         size: 12.0,
          //       ),
          //     ),
          //     WidgetSpan(
          //       child: SizedBox(
          //         width: 2.0,
          //       ),
          //     ),
          //     TextSpan(
          //       text: '3200 sqft',
          //       style: TextStyle(
          //           color: Color.fromARGB(255, 119, 118, 118), fontSize: 12.0),
          //     )
          //   ])),
          // ),
        ],
      ),
    ),
  );
}

myImage(context, {required images}) {
  return ClipRRect(
    child: Image.network(
      images,
      height: MediaQuery.of(context).size.height * 0.24,
      width: MediaQuery.of(context).size.width * 0.25,
      fit: BoxFit.cover,
    ),
    borderRadius: BorderRadius.circular(15.0),
  );
}

myIcons(context, {required IconData iconData}) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20.0),
      color: Color.fromRGBO(206, 208, 240, 0.5),
    ),
    height: 70.0,
    width: 70.0,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Icon(
          iconData,
          color: Color.fromRGBO(156, 177, 252, 1),
        ),
        Text(
          '3Bed',
          style: TextStyle(
            color: Color.fromRGBO(80, 106, 198, 1),
          ),
        ),
      ],
    ),
  );
}
