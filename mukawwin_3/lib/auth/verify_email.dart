import 'package:flutter/material.dart';

import 'package:mukawwin_3/models/myappbar.dart';

class Email_Verify extends StatelessWidget {
  const Email_Verify({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Myappbar(),
          const SizedBox(
            height: 100,
          ),
          Container(
            padding: const EdgeInsets.all(15),
            child: const Text(
              "Please Check your email and click on the link to verify your acount ......Then Login Again",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff387f7f)),
            ),
          ),
          MaterialButton(
            onPressed: () {
              Navigator.of(context).pushReplacementNamed("signin");
            },
            color: Colors.greenAccent,
            child: const Text(
              "Ok",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
