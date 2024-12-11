import 'package:flutter/material.dart';

class Akademik extends StatefulWidget {
  const Akademik({super.key});

  @override
  AkademikState createState() => AkademikState();
}

class AkademikState extends State<Akademik> {
  int _currentIndex = 1;
  String query = '';
  bool showMore = false;

  final List<Map<String, dynamic>> features = [
    {"title": "Jadwal Kuliah", "icon": Icons.schedule},
    {"title": "KRS", "icon": Icons.book},
    {"title": "KHS", "icon": Icons.school},
    {"title": "DNS", "icon": Icons.receipt},
    {"title": "Kalender Akademik", "icon": Icons.calendar_today},
    {"title": "Informasi Kampus", "icon": Icons.info},
    {"title": "E-Library", "icon": Icons.library_books},
    {"title": "Kartu Ujian", "icon": Icons.credit_card},
    {"title": "Chat/Forum", "icon": Icons.forum},
    {"title": "TA/Skripsi", "icon": Icons.work},
    {"title": "SKPI", "icon": Icons.assignment},
    {"title": "Bimbingan", "icon": Icons.group},
    {"title": "Penelitian", "icon": Icons.science},
    {"title": "Organisasi", "icon": Icons.groups},
    {"title": "Kritik/Saran", "icon": Icons.feedback},
  ];

  List<Map<String, dynamic>> get filteredFeatures {
    if (query.isEmpty) {
      return features;
    }
    return features
        .where((feature) =>
            feature['title'].toLowerCase().contains(query.toLowerCase()))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2200FF),
      body: Column(
        children: [
          const SizedBox(height: 50),
          const Text(
            'Akademik',
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
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 15.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 0,
                              blurRadius: 3,
                              offset: const Offset(0, 5),
                            ),
                          ],
                        ),
                        child: TextField(
                          onChanged: (value) {
                            setState(() {
                              query = value;
                            });
                          },
                          style: const TextStyle(height: 1),
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.search),
                            hintText: "Cari Disini...",
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.all(16),
                          ),
                        ),
                      ),
                    ),
                    GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      padding: const EdgeInsets.all(16),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisSpacing: 16,
                        crossAxisSpacing: 16,
                      ),
                      itemCount: showMore
                          ? filteredFeatures.length
                          : filteredFeatures.length > 9
                              ? 9
                              : filteredFeatures.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                color: Colors.blueAccent,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 3,
                                    blurRadius: 5,
                                    offset: const Offset(3, 3),
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Icon(
                                filteredFeatures[index]['icon'],
                                color: Colors.white,
                                size: 30,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              filteredFeatures[index]['title'],
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          showMore = !showMore;
                        });
                      },
                      child: Text(
                        showMore ? "Sembunyikan ▲" : "Lihat Lainnya ▼",
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 10),
                      width: double.infinity,
                      height: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 5,
                            blurRadius: 5,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.asset(
                          'images/sloganTGD.jpg',
                          fit: BoxFit.fill,
                        ),
                      ),
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
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), label: 'Profil'),
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
            case 2:
              Navigator.popAndPushNamed(context, '/pembayaran');
              break;
            case 3:
              Navigator.popAndPushNamed(context, '/profil');
              break;
          }
        },
      ),
    );
  }
}