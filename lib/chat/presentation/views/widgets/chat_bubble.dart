import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;

class ChatBubble extends StatelessWidget {
  const ChatBubble({
    Key? key,
    required this.message,
  }) : super(key: key);

  final String message;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          padding:
              const EdgeInsets.only(top: 32, bottom: 32, right: 32, left: 16),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(32),
              topRight: Radius.circular(32),
              bottomLeft: Radius.circular(32),
            ),
            color: Colors.blue,
          ),
          child: Text(
            message,
            textDirection:
                isRTL(message) ? TextDirection.rtl : TextDirection.ltr,
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.w500),
          )),
    );
  }
}

class ChatImageBubble extends StatelessWidget {
  const ChatImageBubble({
    Key? key,
    required this.message,
  }) : super(key: key);

  final String message;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => ShowImage(
                imageUrl: message,
              ),
            ),
          );
        },
        child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            width: 300,
            height: 300,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(32),
                topRight: Radius.circular(32),
                bottomLeft: Radius.circular(32),
              ),
              color: Colors.blue,
            ),
            child: Image.network(message, fit: BoxFit.cover)),
      ),
    );
  }
}

class ChatBubbleForBot extends StatelessWidget {
  const ChatBubbleForBot({
    Key? key,
    required this.message,
  }) : super(key: key);

  final String message;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          padding:
              const EdgeInsets.only(top: 32, bottom: 32, right: 32, left: 16),
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(32),
                topRight: Radius.circular(32),
                bottomRight: Radius.circular(32),
              ),
              color: Colors.green),
          child: Text(
            message,
            textDirection:
                isRTL(message) ? TextDirection.rtl : TextDirection.ltr,
            style: const TextStyle(color: Colors.white),
          )),
    );
  }
}

class ChatImageBubbleForBot extends StatelessWidget {
  const ChatImageBubbleForBot({
    Key? key,
    required this.message,
  }) : super(key: key);

  final String message;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => ShowImage(
                imageUrl: message,
              ),
            ),
          );
        },
        child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            width: 300,
            height: 300,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(32),
                  topRight: Radius.circular(32),
                  bottomRight: Radius.circular(32),
                ),
                color: Colors.green),
            child: Image.network(message, fit: BoxFit.cover)),
      ),
    );
  }
}

bool isRTL(String text) {
  return intl.Bidi.detectRtlDirectionality(text);
}

class ShowImage extends StatelessWidget {
  final String imageUrl;

  const ShowImage({required this.imageUrl, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        color: Colors.black,
        child: Image.network(imageUrl),
      ),
    );
  }
}
