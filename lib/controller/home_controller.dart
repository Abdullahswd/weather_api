import 'package:api_weather_app/model/weatherModel.dart';
import 'package:api_weather_app/services/weather_api.dart';
import 'package:get/get.dart';


class HomeController extends GetxController {
  WeatherClass? myData;
  var loadData = false.obs;

  getHome() async {
    loadData.value = true;
    var response = await CallApi().getApi();
    if(response.statusCode == 200){
      myData = weatherClassFromJson(response.body);
    }
    loadData.value = false;
  }
}
