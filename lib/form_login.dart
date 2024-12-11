import 'package:flutter/material.dart';
import 'package:mytgd_app/beranda.dart';
import 'package:mytgd_app/form_register.dart';

class FormLogin extends StatefulWidget {
  const FormLogin({super.key});

  @override
  FormLoginState createState() => FormLoginState();
}

class FormLoginState extends State<FormLogin> {
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isPasswordVisible = false;

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
                        height: isLandscape
                            ? screenHeight * 3 / 4
                            : screenHeight / 2,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image:
                                AssetImage('images/28468-removebg-preview.png'),
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
                          SizedBox(height: paddingSize(10)),
                          Text(
                            'Login',
                            style: TextStyle(
                              fontSize: fontSize(18),
                              color: Colors.white,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: paddingSize(20)),
                          TextField(
                            controller: _idController,
                            decoration: InputDecoration(
                              hintText: "Masukkan ID...",
                              prefixIcon:
                                  const Icon(Icons.person, color: Colors.grey),
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                            ),
                            style: const TextStyle(height: 1),
                          ),
                          SizedBox(height: paddingSize(10)),
                          TextField(
                            controller: _passwordController,
                            obscureText: !_isPasswordVisible,
                            decoration: InputDecoration(
                              hintText: "Masukkan Password...",
                              prefixIcon:
                                  const Icon(Icons.lock, color: Colors.grey),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _isPasswordVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Colors.grey,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _isPasswordVisible = !_isPasswordVisible;
                                  });
                                },
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                            ),
                            style: const TextStyle(height: 1),
                          ),
                          SizedBox(height: paddingSize(20)),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                if (_idController.text.isEmpty ||
                                    _passwordController.text.isEmpty) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                          'Harap masukkan ID dan Password'),
                                    ),
                                  );
                                  return;
                                }
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Beranda()),
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
                                'Login',
                                style: TextStyle(
                                  fontSize: fontSize(20),
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Poppins',
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: paddingSize(20)),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const FormRegister(),
                                ),
                              );
                            },
                            child: RichText(
                              text: TextSpan(
                                text: 'Belum punya akun? ',
                                style: TextStyle(
                                  fontSize: fontSize(14),
                                  color: Colors.white,
                                  fontFamily: 'Poppins',
                                ),
                                children: [
                                  TextSpan(
                                    text: 'Daftar disini',
                                    style: TextStyle(
                                      fontSize: fontSize(14),
                                      color: const Color(0xFFFF5500),
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom:
                (isLandscape ? (screenHeight * 3 / 4) : (screenHeight / 2)) -
                    (isLandscape ? screenWidth * 0.1 : screenWidth * 0.2),
            left: (screenWidth / 2) -
                (isLandscape ? screenWidth * 0.1 : screenWidth * 0.2),
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
