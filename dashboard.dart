import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Dashboard_Page extends StatefulWidget {
  static const String routeName = '/dashboard';
  const Dashboard_Page({super.key});

  @override
  State<Dashboard_Page> createState() => _Dashboard_PageState();
}

class _Dashboard_PageState extends State<Dashboard_Page> {
  TextEditingController voucherController = TextEditingController();

  bool voucherAktif = false;
  bool isVisible = true;
  bool isvisible = true;
  //counter (untuk angka pemesanan)
  int counter1 = 0;
  int counter2 = 0;
  int counter3 = 0;
  int counter4 = 0;
  void incrementCounters() {
    setState(() {
      counter1++;
      counter2++;
      counter3++;
      counter4++;
    });
  }

  int get totalPesanana => counter1 + counter2 + counter3 + counter4;

  @override
  void dispose() {
    voucherController.dispose();
    super.dispose();
  }

  int total = 0;

  int harga1 = 20000;
  int harga2 = 25000;
  int harga3 = 5000;
  int harga4 = 2000;

  int diskon = 0;

  int potongan(diskon, total) {
    var c = diskon / 100;
    var d = total * c;
    var e = total - d;
    return e.toInt();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(85.0),
        child: AppBar(
          backgroundColor: Colors.brown[100],
          automaticallyImplyLeading: true,
          flexibleSpace: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
              image: DecorationImage(
                image: AssetImage('assets/AppBar.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/logodashboard.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(width: 15),
                    Flexible(
                      child: Text(
                        'Coffee Shop',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.brown[800],
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
