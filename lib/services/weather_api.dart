import 'package:http/http.dart' as http;
class CallApi{
  var url = Uri.parse("https://api.open-meteo.com/v1/forecast?latitude=15.3547&longitude=44.206744&current=temperature_2m,wind_speed_10m&hourly=temperature_2m,relative_humidity_2m,wind_speed_10m");

  getApi()async{
    var client = http.Client();

    try{
      var response = await client.get(url);
      return response;

    }catch(e){
      return http.Response("Error" , 408);

    }
  }
}
