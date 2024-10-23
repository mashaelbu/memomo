import 'package:flutter/material.dart';
import 'package:mukawwin_3/Firebase/Auth.dart';
import 'package:mukawwin_3/models/UserModel.dart';
import 'package:mukawwin_3/models/myappbar.dart';
import 'package:mukawwin_3/models/mybottombar.dart';

class Account extends StatefulWidget {
  const Account({
    super.key,
  });

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  UserModel? userModel;
  bool isloading = true;
  AuthService authService = AuthService();
  getData() async {
    isloading = true;
    await authService.getUserData().then((value) => userModel = value);
    setState(() {
      isloading = false;
    });
  }

  @override
  void initState() {
    getData();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Myappbar(
            exit: Icons.exit_to_app,
            title: "Welcome ${isloading ? "" : userModel!.username}",
          ),
          Center(
            child: isloading
                ? const CircularProgressIndicator()
                : Padding(
                    padding: const EdgeInsets.only(
                        top: 25.0, bottom: 25.0, left: 15.0, right: 15.0),
                    child: Container(
                      padding: const EdgeInsets.all(25.0),
                      width: double.infinity,
                      height: 300.0,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black
                                .withOpacity(0.5), // لون الظل مع شفافية
                            spreadRadius: -7, // مدى انتشار الظل
                            blurRadius: 10, // مدى ضبابية الظل
                            offset: const Offset(-5, 5),
                          ),
                          BoxShadow(
                            color: Colors.black
                                .withOpacity(0.5), // لون الظل مع شفافية
                            spreadRadius: -7, // مدى انتشار الظل
                            blurRadius: 10, // مدى ضبابية الظل
                            offset: const Offset(5, 5),
                          ),
                          const BoxShadow(
                            color: Colors.white, // لون الظل مع شفافية
                            spreadRadius: -7, // مدى انتشار الظل
                            blurRadius: 10, // مدى ضبابية الظل
                            offset: Offset(0, -10),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(2.0),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'Name',
                                    style: TextStyle(
                                        fontFamily: 'lato',
                                        fontSize: 22.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    userModel!.username,
                                    style: const TextStyle(
                                        fontFamily: 'lato',
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey,
                                        fontSize: 18.0),
                                  ),
                                  IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.note_alt_outlined,
                                        color: Color(0xFFD49FFC),
                                      ))
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'Email',
                                    style: TextStyle(
                                        fontFamily: 'lato',
                                        fontSize: 22.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Expanded(
                                    child: Text(
                                      userModel!.email,
                                      style: const TextStyle(
                                          fontFamily: 'lato',
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey,
                                          fontSize: 18.0),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.note_alt_outlined,
                                        color: Color(0xFFD49FFC),
                                      ))
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'Password',
                                    style: TextStyle(
                                        fontFamily: 'lato',
                                        fontSize: 22.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const Text(
                                    "*********",
                                    style: TextStyle(
                                        fontFamily: 'lato',
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey,
                                        fontSize: 18.0),
                                  ),
                                  IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.note_alt_outlined,
                                        color: Color(0xFFD49FFC),
                                      ))
                                ],
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(25.0),
                                child: InkWell(
                                  child: Container(
                                    decoration: const BoxDecoration(
                                        color: Color(0xFFD49FFC)),
                                    child: const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Manage Allergies',
                                          style: TextStyle(
                                              fontFamily: 'lato',
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                              fontSize: 25.0),
                                        ),
                                        Icon(
                                          Icons.navigate_next_outlined,
                                          size: 50.0,
                                          color: Colors.white,
                                        )
                                      ],
                                    ),
                                  ),
                                  onTap: () {
                                    Navigator.pushNamed(context, 'allergies');
                                  },
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
          ),
          const Mybottombar(),
        ],
      ),
    );
  }
}
