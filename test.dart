import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:color/color.dart';
import 'dart:io';

Future<void> main() async {
  var url = 'http://192.168.0.38:9021/api/grid';

  var i=0;
  while (true){
   i = i +1 % 360;
    var color = new HslColor(i, 100, 50);
    var colorStr = '#${color.toHexColor()}';

    var grid = List<List<Map>>.filled(
        8, List<Map>.filled(4, {"color": colorStr}));
    print(colorStr);
    var response = await http.put(url, body: jsonEncode(grid),
        headers: {'Content-Type': 'application/json'});

    sleep(const Duration(milliseconds: 600 ));
  }
}