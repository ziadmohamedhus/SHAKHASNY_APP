
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class youtube extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: WebView(
        initialUrl: 'https://www.youtube.com/@childrensLA/videos',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
