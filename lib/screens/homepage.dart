import 'package:flutter/material.dart';
import 'package:mukawwin_3/models/myappbar.dart';

import '../models/mybottombar.dart';
import '../List/listdata.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Myappbar(
            exit: Icons.exit_to_app,
            title: "Expiring Products",
          ),
          const SizedBox(
            height: 20.0,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: mydata.length, // عدد العناصر في القائمة
              itemBuilder: (context, index) {
                return mydata[index];
              },
            ),
          ),
          // Container(
          //   height: 80.0,
          //   color: Colors.amber,
          // )
          const Mybottombar(),
        ],
      ),
    );
  }
}
