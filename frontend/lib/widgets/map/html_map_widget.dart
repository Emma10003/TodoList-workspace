// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/foundation.dart';
// import 'package:webview_flutter/webview_flutter.dart';
// // 어플이라 해서 Chrome이나 Edge에서 못 보는 것이 아님! 방법은 있으나 반대로 어플에서는 안 보임.
// import 'dart:ui_web' as ui_web;  // dart:ui_web 기본 모듈을 줄여서 ui_web 변수로 사용하겠다
// import 'dart:html' as html;
//
// class HtmlMapWidget extends StatefulWidget {
//   const HtmlMapWidget({super.key});
//
//   @override
//   State<HtmlMapWidget> createState() => _HtmlMapWidgetState();
// }
//
// class _HtmlMapWidgetState extends State<HtmlMapWidget> {
//   final String viewId = 'google-maps-iframe';
//
//   @override
//   void initState() {
//     super.initState();
//     if(kIsWeb) {
//       _registerViewFactory();
//     }
//   }
//
//   void _registerViewFactory() {
//     ui_web.platformViewRegistry.registerViewFactory(
//         viewId,
//         (int viewId) {
//           final iframe = html.IFrameElement()
//               ..src = "https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d12649.743837074162!2d126.97475345705566!3d37.56835069513485!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357ca28d3199c531%3A0x7a2d35df0efd2d8!2z642V7IiY6raB!5e0!3m2!1sko!2skr!4v1768445411344!5m2!1sko!2skr"
//               ..style.border = "none"
//               ..style.width = "100%"
//               ..style.height = "100%"
//               ..allowFullscreen = true
//               ..setAttribute('loading', 'lazy')
//               ..setAttribute('referrerpolicy', 'no-referrer-when-downgrade');
//           return iframe;
//         }
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         border: Border(
//           top: BorderSide(color: Colors.grey[300]!)
//         )
//       ),
//       child: kIsWeb
//           ? HtmlElementView(viewType: viewId)
//           : const Center(
//           child: Text(
//               "웹 브라우저에서만 지도를 볼 수 있습니다.",
//               style: TextStyle(fontSize: 16, color: Colors.black54),
//           )
//       )
//     );
//   }
//
// }