import 'package:flutter/material.dart';
import 'package:goturkey/istanbul/materials/navigationIstanbul.dart';
import 'package:goturkey/istanbul/pages/hotel/hotel3yildiz.dart';
import 'package:goturkey/istanbul/pages/hotel/hotel4yildiz.dart';
import 'package:goturkey/istanbul/pages/hotel/hotel5yildiz.dart';
import 'package:goturkey/materials/appbar.dart';
import 'package:goturkey/materials/navigationbar.dart';

class hotelyildizsecim extends StatefulWidget {
  const hotelyildizsecim({Key? key}) : super(key: key);

  @override
  State<hotelyildizsecim> createState() => _hotelyildizsecimState();
}

class _hotelyildizsecimState extends State<hotelyildizsecim> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: appbarekle(context, "Hoteller"),
        backgroundColor: Color(0xffE7EEF5),
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
                  "Yıldız sayısını seçiniz",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 35,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 35, right: 35),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => hotel5yildizpage(),
                    ),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 99, 184, 230),
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blue.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 2,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      children: [
                        Text(
                          "5 Yıldızlı",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Icon(
                          Icons.star,
                          size: 30,
                          color: Colors.amber,
                        ),
                        Icon(
                          Icons.star,
                          size: 30,
                          color: Colors.amber,
                        ),
                        Icon(
                          Icons.star,
                          size: 30,
                          color: Colors.amber,
                        ),
                        Icon(
                          Icons.star,
                          size: 30,
                          color: Colors.amber,
                        ),
                        Icon(
                          Icons.star,
                          size: 30,
                          color: Colors.amber,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 35, right: 35),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => hotel4yildizpage(),
                    ),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 99, 184, 230),
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blue.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 2,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      children: [
                        Text(
                          "4 Yıldızlı",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Icon(
                          Icons.star,
                          size: 30,
                          color: Colors.amber,
                        ),
                        Icon(
                          Icons.star,
                          size: 30,
                          color: Colors.amber,
                        ),
                        Icon(
                          Icons.star,
                          size: 30,
                          color: Colors.amber,
                        ),
                        Icon(
                          Icons.star,
                          size: 30,
                          color: Colors.amber,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 35, right: 35),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => hotel3yildizpage(),
                    ),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 99, 184, 230),
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blue.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 2,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      children: [
                        Text(
                          "3 Yıldızlı",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Icon(
                          Icons.star,
                          size: 30,
                          color: Colors.amber,
                        ),
                        Icon(
                          Icons.star,
                          size: 30,
                          color: Colors.amber,
                        ),
                        Icon(
                          Icons.star,
                          size: 30,
                          color: Colors.amber,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: navigatoinIstanbul(),
      ),
    );
  }
}
