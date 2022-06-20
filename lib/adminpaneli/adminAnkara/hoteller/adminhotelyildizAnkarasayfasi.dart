import 'package:flutter/material.dart';
import 'package:goturkey/adminpaneli/admin%C4%B0stanbul/admin%C4%B0stanbulanasayfa.dart';
import 'package:goturkey/adminpaneli/admin%C4%B0stanbul/hoteller/admin4yildizhotelsayfa.dart';
import 'package:goturkey/adminpaneli/admin%C4%B0stanbul/hoteller/admin3yildizlihotelsayfa.dart';
import 'package:goturkey/adminpaneli/admin%C4%B0stanbul/hoteller/admin5yildizlihotelsafa.dart';
import 'package:goturkey/adminpaneli/adminAnkara/adminAnkaraanasayfa.dart';
import 'package:goturkey/adminpaneli/adminAnkara/hoteller/admin3yildizlihotelAnkarasayfa.dart';
import 'package:goturkey/adminpaneli/adminAnkara/hoteller/admin4yildizhotelAnkarasayfa.dart';
import 'package:goturkey/adminpaneli/adminAnkara/hoteller/admin5yildizlihotelsAnkaraafa.dart';
import 'package:goturkey/adminpaneli/adminanasayfa.dart';

class adminhotelAnkarayildizpage extends StatefulWidget {
  const adminhotelAnkarayildizpage({Key? key}) : super(key: key);

  @override
  State<adminhotelAnkarayildizpage> createState() =>
      _adminhotelAnkarayildizpageState();
}

class _adminhotelAnkarayildizpageState
    extends State<adminhotelAnkarayildizpage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffE7EEF5),
        body: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            Row(
              children: [
                Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => adminAnkaraanapage()));
                      },
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.black,
                        size: 25,
                      ),
                    )),
                SizedBox(
                  width: 65,
                ),
                Text(
                  "Hoteller",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
              ],
            ),
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
                      builder: (context) => admin5yildizlihotelAnkarapage(),
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
                      builder: (context) => admin4yildizhotelAnkarapage(),
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
                      builder: (context) => admin3yildizlihotelAnkarapage(),
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
      ),
    );
  }
}
