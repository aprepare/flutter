import 'package:flutter/material.dart';

class CcPage extends StatelessWidget {
  const CcPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cc"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  // ----- 跳转到search页面
                  Navigator.pop(context);
                }, child: const Text("这是cc页面"),
            )
          ]
        )
      )
    );
  }
}