import 'dart:convert';

import 'package:bebeq/servers/local.dart';
import 'package:bebeq/viewmodel/auth.dart';
import 'package:http/http.dart' as http;
import 'package:bebeq/models/kandang.dart';

class KandangViewModels {
  
  static String url = Servers.serve;
  static Future<List<KandangModel>> getKandang() async {
    var token = await AuthenticateViewModels.getToken();
    final response = await http.get(url + 'cages', headers: {
      'Authorization' : 'Bearer ${token}',
    });
    try{
      if(response.statusCode == 200){
        var d = json.decode(response.body);
        final List<KandangModel> x = kandangModelFromJson(d['data']); 
        print(x.toString());
        return x;
      }
    }
    catch(e){
      print(e.toString());
      return List<KandangModel>();
    }
  }
  static Future getCategory() async {
    var token = await AuthenticateViewModels.getToken();
    final response = await http.get(url + "get-category", 
      headers: {
        'Authorization' : 'Bearer ${token}',
      },
    );
    var cat = json.decode(response.body);
    return cat['category'];
  }
  static Future storeKandang(category,name, current, capacity) async {
    var token = await AuthenticateViewModels.getToken();
    final response = await http.post(url + "cages/store", 
      headers: {
        'Authorization' : 'Bearer ${token}',
      },
      body: {
        'category_id' : category.toString(),
        'name' : name,
        'current_capacity' : current,
        'capacity' : capacity,
      } 
    );
    try {
      if(response.statusCode == 200) {
        return 'bisa';
      }
    }catch(e){
      return e;
    }
  }
  static Future updateKandang(category,name, current, capacity, id) async {
    var token = await AuthenticateViewModels.getToken();
    final response = await http.post(url + "cages/update/info", 
      headers: {
        'Authorization' : 'Bearer ${token}',
      },
      body: {
        'category_id' : category.toString(),
        'name' : name,
        'current_capacity' : current,
        'capacity' : capacity,
        'id' : id.toString(),
      } 
    );
    print(response.body.toString());
    try {
      if(response.statusCode == 200) {
        return 'bisa';
      }
    }catch(e){
      return e;
    }
  }
  static Future addCapacity(id, currents, value, status) async {
    var token = await AuthenticateViewModels.getToken();
    final response = await http.post(url + "cages/update/current", 
      headers: {
        'Authorization' : 'Bearer ${token}',
      },
      body: {
        'id' : '${id}',
        'currents' : '${currents}',
        'value' : '${value}',
        'status' : '${status}'
      } 
    );
    var result = json.decode(response.body);
    try {
      if(response.statusCode == 200) {
        return 'bisa';
      }else{
        return result['msg'];
      }
    }catch(e){
      return e.toString();
    }
  }
}