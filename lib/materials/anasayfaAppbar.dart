import 'package:flutter/material.dart';
import 'package:goturkey/adminpaneli/adminlogin.dart';
import 'package:goturkey/arasecimler/sehirsec.dart';
import 'package:goturkey/istanbul/anasayfaIstanbul.dart';
import 'package:goturkey/main.dart';
import 'package:goturkey/services/auth.dart';
import 'package:provider/provider.dart';

enum MenuItem {
  adminpanel,
  cikisyap,
}
AppBar anasayfaAppbar(BuildContext context, String sehiradi) {
  return AppBar(
    backgroundColor: Color(0xffE7EEF5),
    elevation: 0,
    leading: Icon(
      Icons.arrow_back_ios,
      size: 1,
    ),
    title: Padding(
      padding: const EdgeInsets.only(
        top: 30,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.pin_drop,
            size: 20,
            color: Color(0xff4A9CC9),
          ),
          SizedBox(
            width: 7,
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => sehirsecpage(),
                ),
              );
            },
            child: Text(
              "$sehiradi",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xff2C1E40),
              ),
            ),
          ),
        ],
      ),
    ),
    actions: [
      Padding(
        padding: const EdgeInsets.only(top: 20, right: 25),
        child: PopupMenuButton<MenuItem>(
          onSelected: (value) async {
            if (value == MenuItem.cikisyap) {
              await Provider.of<Auth>(context, listen: false).cikisyap();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => girissayfasi(),
                ),
              );
            } else if (value == MenuItem.adminpanel) {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => adminLoginpage()));
            }
          },
          iconSize: 25,
          icon: Icon(
            Icons.more_vert,
            color: Colors.black,
          ),
          itemBuilder: (context) => [
            PopupMenuItem(
              value: MenuItem.cikisyap,
              child: Text("Çıkış Yap"),
            ),
            PopupMenuItem(
              value: MenuItem.adminpanel,
              child: Text("Admin Paneli"),
            )
          ],
        ),
      ),
    ],
  );
}
