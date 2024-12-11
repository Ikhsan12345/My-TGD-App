import 'package:flutter/material.dart';

class Pembayaran extends StatefulWidget {
  const Pembayaran({super.key});

  @override
  PembayaranState createState() => PembayaranState();
}

class PembayaranState extends State<Pembayaran> {
  int _currentIndex = 2;

  final List<Map<String, String>> paymentHistory = [
    {"date": "23-08-2024", "amount": "Rp. 500.000", "status": "Lunas"},
    {"date": "22-08-2024", "amount": "Rp. 500.000", "status": "Dibatalkan"},
    {"date": "20-08-2024", "amount": "Rp. 200.000", "status": "Gagal"},
    {"date": "28-07-2024", "amount": "Rp. 500.000", "status": "Lunas"},
    {"date": "26-06-2024", "amount": "Rp. 500.000", "status": "Lunas"},
    {"date": "24-05-2024", "amount": "Rp. 500.000", "status": "Lunas"},
    {"date": "27-04-2024", "amount": "Rp. 500.000", "status": "Lunas"},
    {"date": "30-03-2024", "amount": "Rp. 300.000", "status": "Gagal"},
    {"date": "25-02-2024", "amount": "Rp. 500.000", "status": "Lunas"},
    {"date": "26-01-2024", "amount": "Rp. 500.000", "status": "Lunas"},
    {"date": "22-12-2024", "amount": "Rp. 500.000", "status": "Lunas"},
    {"date": "21-11-2024", "amount": "Rp. 500.000", "status": "Lunas"},
    {"date": "28-10-2024", "amount": "Rp. 500.000", "status": "Lunas"},
    {"date": "29-09-2024", "amount": "Rp. 500.000", "status": "Lunas"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2200FF),
      body: Column(
        children: [
          const SizedBox(height: 50),
          const Text(
            'Pembayaran',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 150,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(20),
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(20),
                        ),
                        child: Image.asset(
                          'images/Pembayaran.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: _buildFeatureRow([
                              {"title": "Tagihan", "icon": Icons.receipt},
                              {"title": "Bayar Cepat", "icon": Icons.payments},
                            ]),
                          ),
                          const SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: _buildFeatureRow([
                              {"title": "Print Kwitansi", "icon": Icons.print},
                              {"title": "Bantuan", "icon": Icons.help},
                            ]),
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Riwayat Pembayaran",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            "❯",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      itemCount: paymentHistory.length,
                      itemBuilder: (context, index) {
                        final payment = paymentHistory[index];
                        final statusColor = payment["status"] == "Lunas"
                            ? Colors.green
                            : Colors.red;

                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 3,
                                child: Text(
                                  payment["date"]!,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontFeatures: [FontFeature.tabularFigures()],
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 3,
                                child: Text(
                                  payment["amount"]!,
                                  textAlign: TextAlign.left,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontFeatures: [FontFeature.tabularFigures()],
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Text(
                                  payment["status"]!,
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: statusColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Beranda'),
          BottomNavigationBarItem(icon: Icon(Icons.school), label: 'Akademik'),
          BottomNavigationBarItem(
              icon: Icon(Icons.monetization_on), label: 'Pembayaran'),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: 'Profil'),
        ],
        currentIndex: _currentIndex,
        selectedItemColor: const Color(0xFF0040FF),
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
          switch (index) {
            case 0:
              Navigator.popAndPushNamed(context, '/beranda');
              break;
            case 1:
              Navigator.popAndPushNamed(context, '/akademik');
              break;
            case 3:
              Navigator.popAndPushNamed(context, '/profil');
              break;
          }
        },
      ),
    );
  }

  List<Widget> _buildFeatureRow(List<Map<String, dynamic>> features) {
    return features
        .map((feature) => Expanded(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 8),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Icon(
                      feature["icon"] as IconData,
                      color: const Color.fromARGB(255, 255, 255, 255),
                      size: 28,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        feature["title"] as String,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ))
        .toList();
  }
}