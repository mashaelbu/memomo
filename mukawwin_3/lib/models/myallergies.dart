import 'package:flutter/material.dart';
import 'package:mukawwin_3/Firebase/database.dart';

import 'UserAllergyModel.dart';
// import 'package:flutter_svg/flutter_svg.dart';

class Myallergies extends StatefulWidget {
  final String icon;
  final String title;

  const Myallergies({super.key, required this.icon, required this.title});

  @override
  State<Myallergies> createState() => _MyallergiesState();
}

class _MyallergiesState extends State<Myallergies> {
  Color colors = Colors.white;
  DatabaseService databaseService = DatabaseService();
  UserAllergy? userAllergy;
  bool isloading = true;
  getdata() async {
    isloading = true;
    await databaseService.getAllergyFromName(widget.title).then((value) {
      if (value == null) {
        userAllergy = null;
      } else {
        userAllergy = value;
      }
    });
    if (userAllergy != null) {
      if (userAllergy!.allergie == widget.title) {
        colors = const Color(0xFFD5F4EC);
      } else {
        colors = Colors.white;
      }
    } else {
      colors = Colors.white;
    }
    setState(() {
      isloading = false;
    });
  }

  @override
  void initState() {
    getdata();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
          width: 40.0,
          height: 60.0,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.5), // لون الظل مع شفافية
                spreadRadius: 0, // مدى انتشار الظل
                blurRadius: 0, // مدى ضبابية الظل
                offset: const Offset(0, 5),
              ),
            ],
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: InkWell(
              borderRadius: BorderRadius.circular(20.0),
              onTap: () async {
                if (userAllergy == null) {
                  await databaseService
                      .addUserAllergy(widget.title)
                      .then((value) => getdata());
                } else {
                  await databaseService
                      .deleteUserAllergy(userAllergy!.id)
                      .then((onValue) => getdata());
                }
              },
              child: Card(
                color: colors,
                child: isloading
                    ? const CircularProgressIndicator()
                    : Column(
                        children: [
                          Image.asset(
                            widget.icon,
                          ),
                          Text(
                            widget.title,
                            style: const TextStyle(
                                fontSize: 20.0, fontFamily: 'lato'),
                          ),
                        ],
                      ),
              ),
            ),
          )),
    );
  }
}
