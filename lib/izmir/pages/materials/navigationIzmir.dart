import 'package:flutter/material.dart';
import 'package:goturkey/ankara/anasayfaAnkara.dart';
import 'package:goturkey/arasecimler/sehirsec.dart';
import 'package:goturkey/istanbul/anasayfaIstanbul.dart';
import 'package:goturkey/izmir/anasayfa%C4%B0zmir.dart';

class navigatoinIzmir extends StatefulWidget {
  const navigatoinIzmir({Key? key}) : super(key: key);

  @override
  State<navigatoinIzmir> createState() => _navigatoinIzmirState();
}

class _navigatoinIzmirState extends State<navigatoinIzmir> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Color(0xffE7EEF5),
      showSelectedLabels: false,
      showUnselectedLabels: false,
      onTap: (val) {
        if (val == 0) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => anasayfaizmirpage(),
            ),
          );
        }
        if (val == 1) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => sehirsecpage(),
            ),
          );
        }
        if (val == 2) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => anasayfapage(),
            ),
          );
        }
      },
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
            size: 35,
            color: Color(0xff4A9CC9),
          ),
          label: "",
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.location_city_outlined,
            size: 35,
            color: Color(0xff4A9CC9),
          ),
          label: "",
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.bookmarks,
            size: 35,
            color: Color(0xff4A9CC9),
          ),
          label: "",
        ),
      ],
    );
  }
}
