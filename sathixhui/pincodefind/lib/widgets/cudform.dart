import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFormFieldSathish extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final String labelText;
  final String hintText;
  final validator;
  final onChange;
  final bool readOnly;
  final onTap;
  final prefixIcon;
  final IconData? suffixIcon;
  final EdgeInsets? contenModifytPadding;
  CustomTextFormFieldSathish(
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
      this.contenModifytPadding,
      required EdgeInsets contentModifyPadding});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      onTap: onTap,
      readOnly: readOnly,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: const Color.fromARGB(255, 215, 213, 213)),
          borderRadius: BorderRadius.all(
            Radius.circular(30.0),
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(30.0),
          ),
        ),
        filled: true,
        fillColor: Colors.white,
        contentPadding: contenModifytPadding,
        labelText: labelText,
        // labelStyle: TextStyle(color: Color.fromRGBO(145, 150, 245, .6)),
        hintText: hintText,
        prefixIcon: prefixIcon is IconButton
            ? prefixIcon
            : prefixIcon != null
                ? Icon(
                    prefixIcon,
                    // color: Color.fromRGBO(145, 150, 245, 1),
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

String? validateName(String? value) {
  if (value!.isEmpty) {
    return 'Please enter your name.';
  } else if (!RegExp(r'^[a-zA-Z ]+$').hasMatch(value)) {
    return 'Name can only contain alphabets.';
  }
  return null;
}

String? validatePhoneNumber(String? value) {
  if (value != null && value.isNotEmpty) {
    if (!RegExp(r'^[0-9]{10}$').hasMatch(value)) {
      return 'Please enter a valid phone number';
    }
  }
  return null;
}

String? validateEmail(String value) {
  if (value.isEmpty) {
    return 'Please enter an email address.';
  } else if (!RegExp(r'^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$')
      .hasMatch(value)) {
    return 'Please enter a valid email address.';
  }
  return null;
}

String? validateProofNumber(String? value, String selectedIdentityProof) {
  if (value == null || value.isEmpty) {
    return 'Proof Number is required';
  }

  RegExp regex;

  switch (selectedIdentityProof) {
    case 'aadhar':
      regex = RegExp(r'^\d{12}$');
      break;
    case 'passport':
      regex = RegExp(r'^[a-zA-Z0-9]{6,}$');
      break;
    case 'pancard':
      regex = RegExp(r'^[a-zA-Z0-9]{8,10}$');
      break;
    case 'voterid':
      regex = RegExp(r'^[a-zA-Z0-9]{10}$');
      break;
    default:
      return 'Invalid proof type';
  }

  if (!regex.hasMatch(value)) {
    return 'Invalid $selectedIdentityProof number';
  }

  return null;
}

String? validatePercentage(String value, String s) {
  try {
    int percentage = int.parse(value);
    if (percentage < 0 || percentage > 100) {
      return 'Enter a percentage between 0 and 100';
    }
  } catch (e) {
    return 'Enter a valid number';
  }
  return null;
}

scafWidgets(context, {required String smsg, required Color coolors}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(smsg),
      backgroundColor: coolors,
      elevation: 20,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      behavior: SnackBarBehavior.fixed,
      duration: Duration(seconds: 2),
    ),
  );
}

customListtile(context,
    {required IconData iconData, required String texttitle}) {
  return ListTile(
    leading: Icon(iconData),
    title: Text(texttitle),
  );
}

CustomElevatedButton({
  required VoidCallback onPressed,
  required String text,
  Color backgroundColor = Colors.white,
  Color textColor = const Color.fromARGB(255, 255, 255, 255),
}) {
  return ElevatedButton(
    onPressed: onPressed,
    style: ButtonStyle(
      backgroundColor: MaterialStatePropertyAll(
        Color.fromRGBO(38, 57, 166, 1),
      ),
      foregroundColor: MaterialStatePropertyAll(Colors.white),
      shape: MaterialStateProperty.all<OutlinedBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
    ),
    child: Text(
      text,
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
    ),
  );
}
