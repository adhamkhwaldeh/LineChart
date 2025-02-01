import 'dart:convert';

import 'package:flutter/services.dart';

class JsonHelper {
  static Future<dynamic> readJson(String path) async {
    final String response = await rootBundle.loadString(path);
    return await json.decode(response);
  }
}
