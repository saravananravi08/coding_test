import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    CarouselController controller = CarouselController();
    TabController tabController = TabController(length: 2, vsync: this);
    return Scaffold(
      body: ListView(
        children: [
          Container(
            color: Colors.green,
            height: 200,
            width: double.infinity,
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 80,
            child: TabBar(
              onTap: (i) {
                controller.animateToPage(i);
              },
              controller: tabController,
              tabs: const [
                Tab(
                  child: Text(
                    'Tab1',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                Tab(
                  child: InkWell(
                    child: Text(
                      'Tab2',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),
          ),
          CarouselSlider(
            carouselController: controller,
            options: CarouselOptions(
              //height: 400,
              aspectRatio: 9 / 16,
              viewportFraction: 1,
              initialPage: 0,
              enableInfiniteScroll: false,
              reverse: false,
              autoPlay: false,
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: false,
              onPageChanged: (i, r) {
                tabController.animateTo(i);
              },
              scrollDirection: Axis.horizontal,
            ),
            items: [
              ListView(
                shrinkWrap: false,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  Container(
                    width: double.infinity,
                    height: 1000,
                    color: Colors.yellow,
                    child: const Center(
                      child: Text(
                        'tab1',
                        style: TextStyle(fontSize: 16.0),
                      ),
                    ),
                  ),
                ],
              ),
              ListView(
                shrinkWrap: false,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  Container(
                    width: double.infinity,
                    height: 1000,
                    color: Colors.orange,
                    child: const Center(
                      child: Text(
                        'tab1',
                        style: TextStyle(fontSize: 16.0),
                      ),
                    ),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
