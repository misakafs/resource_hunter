import 'dart:convert';

import 'package:resource_hunter/resource_hunter.dart';

void main() async {
  final v = VideoPlatform();

  final result = await v.parse('');

  print(const JsonEncoder().convert(result));
}
