import 'package:flutter/material.dart';
import 'package:mytgd_app/pembayaran.dart';
import 'package:mytgd_app/profile.dart';
import 'akademik.dart';
import 'slider_data.dart';

class Beranda extends StatefulWidget {
  const Beranda({super.key});

  @override
  BerandaState createState() => BerandaState();
}

class BerandaState extends State<Beranda> {
  int _currentIndex = 0;
  String query = '';
  List<Map<String, String>> _filteredSliderData = sliderData;
  List<Map<String, String>> _filteredCampusData = campusInfoSliderData;

  void _filterData(String query) {
    final filteredSliderData = sliderData.where((item) {
      return item['description']!.toLowerCase().contains(query.toLowerCase());
    }).toList();

    final filteredCampusData = campusInfoSliderData.where((item) {
      return item['description']!.toLowerCase().contains(query.toLowerCase());
    }).toList();

    setState(() {
      _filteredSliderData = filteredSliderData;
      _filteredCampusData = filteredCampusData;
    });
  }

  Widget _buildSlider(String title, List<Map<String, String>> data) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Colors.black54,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                "Lihat Semua",
                style: TextStyle(
                  color: Color(0xFF2200FF),
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: data.length,
            itemBuilder: (context, index) {
              final item = data[index];
              return _buildSliderItem(item);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildSliderItem(Map<String, String> item) {
    return Container(
      width: 180,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            height: 120,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              image: DecorationImage(
                image: AssetImage(item['image']!),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              item['description']!,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  item['date']!,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 10,
                  ),
                ),
                Text(
                  item['views']!,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double topHeight = 50.0 + 16.0 + 16.0;
    double searchBarHeight = 56.0;
    double remainingHeight = screenHeight - topHeight - searchBarHeight - kBottomNavigationBarHeight;

    return Scaffold(
      backgroundColor: const Color(0xFF2200FF),
      body : Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Opacity(
              opacity: 0.3,
              child: Image.asset(
                'images/28468-removebg-preview.png',
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width,
                height: screenHeight / 3.5,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(top: 40.0, left: 16),
                      child: const Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage("images/foto.jpg"),
                            radius: 25,
                          ),
                          SizedBox(width: 16),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "M. Ikhsan Azmi",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "NIRM: 202302xxxx",
                                style: TextStyle(fontSize: 12, color: Colors.white),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 40.0, right: 16),
                      child: CircleAvatar(
                        backgroundColor: Colors.transparent,
                        radius: 35,
                        child: ClipOval(
                          child: Image.asset(
                            "images/logo_tgd-removebg-preview.png",
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 0,
                          blurRadius: 3,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: TextField(
                      onChanged: (value) {
                        setState(() {
                          query = value;
                          _filterData(query);
                        });
                      },
                      style: const TextStyle(height: 1),
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.search),
                        hintText: "Cari Informasi..",
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(16),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  width: double.infinity,
                  height: remainingHeight,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 16, left: 8, right: 8),
                      child: Column(
                        children: [
                          _buildSlider("Informasi Terkini", _filteredSliderData),
                          const SizedBox(height: 32),
                          _buildSlider("Informasi Kampus", _filteredCampusData),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
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
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const Beranda()),
              );
              break;
            case 1:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const Akademik()),
              );
              break;
            case 2:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const Pembayaran()),
              );
              break;
            case 3:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const Profil()),
              );
              break;
          }
        },
      ),
    );
  }
}