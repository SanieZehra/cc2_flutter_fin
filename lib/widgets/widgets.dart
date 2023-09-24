import 'package:flutter/material.dart';

Widget customTextField({
  required TextEditingController controller,
  required String label,
  required FocusNode focus,
  required TextInputAction inputAction,
  required TextInputType textInputType,
  bool obsecureText = false,
  String? Function(String? val)? onValidate,
  Widget? suffixIcon,
}) {
  return TextFormField(
    controller: controller,
    focusNode: focus,
    validator: onValidate,
    textInputAction: inputAction,
    keyboardType: textInputType,
    obscureText: obsecureText,
    decoration: InputDecoration(
      border:OutlineInputBorder(
        borderRadius:
        BorderRadius.circular(16),
        borderSide: const BorderSide(color:Colors.black, width: 1.5),
      ),
      label: Text(label),
      suffixIcon: suffixIcon,
    ),
  );
}

Widget customButton({required String title, required Function() onTap}){
  return GestureDetector(
    onTap: onTap,
    child: Container(
      height: 50,
      padding: const EdgeInsets.symmetric(vertical: 10.0,),
      decoration: BoxDecoration(
        color: Color(0xffC68017),
        borderRadius: BorderRadius.circular(100.0),
      ),
      child: Center(
        child: Text(
          title,
          style: const TextStyle(
              color: Colors.white,
              fontSize: 20.0,
              fontWeight: FontWeight.bold
          ),
        ),
      ),
    ),
  );
}

Widget categoryButton({
  required String title,
  required Function() onPressed,
  required String imageAsset, // New parameter for image asset
  Color? backgroundColor, // New parameter for background color (optional)
}) {
  return Container(
    height: 55,
    width: 180,
    child: ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.all(2),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            bottomLeft: Radius.circular(25),
            topRight: Radius.circular(25),
            bottomRight: Radius.circular(25),
          ),
        ),
        backgroundColor: backgroundColor ?? Colors.grey.shade100,
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 0),
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              height: 54,
              width: 55,
              child: Image.asset(
                imageAsset, // Use the specified image asset
                width: 25,
                height: 25,
              ),
            ),
          ),
          SizedBox(width: 10),
          Text(
            title,
            style: TextStyle(
              color: Colors.black87,
              fontSize: 14,
              fontWeight: FontWeight.bold,
              fontFamily: 'MyCustomFont',
            ),
          ),
        ],
      ),
    ),
  );
}
