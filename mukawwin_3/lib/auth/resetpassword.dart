import 'package:flutter/material.dart';
import 'package:mukawwin_3/Firebase/Auth.dart';
import 'package:mukawwin_3/models/customtextfield.dart';
import 'package:mukawwin_3/models/myappbar.dart';

class ResetPassWord extends StatefulWidget {
  const ResetPassWord({super.key});

  @override
  State<ResetPassWord> createState() => _ResetPassWordState();
}

class _ResetPassWordState extends State<ResetPassWord> {
  TextEditingController email = TextEditingController();
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  AuthService authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: formstate,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Myappbar(),
              const SizedBox(
                height: 15,
              ),
              const Text(
                "Reset Password",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff387f7f)),
              ),
              const SizedBox(
                height: 75,
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'Enter Your Email below and click (Submit) to send reset password link to your email ...!!',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff387f7f)),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Custom_TextField(
                  icon: Icons.email,
                  hinttext: "Enter Your Email",
                  mycontroller: email),
              CustomButton(
                  buttonname: "Submit",
                  onPressed: () async {
                    if (email.text != '') {
                      await authService.resetPassword(
                          email: email.text, context: context);
                      // Alert(
                      //   closeIcon: IconButton(
                      //       onPressed: () {
                      //         Navigator.pop(context);
                      //       },
                      //       icon: const Icon(
                      //         Icons.close,
                      //         color: Colors.grey,
                      //       )),
                      //   context: context,
                      //   type: AlertType.success,
                      //   title: "Checking ",
                      //   desc:
                      //       "Reset Password link has been sent to the Email : ${email.text} ",
                      //   style: AlertStyle(
                      //       titleStyle: TextStyle(
                      //         fontWeight: FontWeight.bold,
                      //         color: Colors.greenAccent[400],
                      //       ),
                      //       descStyle: TextStyle(color: Colors.grey[600])),
                      //   buttons: [
                      //     DialogButton(
                      //       color: Colors.greenAccent[400],
                      //       onPressed: () => Navigator.pop(context),
                      //       width: 120,
                      //       child: const Text(
                      //         "Ok",
                      //         style: TextStyle(
                      //             color: Colors.white,
                      //             fontSize: 20,
                      //             fontWeight: FontWeight.bold),
                      //       ),
                      //     )
                      //   ],
                      // ).show();
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          backgroundColor: Color(0xff387f7f),
                          duration: Duration(seconds: 2),
                          content: Row(
                            children: [
                              Text(
                                "The Fields Can't To Be Empty   ",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              Icon(
                                Icons.warning_amber_rounded,
                                color: Colors.orange,
                                size: 30,
                              ),
                            ],
                          ),
                        ),
                      );
                    }
                  }),
              const SizedBox(
                height: 10,
              ),
              CustomButton(
                  onPressed: () {
                    Navigator.of(context)
                        .pushNamedAndRemoveUntil("signin", (route) => false);
                  },
                  buttonname: "Login now")
            ],
          ),
        ),
      ),
    );
  }
}
