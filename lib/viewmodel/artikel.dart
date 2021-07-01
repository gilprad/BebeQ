import 'dart:convert';

import 'package:bebeq/models/artikel.dart';
import 'package:bebeq/servers/local.dart';
import 'package:bebeq/viewmodel/auth.dart';
import 'package:http/http.dart' as http;


class ArtikelViewModels {
  static String url = Servers.serve;

  
  static Future getArtikel() async {
    var token = await AuthenticateViewModels.getToken();
    final response = await http.get(url + 'get-artikel', headers: {
      'Authorization' : 'Bearer ${token}',
    });
    if(response.statusCode == 200){
      var x = json.decode(response.body);
      return x['data'];
    }
  }
  static Future storeArtikel(title,link_img,value) async {
    var token = await AuthenticateViewModels.getToken();
    final response = await http.post(url + 'set-artikel', headers: {
      'Authorization' : 'Bearer ${token}',
    }, body: {
      'title' : '${title}',
      'link_img' : '${link_img}',
      'value' : '${value}',
    });
    print(response.statusCode.toString());
    if(response.statusCode == 200){
      return 'ok';
    }
  }
  static Future updateArtikel(title,link_img,value, id) async {
    var token = await AuthenticateViewModels.getToken();
    final response = await http.post(url + 'edit-artikel', headers: {
      'Authorization' : 'Bearer ${token}',
    }, body: {
      'title' : '${title}',
      'link_img' : '${link_img}',
      'value' : '${value}',
      'id' : '${id}'
    });
    print(response.statusCode.toString());
    if(response.statusCode == 200){
      return 'ok';
    }
  }
  static Future deleteArtikel(id) async {
    var token = await AuthenticateViewModels.getToken();
    final response = await http.post(url + 'delete-artikel', headers: {
      'Authorization' : 'Bearer ${token}',
    }, body: {
      'id' : '${id}'
    });
    print(response.statusCode.toString());
    if(response.statusCode == 200){
      return 'ok';
    }
  }
}