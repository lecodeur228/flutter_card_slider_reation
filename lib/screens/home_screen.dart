import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:lottie/lottie.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final CarouselController _controller = CarouselController();

  List<Map<String, String>> data = [
    {
      "image": "assets/bad.png",
      "text": "Bad",
      "lottie": "assets/lotties/bad.json"
    },
    {
      "image": "assets/good.png",
      "text": "Good",
      "lottie": "assets/lotties/good.json"
    },
    {
      "image": "assets/amazing.png",
      "text": "Amazing",
      "lottie": "assets/lotties/amazing.json"
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
          "Slider reaction",
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
                    InkWell(
                      onTap: () {
                        showLottieDialog(context, data[i]["lottie"]!);
                      },
                      child: Container(
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
            carouselController: _controller,
            options: CarouselOptions(
              height: 400.0,
              enlargeCenterPage: true,
            ),
            items: menuData.map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    // margin: const EdgeInsets.all(5),
                    padding: const EdgeInsets.all(15),
                    height: MediaQuery.sizeOf(context).height * 0.5,
                    width: MediaQuery.sizeOf(context).width * 0.8,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.white
                              .withOpacity(0.2), // Couleur de l'ombre
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: const Offset(0, 3), // Position de l'ombre
                        ),
                      ],
                      image: DecorationImage(
                          colorFilter: ColorFilter.mode(
                              Colors.black.withOpacity(0.5), BlendMode.overlay),
                          image: NetworkImage(i["image"]),
                          fit: BoxFit.cover),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              i["name"],
                              style: TextStyle(
                                  fontSize: Theme.of(context)
                                      .textTheme
                                      .headlineSmall!
                                      .fontSize,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "\$${i["price"]}",
                              style: TextStyle(
                                  fontSize: Theme.of(context)
                                      .textTheme
                                      .headlineSmall!
                                      .fontSize,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        const SizedBox(height: 5),
                        Text(
                          i["resto"],
                          style: TextStyle(
                              fontSize: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .fontSize,
                              color: Colors.white70),
                        ),
                        const SizedBox(height: 10),
                      ],
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

  void showLottieDialog(BuildContext context, String lottieFile) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        Future.delayed(const Duration(seconds: 3), () {
          _controller.nextPage(
            duration: const Duration(milliseconds: 200),
            curve: Curves.ease,
          );
          Navigator.of(context).pop();
        });

        return AlertDialog(
          backgroundColor: Colors.transparent,
          content: SizedBox(
            width: 300, //
            height: 300, //
            child: Lottie.asset(lottieFile),
          ),
        );
      },
    );
  }
}
