import 'package:flutter/material.dart';
import 'package:goturkey/materials/appbar.dart';
import 'package:goturkey/materials/navigationbar.dart';

class semtsecpage extends StatefulWidget {
  const semtsecpage({Key? key}) : super(key: key);

  @override
  State<semtsecpage> createState() => _semtsecpageState();
}

class _semtsecpageState extends State<semtsecpage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffE7EEF5),
        appBar: appbarekle(context, "Tarihi Yerler"),
        body: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            Container(
              decoration: BoxDecoration(
                color: Color(0xffB7D1E6),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Text(
                  "Semt seçiniz",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Column(
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 30,
                    ),
                    semtekle("Beşiktaş"),
                    semtekle("Üsküdar"),
                    semtekle("Kadıköy"),
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 30,
                    ),
                    semtekle("Eminönü"),
                    semtekle("Karaköy"),
                    semtekle("Nişantaşı")
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 30,
                    ),
                    semtekle("Bebek"),
                    semtekle("Etiler"),
                  ],
                ),
              ],
            ),
            navigationbarekle(),
          ],
        ),
      ),
    );
  }
}

Padding semtekle(String semtad) {
  return Padding(
    padding: const EdgeInsets.only(
      right: 16,
    ),
    child: Container(
      width: 100,
      height: 50,
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 99, 184, 230),
          borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Center(
          child: Text(
            "$semtad",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ),
    ),
  );
}
