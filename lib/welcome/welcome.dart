import 'package:flutter/material.dart';
import 'package:pixel_store/home/home.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(children: [
          Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fill, image: AssetImage('assets/bg/bg1.jpg'))),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * .55,
            left: 0,
            right: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Welcome to the \n Camera Store',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 27),
                ),
                const SizedBox(height: 20),
                Text(
                  ' Collect beautiful moments with unique \n camera and enjoy your moments! ',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: const Color.fromARGB(255, 27, 31, 29),
                      fontSize: 18,
                      backgroundColor: Colors.white.withOpacity(0.5),
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 40),
                MaterialButton(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  color: Colors.blue,
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const Home()));
                  },
                  child: const Text(
                    'START',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                )
              ],
            ),
          )
        ]),
      ),
    );
  }
}
