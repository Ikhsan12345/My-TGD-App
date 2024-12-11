import 'package:flutter/material.dart';
import 'package:mytgd_app/form_login.dart';

class GetStarted extends StatelessWidget {
  final VoidCallback onGetStartedCompleted;

  const GetStarted({super.key, required this.onGetStartedCompleted});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    bool isLandscape = screenWidth > screenHeight;

    double fontSize(double size) {
      return screenWidth < 600 ? size * (screenWidth / 375) : size;
    }

    double paddingSize(double size) {
      return screenWidth < 600 ? size * (screenHeight / 812) : size;
    }

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              height: screenHeight / 2,
              color: Colors.white,
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              height: screenHeight / 2,
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/8262263.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: isLandscape ? (screenHeight * 3 / 4) : (screenHeight / 2),
              decoration: const BoxDecoration(
                color: Color(0xFF2200FF),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Opacity(
                      opacity: 0.3,
                      child: Container(
                        height: screenHeight / 2,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('images/28468-removebg-preview.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: paddingSize(70),
                        left: 20,
                        right: 20,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'My Triguna Dharma',
                            style: TextStyle(
                              fontSize: fontSize(24),
                              color: Colors.white,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: paddingSize(30)),
                          Text(
                            'Tingkatkan kemampuan di bidang teknologi informasi dan wujudkan masa depan yang lebih baik bersama STMIK Triguna Dharma',
                            style: TextStyle(
                              fontSize: fontSize(16),
                              color: Colors.white,
                              fontFamily: 'Poppins',
                              height: 1.5,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: paddingSize(40),
                    left: 20,
                    right: 20,
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          onGetStartedCompleted();
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const FormLogin(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFFF5500),
                          padding: EdgeInsets.symmetric(
                            vertical: paddingSize(15),
                            horizontal: paddingSize(100),
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                        child: Text(
                          'Get Started',
                          style: TextStyle(
                            fontSize: fontSize(20),
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Poppins',
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: (isLandscape ? (screenHeight * 3 / 4) : (screenHeight / 2)) -
                (isLandscape ? screenWidth * 0.1 : screenWidth * 0.2),
            left: (screenWidth / 2) - (isLandscape ? screenWidth * 0.1 : screenWidth * 0.2),
            child: Container(
              width: isLandscape ? screenWidth * 0.2 : screenWidth * 0.4,
              height: isLandscape ? screenWidth * 0.2 : screenWidth * 0.4,
              decoration: BoxDecoration(
                image: const DecorationImage(
                  image: AssetImage('images/logo_tgd-removebg-preview.png'),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(25),
              ),
            ),
          ),
        ],
      ),
    );
  }
}