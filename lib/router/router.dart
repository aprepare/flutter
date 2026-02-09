import 'package:flutter/material.dart';
import '../pages/cc.dart';
import '../pages/dd.dart';
import '../pages/home.dart';
import '../pages/search.dart';
import '../pages/message.dart';

// 1、定义Map类型的routes
final Map routes = {
  '/': (context) => const HomePage(),
  '/search': (context, {arguments}) => SearchPage(arguments: arguments),
  '/message': (context) => const MessagePage(),
  '/cc': (context) => const CcPage(),
  '/dd': (context) => const DdPage(),
};

var onGenerateRoute = (RouteSettings settings) {
  // 统一处理
  final String? name = settings.name;
  final Function? pageContentBuilder = routes[name];
  if (pageContentBuilder != null) {
    if (settings.arguments != null) {
      final Route route = MaterialPageRoute(
          builder: (context) =>
              pageContentBuilder(context, arguments: settings.arguments));
      return route;
    } else {
      final Route route = MaterialPageRoute(
          builder: (context) => pageContentBuilder(context));
      return route;
    }
  }
  return null;
};