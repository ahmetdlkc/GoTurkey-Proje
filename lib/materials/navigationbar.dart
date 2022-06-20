import 'package:flutter/material.dart';
import 'package:goturkey/istanbul/anasayfaIstanbul.dart';
import 'package:goturkey/arasecimler/sehirsec.dart';

class navigationbarekle extends StatelessWidget {
  const navigationbarekle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Align(
        alignment: FractionalOffset.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.only(left: 50, right: 50, bottom: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => anasayfapage(),
                    ),
                  );
                },
                child: Icon(
                  Icons.home,
                  size: 35,
                  color: Color(0xff4A9CC9),
                ),
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
                child: Icon(
                  Icons.location_city_outlined,
                  size: 35,
                  color: Color(0xff4A9CC9),
                ),
              ),
              Icon(
                Icons.bookmarks,
                size: 35,
                color: Color(0xff4A9CC9),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
