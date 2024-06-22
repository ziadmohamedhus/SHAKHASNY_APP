
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ChatBot2 extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: WebView(
        initialUrl: 'https://1b45-197-36-68-160.ngrok-free.app/',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
