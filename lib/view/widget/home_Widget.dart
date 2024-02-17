import 'package:api_weather_app/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key,});


  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  HomeController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 230,
        child: Stack(
          children: [
            Positioned(
              bottom: 2,
              right: 1,
              left: 1,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 190,
                decoration: BoxDecoration(
                    gradient:  LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomCenter,
                        colors: [
                          Theme.of(context).secondaryHeaderColor,
                          Theme.of(context).primaryColor,

                        ]),
                    borderRadius: BorderRadius.circular(20)),
              ),
            ),
            Positioned(
              top: 1,
              left: 40,
              child: SizedBox(
                width: 120,
                height: 120,
                child: Image.asset("image/cloudy.png"),
              ),
            ),
            Positioned(
                top: 40,
                right: 10,
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(

                           controller.myData!.current.temperature2M
                              .toString(),
                          style: const TextStyle(
                              fontSize: 40,
                              color: Colors.white70,
                              fontWeight: FontWeight.bold),
                        ),
                        const Text(
                          " o",
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.white70,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Feels like 26",
                          style: TextStyle(fontSize: 20,color: Colors.grey),
                        ),
                        Text(" o", style: TextStyle(color: Colors.grey),),
                      ],
                    )
                  ],
                )),
            Positioned(
                bottom: 15,
                left: 20,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Rain showers",
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.white70,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      controller.myData!.hourly.time[0],
                      style: const TextStyle(fontSize: 20,color: Colors.grey),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
