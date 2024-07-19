import 'dart:convert';

import 'package:resource_hunter/resource_hunter.dart';

void main() async {
  final r = ResourceHunter();
  final result = await r.parseLink<ParseVideoResult>('https://v.qq.com/x/cover/mzc00200u8vfzcz.html');
  print(jsonEncode(result.toJson()));
}
