import 'package:flutter/material.dart';
import 'package:goturkey/ankara/anasayfaAnkara.dart';
import 'package:goturkey/istanbul/anasayfaIstanbul.dart';
import 'package:goturkey/izmir/anasayfa%C4%B0zmir.dart';

class sehirsecpage extends StatelessWidget {
  const sehirsecpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Color(0xffE7EEF5),
      body: Column(
        children: [
          SizedBox(
            height: 65,
          ),
          Center(
            child: Text(
              "Şehir Seçiniz",
              style: TextStyle(
                color: Color(0xff2C1E40),
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
          ),
          SizedBox(
            height: 70,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 20, left: 25),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => anasayfapage(),
                      ),
                    );
                  },
                  child: Container(
                    width: 160,
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                        color: Color(0xff4A9CC9).withOpacity(0.2),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3),
                      ),
                    ]),
                    child: Stack(children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          "assets/images/istres.jpg",
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 45, bottom: 45, left: 45, right: 40),
                        child: Text(
                          "İstanbul",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ),
                    ]),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => anasayfaAnkarapage()));
                  },
                  child: Container(
                    width: 160,
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                        color: Color(0xff4A9CC9).withOpacity(0.2),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3),
                      ),
                    ]),
                    child: Stack(children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(
                          "https://firebasestorage.googleapis.com/v0/b/goturkey-199f0.appspot.com/o/ankara.jpg?alt=media&token=425f85c7-99e9-4068-abea-a661d8667b72",
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 45, bottom: 45, left: 45, right: 40),
                        child: Text(
                          "Ankara",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ),
                    ]),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 50,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 20, left: 25),
                child: InkWell(
                  child: Container(
                    width: 160,
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                        color: Color(0xff4A9CC9).withOpacity(0.2),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3),
                      ),
                    ]),
                    child: Stack(children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => anasayfaizmirpage()));
                          },
                          child: Image.network(
                            "https://firebasestorage.googleapis.com/v0/b/goturkey-199f0.appspot.com/o/izmir.jpg?alt=media&token=eb2aca8e-af36-493b-8b16-66ac83b90b83",
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 45, bottom: 45, left: 60, right: 40),
                        child: Text(
                          "İzmir",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ),
                    ]),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Container(
                  width: 160,
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                      color: Color(0xff4A9CC9).withOpacity(0.2),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    ),
                  ]),
                  child: Stack(children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: InkWell(
                        onTap: () {},
                        child: ColorFiltered(
                          colorFilter:
                              ColorFilter.mode(Colors.grey, BlendMode.color),
                          child: Image.asset(
                            "assets/images/istres.jpg",
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 45, bottom: 45, left: 45, right: 40),
                      child: Text(
                        "Yakında",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                    ),
                  ]),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 50,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 20, left: 25),
                child: Container(
                  width: 160,
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                      color: Color(0xff4A9CC9).withOpacity(0.2),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    ),
                  ]),
                  child: Stack(children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: InkWell(
                        onTap: () {},
                        child: ColorFiltered(
                          colorFilter:
                              ColorFilter.mode(Colors.grey, BlendMode.color),
                          child: Image.asset(
                            "assets/images/istres.jpg",
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 45, bottom: 45, left: 45, right: 40),
                      child: Text(
                        "Yakında",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                    ),
                  ]),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Container(
                  width: 160,
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                      color: Color(0xff4A9CC9).withOpacity(0.2),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    ),
                  ]),
                  child: Stack(children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: InkWell(
                        onTap: () {},
                        child: ColorFiltered(
                          colorFilter:
                              ColorFilter.mode(Colors.grey, BlendMode.color),
                          child: Image.asset(
                            "assets/images/istres.jpg",
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 45, bottom: 45, left: 45, right: 40),
                      child: Text(
                        "Yakında",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                    ),
                  ]),
                ),
              ),
            ],
          ),
        ],
      ),
    ));
  }
}
