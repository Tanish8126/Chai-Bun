import 'dart:async';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final String title = "Online Agent";
  final String selectedUrl =
      "https://tawk.to/chat/612fd2a4649e0a0a5cd41bb1/1fehctksd";

  int postion = 1;

  final key = UniqueKey();
  doneLoading(String A) {
    setState(() {
      postion = 0;
    });
  }

  startLoading(String A) {
    setState(() {
      postion = 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(0),
        child: IndexedStack(
          index: postion,
          children: <Widget>[
            WebView(
              initialUrl:
                  'https://tawk.to/chat/612fd2a4649e0a0a5cd41bb1/1fehctksd',
              javascriptMode: JavascriptMode.unrestricted,
              key: key,
              onPageFinished: doneLoading,
              onPageStarted: startLoading,
            ),
            Container(
              color: Colors.white,
              child: const Center(child: CircularProgressIndicator()),
            )
          ],
        ),
      ),
    );
  }
}
