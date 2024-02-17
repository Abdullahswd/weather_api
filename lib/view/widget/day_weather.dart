import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/home_controller.dart';

class DayWeather extends StatefulWidget {
  const DayWeather({super.key,});


  @override
  State<DayWeather> createState() => _DayWeatherState();
}

class _DayWeatherState extends State<DayWeather> {
  HomeController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: 250,
      child: ListView.builder(
          itemCount: 5,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context , index){
            return item();
          }),

    );
  }
  Widget item(){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: 54,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            const Text("Sat"),
            const Spacer(),
            const Text("14 Feb"),
            const Spacer(),
            SizedBox(
                height: 30,
                width: 30,
                child: Image.asset("image/cloudy.png")),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(controller.myData!.current.temperature2M.toString()
                  , style: const TextStyle(fontSize: 20),),
                const Text("o"),
              ],
            ),
            const Spacer(),
            Container(
              width:30 ,
              height: 30,
              decoration: BoxDecoration(
                color: Colors.deepPurple,
                borderRadius: BorderRadius.circular(10)
              ),
              child:  Center(child: Text(
               "${ controller.myData!.current.windSpeed10M.toString()} %"


                ,style: const TextStyle(fontSize: 10 , color: Colors.white),)),
            ),
            const Spacer(),

          ],
        ),
      ),
    );
  }
}
