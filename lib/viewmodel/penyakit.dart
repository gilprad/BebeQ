import 'dart:convert';

import 'package:bebeq/servers/local.dart';
import 'package:bebeq/viewmodel/auth.dart';
import 'package:http/http.dart' as http;

class PenyakitViewModels {
  static String url = Servers.serve;
  static Future getPenyakit() async {
    var token = await AuthenticateViewModels.getToken();
    final response = await http.get(url + 'get-penyakit', headers: {
      'Authorization': 'Bearer ${token}',
    });
    if (response.statusCode == 200) {
      var y = json.decode(response.body);
      return y['data'];
    } else {
      return 'error';
    }
  }

  static Future store(pola, name, solusi) async {
    var token = await AuthenticateViewModels.getToken();
    final response = await http.post(url + 'set-penyakit', headers: {
      'Authorization': 'Bearer ${token}',
    }, body: {
      'pola': pola,
      'name': name,
      'solusi': solusi
    });
    if (response.statusCode == 200) {
      return 'ok';
    } else {
      var res = json.decode(response.body);
      if (res.toString().contains('name')) {
        return res[0]['name'][0].toString();
      } else if (res.toString().contains('pola')) {
        return res[0]['pola'][0].toString();
      } else if (res.toString().contains('solusi')) {
        return res[0]['solusi'][0].toString();
      } else {
        if (res['type'].contains('name')) {
          return res['message'];
        } else if (res['type'].contains('pola')) {
          return res['message'];
        } else if (res['type'].contains('solusi')) {
          return res['message'];
        }
        // print("ini" + res['message'].toString());
        // return res['message'];
      }
      // print(response.body);
    }
  }

  static Future updatePenyakit(solusi, pola, name, id) async {
    var token = await AuthenticateViewModels.getToken();
    final response = await http.post(url + 'update-penyakit', headers: {
      'Authorization': 'Bearer ${token}',
    }, body: {
      'solusi': "${solusi}",
      'pola': "${pola}",
      'name': "${name}",
      'id': "${id}",
    });
    if (response.statusCode == 200) {
      return 'ok';
    } else {
      var res = json.decode(response.body);
      if (res.toString().contains('name')) {
        return res[0]['name'][0].toString();
      } else if (res.toString().contains('pola')) {
        return res[0]['pola'][0].toString();
      } else if (res.toString().contains('solusi')) {
        return res[0]['solusi'][0].toString();
      } else {
        if (res['type'].contains('nama')) {
          return res['message'];
        } else if (res['type'].contains('pola')) {
          return res['message'];
        } else if (res['type'].contains('solusi')) {
          return res['message'];
        }
      }
      print(response.body);
    }
  }
}
