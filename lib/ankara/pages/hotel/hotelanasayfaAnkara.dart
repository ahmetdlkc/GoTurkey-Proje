import 'package:flutter/material.dart';

class hotelanasayfaAnkara extends StatefulWidget {
  final String adi,
      hakkinda,
      fotograf,
      adres,
      puan,
      olanak1,
      olanak2,
      olanak3,
      olanak4;
  final int tel, fiyat;
  const hotelanasayfaAnkara(
      this.adi,
      this.adres,
      this.fiyat,
      this.fotograf,
      this.hakkinda,
      this.puan,
      this.tel,
      this.olanak1,
      this.olanak2,
      this.olanak3,
      this.olanak4);

  @override
  State<hotelanasayfaAnkara> createState() => _hotelanasayfaAnkaraState();
}

IconData kaydedildiIcon = Icons.bookmark_add_outlined;

class _hotelanasayfaAnkaraState extends State<hotelanasayfaAnkara> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffE7EEF5),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Image.network(
                    widget.fotograf,
                    width: double.infinity,
                    fit: BoxFit.fitWidth,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(right: 25, left: 25, top: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0xffE7EEF5),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  right: 12, left: 18, top: 15, bottom: 15),
                              child: Icon(Icons.arrow_back_ios),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              kaydedildiIcon = Icons.bookmark;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0xffE7EEF5),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  right: 14, left: 14, top: 15, bottom: 15),
                              child: Icon(
                                kaydedildiIcon,
                                size: 25,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 170),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Color(0xffE7EEF5),
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(40),
                          topLeft: Radius.circular(40),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 30, left: 35),
                            child: Text(
                              widget.adi,
                              style: TextStyle(
                                color: Color(0xff2C1E40),
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                right: 35, left: 35, top: 7),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                  size: 16,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  widget.puan,
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Icon(
                                  Icons.bed,
                                  color: Color(0xff4A9CC9),
                                  size: 22,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "Hotel",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 35, top: 25),
                            child: Text(
                              "Hakkında",
                              style: TextStyle(
                                  color: Color(0xff2C1E40),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 35, right: 35, top: 10),
                            child: RichText(
                              text: TextSpan(
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: Colors.grey,
                                ),
                                children: <TextSpan>[
                                  TextSpan(text: widget.hakkinda),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 35, top: 20),
                            child: Text(
                              "Olanaklar",
                              style: TextStyle(
                                  color: Color(0xff2C1E40),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                right: 35, left: 35, top: 10),
                            child: Row(
                              children: [
                                Text(
                                  "-${widget.olanak1}",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  "-${widget.olanak2}",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  "-${widget.olanak3}",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                right: 35, left: 35, top: 7),
                            child: Row(
                              children: [
                                Text(
                                  "-${widget.olanak4}",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 35, top: 25),
                            child: Text(
                              "İletişim ve Adres",
                              style: TextStyle(
                                  color: Color(0xff2C1E40),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                right: 35, left: 35, top: 10),
                            child: Row(
                              children: [
                                Text(
                                  "Tel: ",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                ),
                                Text(
                                  "${widget.tel}",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                right: 35, left: 35, top: 10),
                            child: Row(
                              children: [
                                Text(
                                  "Adress: ",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              right: 35,
                              left: 35,
                              top: 5,
                            ),
                            child: RichText(
                              text: TextSpan(
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                                children: <TextSpan>[
                                  TextSpan(text: widget.adres),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 35, top: 25),
                            child: Text(
                              "Fiyat",
                              style: TextStyle(
                                  color: Color(0xff2C1E40),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 35, right: 35, top: 10, bottom: 20),
                            child: Row(
                              children: [
                                Text(
                                  "2 Kişilik Oda: ",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                ),
                                SizedBox(
                                  width: 7,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "${widget.fiyat}",
                                      style: TextStyle(
                                        color: Color(0xff2C1E40),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      " TL",
                                      style: TextStyle(
                                        color: Color(0xff2C1E40),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
