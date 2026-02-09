import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("主页")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // ----- 跳转到search页面
                Navigator.pushNamed(
                  context,
                  "/search",
                  arguments: {"content": "你好，逗比"},
                );
              },
              child: const Text("跳转到search"),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                // ----- 跳转到message页面
                Navigator.pushNamed(context, "/message");
              },
              child: const Text("跳转到message"),
            ),
          ],
        ),
      ),
    );
  }
}
