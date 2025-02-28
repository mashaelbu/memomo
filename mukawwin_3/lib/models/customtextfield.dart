import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Custom_TextField extends StatefulWidget {
  final TextEditingController mycontroller;
  final String? Function(String?)? validator;
  late bool? obscure;

  final IconData icon;
  final String hinttext;
  Custom_TextField({
    super.key,
    required this.icon,
    required this.hinttext,
    required this.mycontroller,
    this.validator,
    this.obscure,
  });

  @override
  State<Custom_TextField> createState() => _Custom_TextFieldState();
}

class _Custom_TextFieldState extends State<Custom_TextField> {
  bool os = true;
  void obs() {
    setState(() {
      os = !os;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 85,
      child: Stack(
        children: [
          Positioned(
            top: 15,
            right: 20,
            child: Container(
              decoration: const BoxDecoration(boxShadow: [
                BoxShadow(
                    color: Colors.grey, blurRadius: 10, offset: Offset(0, 10))
              ]),
              // height: 40,
              width: 300,
              child: TextFormField(
                obscureText: widget.obscure == true ? os : false,
                controller: widget.mycontroller,
                validator: widget.validator,
                decoration: InputDecoration(
                  suffixIcon: widget.obscure == true
                      ? IconButton(
                          icon: os == false
                              ? const Icon(Icons.remove_red_eye)
                              : const Icon(Icons.visibility_off_outlined),
                          onPressed: () {
                            obs();
                          },
                        )
                      : null,
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.grey,
                    ),
                    borderRadius: BorderRadius.circular(40),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Color(0xff387f7f), width: 2),
                    borderRadius: BorderRadius.circular(40),
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 40),
                  disabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red)),
                  hintText: widget.hinttext,
                  hintStyle: const TextStyle(color: Colors.grey, fontSize: 20),
                  filled: true,
                  fillColor: Colors.grey[100],
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(40),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 30,
            child: Container(
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                  color: Colors.grey, borderRadius: BorderRadius.circular(70)),
              child: Icon(
                widget.icon,
                size: 50,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final String buttonname;
  final void Function()? onPressed;
  const CustomButton(
      {super.key, required this.onPressed, required this.buttonname});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40),
      ),
      color: const Color(0xff387f7f),
      onPressed: onPressed,
      child: Text(
        buttonname,
        style: const TextStyle(
            fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
      ),
    );
  }
}
