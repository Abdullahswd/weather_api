import 'package:api_weather_app/controller/home_controller.dart';
import 'package:api_weather_app/view/widget/day_weather.dart';
import 'package:api_weather_app/view/widget/home_Widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widget/air_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeController controller = Get.put(HomeController());

  @override
  void initState() {
    super.initState();
    controller.getHome();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white70,
      backgroundColor: Theme.of(context).backgroundColor,
      // appBar: AppBar(),
      body: Obx(() => controller.loadData.value
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView(
              children: [const HomeWidget(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 180,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: const Color(0xffd7c7c7ff),
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SizedBox(
                                      width: 30,
                                      height: 30,
                                      child: Image.asset("image/cloudy.png")),
                                ),
                                const Text(
                                  "Air Quality",
                                  style: TextStyle(fontSize: 20),
                                )
                              ],
                            ),
                            IconButton(
                                onPressed: () {
                                  // if(Get.isDarkMode){
                                  //   Get.changeTheme(ThemeData.light());
                                  // } else{
                                  //   Get.changeTheme(ThemeData.dark());
                                  // }
                                },
                                icon: const Icon(Icons.update))
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  AirElement(
                                    icon: Icons.sunny,
                                    name: 'Sunny',
                                    value: controller
                                        .myData!.current.temperature2M
                                        .toString(),
                                  ),
                                  const AirElement(
                                    icon: Icons.sunny_snowing,
                                    name: 'Snowing',
                                    value: '0.0',
                                  ),
                                  const AirElement(
                                    icon: Icons.severe_cold,
                                    name: 'Cold',
                                    value: '0.0',
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20.0),
                              Row(
                                children: [
                                  const AirElement(
                                    icon: Icons.hot_tub,
                                    name: 'Hot',
                                    value: '0.0',
                                  ),
                                  AirElement(
                                    icon: Icons.wind_power,
                                    name: 'Wind',
                                    value: controller
                                        .myData!.current.windSpeed10M
                                        .toString(),
                                  ),
                                  const AirElement(
                                    icon: Icons.dry,
                                    name: 'Dry',
                                    value: '0.0',
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: DayWeather(),
                )
              ],
            )),
    );
  }
}
