
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class facebook extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Facebook" ,) ,
        centerTitle: true,
      ),
      body: WebView(
        initialUrl: 'https://2bea-41-46-16-21.ngrok-free.app/',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
