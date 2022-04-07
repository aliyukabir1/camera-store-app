import 'package:flutter/material.dart';
import 'package:pixel_store/home/component/camera_card.dart';

class TripodTab extends StatelessWidget {
  const TripodTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 20,
      crossAxisSpacing: 20,
      children: const [
        CameraCard(
          name: 'Instax',
          price: '1000',
          url: 'assets/camera/1.png',
        ),
        CameraCard(
          name: 'Instax',
          price: '2000',
          url: 'assets/camera/2.png',
        ),
        CameraCard(
          name: 'Instax',
          price: '1500',
          url: 'assets/camera/3.jpg',
        ),
        CameraCard(
          name: 'Instax',
          price: '1000',
          url: 'assets/camera/4.jpg',
        ),
      ],
    );
  }
}
