import 'dart:convert';

import 'package:qoutes/model/qoute_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  Future<void> saveToLocalStorage(List<QouteModel> qoutes) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getStringList('qoutes') == null) {
      List<String> jsonStringList =
          qoutes.map((qoute) => jsonEncode(qoute.toJson())).toList();
      await prefs.setStringList('qoutes', jsonStringList);
    } else {
      List<String> qoutesAsStrings = prefs.getStringList('qoutes')!;
      List<String> jsonStringList =
          qoutes.map((qoute) => jsonEncode(qoute.toJson())).toList();
      jsonStringList +=
          qoutesAsStrings
              .where((qoute) => !jsonStringList.contains(qoute))
              .toList();
      await prefs.setStringList('qoutes', jsonStringList);
    }
  }

  Future<void> removeFromLocalStorage(QouteModel qoute) async {
    String qouteInString = jsonEncode(qoute.toJson());
    SharedPreferences refs = await SharedPreferences.getInstance();
    List<String> jsonStringList = refs.getStringList('qoutes')!;
    jsonStringList.remove(qouteInString);
    await refs.setStringList('qoutes', jsonStringList);
  }

  Future<List<QouteModel>> getFromLocalStorage() async {
    List<QouteModel> qoutes = [];

    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getStringList('qoutes') != null) {
      List<String> qoutesAsStrings = prefs.getStringList('qoutes')!;
      qoutes =
          qoutesAsStrings
              .map((qoute) => QouteModel.fromJson(jsonDecode(qoute)))
              .toList();

      return qoutes;
    } else {
      return qoutes;
    }
  }
}
