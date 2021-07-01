import 'dart:convert';
import 'package:bebeq/servers/local.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthenticateViewModels {
  static String url = Servers.serve;
  static Future getInfo() async {
    var token = await AuthenticateViewModels.getToken();
    final response = await http.get(url + "info", headers: {
      'Authorization': 'Bearer ${token}',
    });
    if (response.statusCode == 200) {
      var x = json.decode(response.body);
      print(x);
      return x['data'];
    }
  }

  static Future updateInfo(name, email) async {
    var token = await AuthenticateViewModels.getToken();
    final response = await http.post(url + "update-info", headers: {
      'Authorization': 'Bearer ${token}',
    }, body: {
      'name': name,
      'email': email,
    });
    var res = json.decode(response.body);
    if (response.statusCode == 200) {
      return 'ok';
    } else {
      if (res.toString().contains('email')) {
        return res['error']['email'][0];
      } else if (res.toString().contains('name')) {
        return res['error']['name'][0];
      }
    }
  }

  static Future updatePassword(password, conf_password) async {
    var token = await AuthenticateViewModels.getToken();
    final response = await http.post(url + "update-password", headers: {
      'Authorization': 'Bearer ${token}',
    }, body: {
      'password': password,
      'confirmation_password': conf_password,
    });
    var res = json.decode(response.body);
    if (response.statusCode == 200) {
      return 'ok';
    } else {
      if (res.toString().contains('password')) {
        return res['error']['password'][0];
      }
    }
  }

  static Future register(name, email, password, c_password) async {
    final response = await http.post(url + "register", body: {
      'name': name,
      'email': email,
      'password': password,
      'confirmation_password': c_password,
    });
    var result = json.decode(response.body);
    if (response.statusCode == 200) {
      save('token', result['success']['token']);
      save('role', result['role']);
      if (result['role'] == 'admin') {
        return 'admin';
      } else if (result['role'] == 'peternak') {
        return 'peternak';
      }
    } else {
      // print(result.toString());
      if (result.toString().contains('email')) {
        return result['error']['email'][0].toString();
      } else if (result.toString().contains('password')) {
        return result['error']['password'][0].toString();
      } else if (result.toString().contains('name')) {
        return result['error']['name'][0].toString();
      }
    }
  }

  static Future login(email, password) async {
    final response = await http.post(url + "login", body: {
      'email': email,
      'password': password,
    });
    try {
      var result = json.decode(response.body);
      if (result.toString().contains('success')) {
        save('token', result['success']['token']);
        save('role', result['role']);
        if (result['role'] == 'admin') {
          return 'admin';
        } else if (result['role'] == 'peternak') {
          return 'peternak';
        }
      } else {
        return 'error';
      }
    } catch (e) {
      return e;
    }
  }

  static Future getPeternak() async {
    var token = await getToken();
    final response = await http.get(url + 'users', headers: {
      'Authorization': 'Bearer ${token}',
    });
    if (response.statusCode == 200) {
      var x = json.decode(response.body);
      return x['data'];
    }
  }

  static Future checkAuths(token) async {
    final response = await http.post(url + "isAuth", headers: {
      'Authorization': 'Bearer ${token}',
    });
    print(response.statusCode);
    if (response.statusCode == 200) {
      return 'home';
    } else {
      return 'login';
    }
  }

  static Future logout() async {
    save('token', 'null');
    save('role', 'null');
    return 'ok';
  }

  static Future getToken() async {
    final prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token');
    return token;
  }

  static Future getRole() async {
    final prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('role');
    return token;
  }

  static Future save(String key, String value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
    print('Saved : ' + key + " Value : " + value);
  }
}
