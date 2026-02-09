import 'package:flutter/material.dart';
// 引入路由配置
import './router/router.dart';

void main() => runApp(const MyApp());

/// App根Widget
class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // 初始化路由，初始化进入的页面
      initialRoute: "/",
      // onGenerateRoute处理
      onGenerateRoute: onGenerateRoute,
    );
  }
}