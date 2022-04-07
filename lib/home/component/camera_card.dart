import 'package:flutter/material.dart';
import 'package:pixel_store/detail/detail.dart';

class CameraCard extends StatelessWidget {
  final String url, name, price;
  const CameraCard({
    Key? key,
    required this.url,
    required this.name,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const Detail()));
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.white70.withOpacity(.8),
                  Colors.purple.withOpacity(0.1)
                ]),
            borderRadius: BorderRadius.circular(25)),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Container(
                  height: 70,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover, image: AssetImage(url))),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.5),
                    ),
                    Text(
                      '\$ $price',
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0.5),
                    )
                  ],
                ),
                const SizedBox(height: 5),
                const Text(
                  'Mini B',
                  style: TextStyle(
                      color: Colors.white70, fontSize: 16, letterSpacing: 0.5),
                )
              ],
            ),
            const Positioned(
                right: 0,
                child: Icon(
                  Icons.bookmark_border_outlined,
                  color: Colors.white,
                  size: 30,
                ))
          ],
        ),
      ),
    );
  }
}
