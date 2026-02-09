import 'package:flutter/material.dart';

/// 搜索页面
class SearchPage extends StatefulWidget {

  final String content;

  const SearchPage({Key? key, required this.content}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("搜索"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(widget.content),
            const SizedBox(height: 40),
            ElevatedButton(
                onPressed: () {
                  // ----- 返回到上一个页面
                  Navigator.pop(context);
                },
                child: const Text("返回")
            )
          ],
        ),
      ),
    );
  }
}