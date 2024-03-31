import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, String>> data = [
    {
      "image": "assets/bad.png",
      "text": "Bad",
    },
    {
      "image": "assets/good.png",
      "text": "Good",
    },
    {
      "image": "assets/amazing.png",
      "text": "amazing",
    },
  ];
  List<Map<String, dynamic>> menuData = [
    {
      "image":
          "https://i.pinimg.com/474x/43/7c/44/437c447768d443d33d9ee3743e87dd08.jpg",
      "name": "Burger",
      "resto": "McDonald's",
      "price": 120,
    },
    {
      "image":
          "https://i.pinimg.com/564x/fe/a7/dd/fea7ddb8e979bb8e78a0595213b3e0fc.jpg",
      "name": "Pizza",
      "resto": "McDonald's",
      "price": 80,
    },
    {
      "image":
          "https://i.pinimg.com/564x/fe/a7/dd/fea7ddb8e979bb8e78a0595213b3e0fc.jpg",
      "name": "Fromages",
      "resto": "McDonald's",
      "price": 50,
    },
    {
      "image":
          "https://i.pinimg.com/564x/4d/8a/f8/4d8af8a335f8044d7572484d2bff1fd1.jpg",
      "name": "Gateau",
      "resto": "McDonald's",
      "price": 50,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Review your order",
          style: TextStyle(
              color: Colors.black,
              fontSize: Theme.of(context).textTheme.headlineSmall!.fontSize,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.1,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 0; i < data.length; i++)
                Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 15),
                      height: 70,
                      width: 70,
                      padding: const EdgeInsets.all(15),
                      decoration: const BoxDecoration(
                          color: Color(0xffE3EEEC), shape: BoxShape.circle),
                      child: Image.asset(
                        data[i]["image"]!,
                        width: 30,
                        height: 30,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(data[i]["text"]!)
                  ],
                )
            ],
          ),
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.1,
          ),
          CarouselSlider(
            options: CarouselOptions(
              height: 400.0,
              enlargeCenterPage: true,
            ),
            items: menuData.map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    // margin: const EdgeInsets.all(5),
                    height: MediaQuery.sizeOf(context).height * 0.5,
                    width: MediaQuery.sizeOf(context).width * 0.8,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                          image: NetworkImage(i["image"]), fit: BoxFit.cover),
                    ),
                  );
                },
              );
            }).toList(),
          )
        ],
      ),
    );
  }
}
