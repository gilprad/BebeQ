import 'dart:convert';
import 'package:bebeq/models/gejala.dart';
import 'package:bebeq/servers/local.dart';
import 'package:bebeq/viewmodel/auth.dart';
import 'package:http/http.dart' as http;

class GejalaViewModels {
  static String url = Servers.serve;
  static Future<List<GejalaModel>> getKandang() async {
    var token = await AuthenticateViewModels.getToken();
    final response = await http.get(url + 'get-gejala', headers: {
      'Authorization': 'Bearer ${token}',
    });
    try {
      if (response.statusCode == 200) {
        var d = json.decode(response.body);
        final List<GejalaModel> x = gejalaModelFromJson(d['data']);
        print(x.toString());
        return x;
      }
    } catch (e) {
      print("ERROR");
      return List<GejalaModel>();
    }
  }

  static Future getAllGejala() async {
    var token = await AuthenticateViewModels.getToken();
    final response = await http.get(url + 'get-gejala', headers: {
      'Authorization': 'Bearer ${token}',
    });
    try {
      if (response.statusCode == 200) {
        var d = json.decode(response.body);
        return d['data'];
      }
    } catch (e) {
      print("ERROR");
    }
  }

  static Future getJawaban(pola) async {
    var token = await AuthenticateViewModels.getToken();
    final response =
        await http.get(url + 'selesai-gejala?pola=' + pola, headers: {
      'Authorization': 'Bearer ${token}',
    });
    var res = json.decode(response.body);
    if(response.statusCode == 200){
      return res; 
    }else{
      return res;
    }
  }

  static Future createGejala(String name) async {
    var token = await AuthenticateViewModels.getToken();
    final response = await http.post(url + 'set-gejala', headers: {
      'Authorization': 'Bearer ${token}',
    }, body: {
      'name': name,
    });
    if (response.statusCode == 200) {
      return 'ok';
    }
  }

  static Future updateDataGejala(id, name) async {
    var token = await AuthenticateViewModels.getToken();
    final response = await http.post(url + 'update-gejala', headers: {
      'Authorization': 'Bearer ${token}',
    }, body: {
      'id': "${id}",
      'name': "${name}",
    });
    if (response.statusCode == 200) {
      return 'ok';
    } else {
      return 'error';
    }
  }
}
