import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DashboardPage extends StatefulWidget {
  static const String routeName = '/dashboard';
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  TextEditingController voucherController = TextEditingController();

  int counter1 = 0, counter2 = 0, counter3 = 0, counter4 = 0; // Counter produk
  int total = 0; // Total harga semua produk
  int harga1 = 20000, harga2 = 25000, harga3 = 5000, harga4 = 2000; // Harga produk
  double diskon = 0.0; // Nilai diskon dari voucher

  // Daftar voucher valid
  final Map<String, double> vouchers = {
    'wELcOMeCFsh1': 10.0, // 10% diskon
    'NgOpibarengTem4n': 20.0, // 20% diskon
    'ngUmPuL84reng': 50.0, // 50% diskon
    'HAPPYBRITHDAYcfsh' :75.0, // 75% diskon
  };

  @override
  void dispose() {
    voucherController.dispose();
    super.dispose();
  }

  // Fungsi untuk menghitung total setelah diskon
  int potonganHarga() {
    double potongan = total * (diskon / 100);
    return total - potongan.toInt();
  }

  // Fungsi untuk memvalidasi dan menggunakan voucher
  void applyVoucher() {
    String inputVoucher = voucherController.text.trim();
    if (vouchers.containsKey(inputVoucher)) {
      setState(() {
        diskon = vouchers[inputVoucher]!; // Set diskon berdasarkan voucher
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Voucher berhasil diterapkan! Diskon: ${diskon.toInt()}%'),
          backgroundColor: Colors.green,
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Kode voucher tidak valid!'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  // Fungsi untuk tombol Pesan Sekarang
  void _onPesanSekarang() {
    if (total == 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Anda belum menambahkan pesanan!'),
          backgroundColor: Colors.red,
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Pesanan berhasil dilakukan! Total: Rp ${potonganHarga()}'),
          backgroundColor: Colors.green,
        ),
      );
      setState(() {
        // Reset pesanan
        total = 0;
        counter1 = 0;
        counter2 = 0;
        counter3 = 0;
        counter4 = 0;
        diskon = 0.0;
        voucherController.clear();
      });
    }
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
            child: Row(
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
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                // Produk 1
                _buildProductItem(
                  title: "Cappuccino",
                  image: 'assets/Menu1.png',
                  price: harga1,
                  counter: counter1,
                  onAdd: () {
                    setState(() {
                      counter1++;
                      total += harga1;
                    });
                  },
                  onRemove: () {
                    if (counter1 > 0) {
                      setState(() {
                        counter1--;
                        total -= harga1;
                      });
                    }
                  },
                ),
                // Produk 2
                _buildProductItem(
                  title: "Boba",
                  image: 'assets/Menu2.png',
                  price: harga2,
                  counter: counter2,
                  onAdd: () {
                    setState(() {
                      counter2++;
                      total += harga2;
                    });
                  },
                  onRemove: () {
                    if (counter2 > 0) {
                      setState(() {
                        counter2--;
                        total -= harga2;
                      });
                    }
                  },
                ),
                // Produk 3
                _buildProductItem(
                  title: "Kopi Hitam",
                  image: 'assets/Menu3.png',
                  price: harga3,
                  counter: counter3,
                  onAdd: () {
                    setState(() {
                      counter3++;
                      total += harga3;
                    });
                  },
                  onRemove: () {
                    if (counter3 > 0) {
                      setState(() {
                        counter3--;
                        total -= harga3;
                      });
                    }
                  },
                ),
                // Produk 4
                _buildProductItem(
                  title: "Es Coklat",
                  image: 'assets/Menu4.png',
                  price: harga4,
                  counter: counter4,
                  onAdd: () {
                    setState(() {
                      counter4++;
                      total += harga4;
                    });
                  },
                  onRemove: () {
                    if (counter4 > 0) {
                      setState(() {
                        counter4--;
                        total -= harga4;
                      });
                    }
                  },
                ),
              ],
            ),
          ),

          // Container Total Pesanan
          Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              boxShadow: [
                BoxShadow(
                  color: Color(0x499C9C9C),
                  blurRadius: 2,
                  offset: Offset(0, 0),
                  spreadRadius: 1,
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Text(
                        'Total Pesanan',
                        style: GoogleFonts.poppins(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.brown,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        'Rp ${potonganHarga()}',
                        style: GoogleFonts.poppins(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.brown,
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(color: Colors.brown),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      const Icon(Icons.confirmation_num_sharp, size: 30, color: Colors.brown),
                      const SizedBox(width: 5),
                      Expanded(
                        child: TextField(
                          controller: voucherController,
                          decoration: const InputDecoration(
                            hintText: "Masukkan kode voucher",
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      ElevatedButton(
                        onPressed: applyVoucher,
                        child: const Text("Gunakan"),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: _onPesanSekarang,
                  child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.brown,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      "Pesan Sekarang",
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Widget untuk menampilkan produk
  Widget _buildProductItem({
    required String title,
    required String image,
    required int price,
    required int counter,
    required VoidCallback onAdd,
    required VoidCallback onRemove,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 2,
            offset: Offset(0, 0),
            spreadRadius: 1,
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.poppins(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFFA4A4A4),
                  ),
                ),
                Text(
                  'Rp $price',
                  style: GoogleFonts.poppins(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: Colors.brown,
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.remove),
                onPressed: onRemove,
              ),
              Text(
                '$counter',
                style: const TextStyle(fontSize: 16),
              ),
              IconButton(
                icon: const Icon(Icons.add),
                onPressed: onAdd,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
