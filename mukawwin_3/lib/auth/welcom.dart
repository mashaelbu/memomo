import 'package:flutter/material.dart';
import 'package:mukawwin_3/Firebase/Auth.dart';

class Welcome extends StatelessWidget {
  Welcome({super.key});
  AuthService authService = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: const Color(0xff387f7f),
          ),
          Positioned(
            top: 100,
            left: 0,
            right: 0,
            child: Container(
                child: Image.asset(
              "images/3.png",
              height: 500,
            )),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Container(
                child: Image.asset(
              "images/8.jpg",
            )),
          ),
          const Positioned(
            bottom: 100,
            left: 10,
            child: Text(
              "Welcome!",
              style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
          const Positioned(
            bottom: 50,
            left: 10,
            child: Text(
              "Mukawwin aims to enhance the living ",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff387f7f)),
            ),
          ),
          const Positioned(
            bottom: 25,
            left: 10,
            child: Text(
              "with allergies!",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff387f7f)),
            ),
          ),
          Positioned(
              right: 10,
              bottom: 100,
              child: IconButton(
                  onPressed: () async {
                    await authService.checkWelcomNavigate(context);
                  },
                  icon: const Icon(
                    Icons.navigate_next_outlined,
                    color: Colors.white,
                    size: 50,
                  ))),
        ],
      ),
    );
  }
}
