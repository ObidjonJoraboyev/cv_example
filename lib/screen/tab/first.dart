import 'package:flutter/material.dart';

import '../../services/widget_saver_service.dart';

class FirstScreen extends StatelessWidget {
  FirstScreen({super.key});

  final GlobalKey _globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          RepaintBoundary(
            key: _globalKey,
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              padding: const EdgeInsets.all(3),
              decoration: BoxDecoration(
                  border: Border.all(
                    width: 5,
                  ),
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Salom"),
                  Text("Salom"),
                  Text("Salom"),
                  Text("Salom"),
                  Text("Salom"),
                  Text("Salom"),
                  Text("Salom"),
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  IconButton(
                    style: IconButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6))),
                    onPressed: () {
                      WidgetSaverService.openWidgetAsImage(
                        context: context,
                        widgetKey: _globalKey,
                        fileId: _globalKey.toString(),
                      );
                    },
                    icon: const Icon(
                      Icons.share,
                      size: 32,
                      color: Color(0xff333333),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    "Share",
                    style: TextStyle(fontSize: 18, fontFamily: "itim"),
                  )
                ],
              ),
              const SizedBox(
                width: 25,
              ),
              const Column(
                children: [
                  SizedBox(
                    height: 5,
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
