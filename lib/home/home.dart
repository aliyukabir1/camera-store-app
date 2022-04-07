import 'package:flutter/material.dart';
import 'package:pixel_store/home/component/antique_tab.dart';
import 'package:pixel_store/home/component/lense.dart';
import 'package:pixel_store/home/component/popular_tab.dart';
import 'package:pixel_store/home/component/tripod_tab.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  late TabController _tabController;
  int currentTab = 0;

  int routeIndex = 0;

  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _tabController.index = currentTab;

    return SafeArea(
        child: Scaffold(
            body: Stack(children: [
              Container(
                child: Container(
                  color: Colors.black.withOpacity(0.3),
                ),
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage('assets/bg/bg2.jpg'))),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Icon(
                          Icons.grid_view_rounded,
                          color: Colors.white,
                          size: 30,
                        ),
                        CircleAvatar(
                          radius: 33,
                          backgroundColor: Colors.white,
                          child: CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.red,
                            backgroundImage: AssetImage('assets/profile.jpg'),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Hello, Aliyu',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Welcome back!',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    const SizedBox(height: 30),
                    TextField(
                      decoration: InputDecoration(
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(
                                width: 0, style: BorderStyle.none),
                          ),
                          prefixIcon: const Icon(
                            Icons.search,
                            color: Colors.white,
                            size: 30,
                          ),
                          hintText: 'Search Product',
                          hintStyle: TextStyle(
                              color: Colors.white.withOpacity(0.8),
                              fontSize: 20),
                          fillColor: Colors.white.withOpacity(0.4),
                          suffixIcon: Container(
                            margin: const EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                                color: Colors.purple,
                                borderRadius: BorderRadius.circular(25)),
                            child: IconButton(
                                color: Colors.white,
                                onPressed: () {},
                                icon: const Icon(Icons.tune)),
                          )),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Categories',
                      style: TextStyle(color: Colors.white, fontSize: 23),
                    ),
                    const SizedBox(height: 10),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomTabBar(
                            title: 'Popular',
                            value: 0,
                            gvalue: currentTab,
                            onChanged: (value) =>
                                setState(() => currentTab = value),
                          ),
                          CustomTabBar(
                            title: 'Antique',
                            value: 1,
                            gvalue: currentTab,
                            onChanged: (value) =>
                                setState(() => currentTab = value),
                          ),
                          CustomTabBar(
                            title: 'Lenses',
                            value: 2,
                            gvalue: currentTab,
                            onChanged: (value) =>
                                setState(() => currentTab = value),
                          ),
                          CustomTabBar(
                            title: 'Tripods',
                            value: 3,
                            gvalue: currentTab,
                            onChanged: (value) =>
                                setState(() => currentTab = value),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Expanded(
                      child: TabBarView(
                          controller: _tabController,
                          children: const [
                            PopularTab(),
                            AntiqueTab(),
                            LensesTab(),
                            TripodTab()
                          ]),
                    ),
                  ],
                ),
              )
            ]),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: routeIndex,
              onTap: ((value) => setState(() {
                    routeIndex = value;
                  })),
              selectedItemColor: Colors.purple,
              backgroundColor: Colors.black.withOpacity(0.2),
              iconSize: 30,
              elevation: 0,
              items: const [
                BottomNavigationBarItem(label: 'Home', icon: Icon(Icons.home)),
                BottomNavigationBarItem(
                    icon: Icon(Icons.shopping_cart_checkout), label: 'Cart'),
              ],
            )));
  }
}

class CustomTabBar extends StatelessWidget {
  final int value, gvalue;
  final ValueChanged onChanged;
  final String title;

  const CustomTabBar(
      {Key? key,
      required this.value,
      required this.gvalue,
      required this.onChanged,
      required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isSelected = value == gvalue;
    return InkWell(
      onTap: () => onChanged(value),
      child: Container(
        margin: const EdgeInsets.only(right: 20),
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        child: Text(
          title,
          style: TextStyle(
              color: isSelected
                  ? Colors.white
                  : const Color.fromARGB(255, 64, 4, 75),
              fontSize: 17,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.w500),
        ),
        decoration: BoxDecoration(
          color: isSelected
              ? const Color.fromARGB(255, 167, 47, 38)
              : Colors.white.withOpacity(0.6),
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
