import 'package:flutter/material.dart';

class Mycard extends StatelessWidget {
  final String img;
  final String title;
  final String exdate;
  const Mycard(
      {super.key,
      required this.img,
      required this.title,
      required this.exdate});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 1),
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.0),
          boxShadow: [
            BoxShadow(
              color:
                  Colors.black.withOpacity(0.8), // لون الظل مع زيادة الشفافية
              spreadRadius: 1, // مدى انتشار الظل
              blurRadius: 0, // مدى ضبابية الظل
              offset: const Offset(-6, 8), // إزاحة الظل (x, y)
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                width: 75, // عرض الحاوية
                height: 75, // ارتفاع الحاوية
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.0), // حواف منحنية
                  image: DecorationImage(
                    image: AssetImage(img),
                    fit: BoxFit
                        .cover, // تحديد كيف يجب أن تناسب الصورة داخل الحاوية
                  ),
                ),
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: 5.0, right: 15.0, top: 5.0, bottom: 2.0),
                  child: Text(
                    title,
                    style: const TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Lato'),
                  ),
                ),
                const Row(
                  children: [
                    Icon(
                      Icons.circle,
                      color: Color.fromARGB(148, 76, 175, 79),
                      size: 15.0,
                    ),
                    Text(
                      'very good match',
                      style: TextStyle(
                          color: Color.fromARGB(148, 76, 175, 79),
                          fontFamily: 'Lato'),
                    )
                  ],
                )
              ],
            ),
            Column(
              children: [
                Row(
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.delete,
                          size: 40.0,
                          color: Color(0xFF4B7e80),
                        )),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.note_alt_outlined,
                          size: 40.0,
                          color: Color(0xFF4B7e80),
                        )),
                  ],
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.access_time,
                      color: Color(0xFF4B7e80),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 2),
                      child: Text(
                        exdate,
                        style: const TextStyle(
                            color: Color(0xFFD49FFC),
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Lato'),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
