// import 'dart:async';
//
// import 'package:flutter/material.dart';
// import 'package:flutter_inappwebview/flutter_inappwebview.dart';
// import 'package:flutter_test/flutter_test.dart';
//
// void main() async {
//   testWidgets('', (t) async {
//     final Completer<void> completer = Completer<void>();
//     final cookieManager = CookieManager.instance();
//     const cookieNameToFind = '__dfp';
//     final headlessWebView = HeadlessInAppWebView(
//       initialUrlRequest: URLRequest(url: Uri.parse('https://www.iqiyi.com/')),
//       onLoadStop: (controller, url) async {
//         print('onLoadStop');
//         final cookies = await cookieManager.getCookies(url: url!);
//         final specificCookie = cookies.firstWhere(
//           (cookie) => cookie.name == cookieNameToFind,
//           orElse: () => Cookie(name: '', value: null),
//         );
//         if (specificCookie.name.isNotEmpty && specificCookie.value.isNotEmpty) {
//           print('${specificCookie.name}=${specificCookie.value}');
//         } else {
//           print('No cookie with name $cookieNameToFind found');
//         }
//         completer.complete();
//       },
//     );
//     print('开始');
//     headlessWebView.run();
//     await completer.future;
//     print('完成');
//   });
// }
//
// class Demo extends StatefulWidget {
//   const Demo({super.key});
//
//   @override
//   State<Demo> createState() => _DemoState();
// }
//
// class _DemoState extends State<Demo> {
//   late HeadlessInAppWebView headlessWebView;
//
//   final _cookieManager = CookieManager.instance();
//   final _cookieNameToFind = '__dfp';
//
//   @override
//   void initState() {
//     super.initState();
//     headlessWebView = HeadlessInAppWebView(
//       initialUrlRequest: URLRequest(url: Uri.parse('https://www.iqiyi.com/')),
//       onLoadStop: (controller, url) async {
//         final cookies = await _cookieManager.getCookies(url: url!);
//         final specificCookie = cookies.firstWhere(
//           (cookie) => cookie.name == _cookieNameToFind,
//           orElse: () => Cookie(name: '', value: null),
//         );
//         if (specificCookie.name.isNotEmpty && specificCookie.value.isNotEmpty) {
//           print('${specificCookie.name}=${specificCookie.value}');
//         } else {
//           print('No cookie with name $_cookieNameToFind found');
//         }
//       },
//     );
//     headlessWebView.run();
//   }
//
//   @override
//   void dispose() {
//     headlessWebView.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }
