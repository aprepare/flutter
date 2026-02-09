import 'package:flutter/material.dart';

class MessagePage extends StatefulWidget {
  const MessagePage({Key? key}) : super(key: key);

  @override
  State<MessagePage> createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("消息"),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              // ----- 返回到上一个页面
              Navigator.pop(context);
            },
            child: const Text("返回")
        ),
      ),
    );
  }
}