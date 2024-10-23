import 'package:flutter/material.dart';

class Mybottombar extends StatefulWidget {
  const Mybottombar({super.key});

  @override
  State<Mybottombar> createState() => _MybottombarState();
}

class _MybottombarState extends State<Mybottombar> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Container(
              height: 40.0,
            ),
            Container(
              height: 100.0,
              decoration: const BoxDecoration(
                color: Color(0xFF4B7e80),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 15.0),
                    child: Column(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.list,
                            color: Colors.white,
                            size: 50.0,
                          ),
                        ),
                        const Text(
                          "Lists",
                          style: TextStyle(
                              fontFamily: 'Lato',
                              fontSize: 15.0,
                              color: Colors.white),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Column(
                      children: [
                        IconButton(
                          onPressed: () {
                            // Navigator.pushNamed(context, 'account');
                          },
                          icon: const Icon(
                            Icons.person,
                            color: Colors.white,
                            size: 50.0,
                          ),
                        ),
                        const Text(
                          "Account",
                          style: TextStyle(
                              fontFamily: 'Lato',
                              fontSize: 15.0,
                              color: Colors.white),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Positioned(
          top: 0,
          right: 0,
          left: 0,
          child: CircleAvatar(
            radius: 60.0,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              radius: 40.0,
              backgroundColor: const Color(0xFF4B7e80),
              child: IconButton(
                onPressed: () {
                  // Navigator.pushNamed(context, 'homepage');
                },
                icon: const Icon(
                  Icons.document_scanner_outlined,
                  size: 50.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
