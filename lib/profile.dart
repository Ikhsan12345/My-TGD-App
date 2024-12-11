import 'package:flutter/material.dart';

class Profil extends StatefulWidget {
  const Profil({super.key});

  @override
  ProfilState createState() => ProfilState();
}

class ProfilState extends State<Profil> {
  int _currentIndex = 3;

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFF2200FF),
      body: OrientationBuilder(
        builder: (context, orientation) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: screenHeight,
              ),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Column(
                    children: [
                      SizedBox(height: screenHeight * 0.2),
                      Container(
                        width: double.infinity,
                        height: screenHeight * 0.8,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(20),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: ListView(
                            children: [
                              const SizedBox(height: 100),
                              _buildFeatureTile(
                                icon: Icons.person,
                                title: "Informasi Pribadi",
                                subtitle: "Detail akun dan informasi Anda",
                                onTap: () {},
                              ),
                              _buildFeatureTile(
                                icon: Icons.language,
                                title: "Preferensi Bahasa",
                                subtitle: "Atur bahasa aplikasi",
                                onTap: () {},
                              ),
                              _buildFeatureTile(
                                icon: Icons.history,
                                title: "Log Aktivitas",
                                subtitle: "Lihat riwayat aktivitas",
                                onTap: () {},
                              ),
                              _buildFeatureTile(
                                icon: Icons.help,
                                title: "FAQ / Bantuan",
                                subtitle: "Temukan jawaban atas pertanyaan Anda",
                                onTap: () {},
                              ),
                              _buildFeatureTile(
                                icon: Icons.logout,
                                title: "Keluar",
                                subtitle: "Keluar dari akun Anda",
                                onTap: () {},
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    top: screenHeight * 0.1,
                    left: screenWidth * 0.05,
                    right: screenWidth * 0.05,
                    child: Container(
                      decoration: BoxDecoration(
                        image: const DecorationImage(
                          image: AssetImage('images/Sprofil.jpg'),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      padding: const EdgeInsets.all(16),
                      child: const Column(
                        children: [
                          CircleAvatar(
                            radius: 50,
                            backgroundImage: AssetImage('images/foto.jpg'),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'M. Ikhsan Azmi',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            'NIRM: 202302xxxx',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 14,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: screenHeight * 0.05,
                    right: 16,
                    child: Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.notifications, color: Colors.white),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: const Icon(Icons.settings, color: Colors.white),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Beranda'),
          BottomNavigationBarItem(icon: Icon(Icons.school), label: 'Akademik'),
          BottomNavigationBarItem(icon: Icon(Icons.monetization_on), label: 'Pembayaran'),
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
            case 2:
              Navigator.popAndPushNamed(context, '/pembayaran');
              break;
          }
        },
      ),
    );
  }

  Widget _buildFeatureTile({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: Colors.blueAccent,
              size: 28,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      fontFamily: 'Poppins',
                      color: Colors.grey,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}