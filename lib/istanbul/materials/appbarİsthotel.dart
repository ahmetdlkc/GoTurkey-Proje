import 'package:flutter/material.dart';

AppBar appbaristhotelekle(BuildContext context, String sayfaadi) {
  return AppBar(
    backgroundColor: Color(0xffE7EEF5),
    elevation: 0,
    leading: InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 10, left: 25),
        child: Icon(
          Icons.arrow_back_ios,
          size: 25,
          color: Color(0xff2C1E40),
        ),
      ),
    ),
    title: Padding(
      padding: const EdgeInsets.only(
        top: 10,
      ),
      child: Center(
        child: Text(
          "$sayfaadi",
          style: TextStyle(
            color: Color(0xff2C1E40),
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
      ),
    ),
    actions: [
      Padding(
        padding: const EdgeInsets.only(top: 10),
        child: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.search,
            color: Colors.black,
            size: 25,
          ),
        ),
      ),
    ],
  );
}
