import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class FormRegister extends StatefulWidget {
  const FormRegister({super.key});

  @override
  FormRegisterState createState() => FormRegisterState();
}

class FormRegisterState extends State<FormRegister> {
  final Logger logger = Logger();
  bool _isPasswordVisible = false;

  final TextEditingController idController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  @override
  void dispose() {
    idController.dispose();
    passwordController.dispose();
    emailController.dispose();
    phoneController.dispose();
    super.dispose();
  }

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
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: screenHeight,
          ),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  height: screenHeight,
                  width: double.infinity,
                  color: const Color(0xFF2200FF),
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Opacity(
                          opacity: 0.3,
                          child: Container(
                            height: screenHeight / 2,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                    'images/28468-removebg-preview.png'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: paddingSize(isLandscape ? 10 : 50),
                        left: (screenWidth / 2) -
                            (screenWidth * (isLandscape ? 0.1 : 0.2)),
                        child: Container(
                          width: screenWidth * (isLandscape ? 0.2 : 0.4),
                          height: screenWidth * (isLandscape ? 0.2 : 0.4),
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                  'images/logo_tgd-removebg-preview.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: paddingSize(isLandscape ? 100 : 210),
                        left: 20,
                        right: 20,
                        child: Column(
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
                              'Daftar',
                              style: TextStyle(
                                fontSize: fontSize(18),
                                color: Colors.white,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: paddingSize(isLandscape ? 180 : 300),
                        left: 20,
                        right: 20,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextField(
                              controller: idController,
                              decoration: InputDecoration(
                                hintText: "Masukkan ID/NIRM...",
                                prefixIcon: const Icon(Icons.person,
                                    color: Colors.grey),
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
                              controller: passwordController,
                              obscureText: !_isPasswordVisible,
                              decoration: InputDecoration(
                                hintText: "Masukkan Password...",
                                prefixIcon: const Icon(Icons.lock,
                                    color: Colors.grey),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _isPasswordVisible
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: Colors.grey,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _isPasswordVisible =
                                          !_isPasswordVisible;
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
                            SizedBox(height: paddingSize(10)),
                            TextField(
                              controller: emailController,
                              decoration: InputDecoration(
                                hintText: "Masukkan Email...",
                                prefixIcon: const Icon(Icons.email,
                                    color: Colors.grey),
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
                              controller: phoneController,
                              decoration: InputDecoration(
                                hintText: "Masukkan No. Handphone...",
                                prefixIcon: const Icon(Icons.phone,
                                    color: Colors.grey),
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
                              child: ElevatedButton.icon(
                                onPressed: () {
                                  logger.i('ID: ${idController.text}');
                                  logger.i(
                                      'Password: ${passwordController.text}');
                                  logger.i(
                                      'Email: ${emailController.text}');
                                  logger.i('Phone: ${phoneController.text}');
                                },
                                icon: const Icon(Icons.person_add,
                                    color: Colors.white),
                                label: Text(
                                  'Daftar',
                                  style: TextStyle(
                                    fontSize: fontSize(20),
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Poppins',
                                    color: Colors.white,
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFFFF5500),
                                  padding: EdgeInsets.symmetric(
                                    vertical: paddingSize(10),
                                    horizontal: paddingSize(120),
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: paddingSize(15)),
                            Center(
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: RichText(
                                  text: TextSpan(
                                    text: 'Sudah punya akun? ',
                                    style: TextStyle(
                                      fontSize: fontSize(14),
                                      color: Colors.white,
                                      fontFamily: 'Poppins',
                                    ),
                                    children: [
                                      TextSpan(
                                        text: 'Login',
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
                            ),
                          ],
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
    );
  }
}