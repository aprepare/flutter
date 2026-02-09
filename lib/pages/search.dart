import 'package:flutter/material.dart';

/// 搜索页面
class SearchPage extends StatefulWidget {

  final Map arguments;
  // ---- 使用 arguments 接收参数
  const SearchPage({Key? key, required this.arguments}) : super(key: key);

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
            Text(widget.arguments["content"] ?? "默认内容"),
            const SizedBox(height: 40),
            ElevatedButton(
                onPressed: () {
                  // ----- 返回到上一个页面
                  Navigator.pushReplacementNamed(context, '/message');
                },
                child: const Text("返回")
            )
          ],
        ),
      ),
    );
  }
}