import 'package:flutter/material.dart';

/// Day 3 Demo：路由（onGenerateRoute）+ 传参 + 回传结果 + 简单登录拦截
///
/// 说明：为了演示“项目写法”，这里把路由统一放在 onGenerateRoute 里。
/// 重点：
/// - 统一入口做参数校验
/// - 登录拦截（未登录强制跳 login）
/// - 详情页用构造函数接参（避免在页面里 ModalRoute.of 取参）
class Day3RoutesApp extends StatelessWidget {
  const Day3RoutesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Day 3 Routes',
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.login,
      onGenerateRoute: (settings) {
        Widget notFound() => const _NotFoundPage();

        // 登录拦截：除 login 外都需要登录
        final needLogin = settings.name != Routes.login;
        if (needLogin && !Auth.isLoggedIn) {
          return MaterialPageRoute(
            settings: const RouteSettings(name: Routes.login),
            builder: (_) => const _LoginPage(),
          );
        }

        switch (settings.name) {
          case Routes.login:
            return MaterialPageRoute(builder: (_) => const _LoginPage());

          case Routes.list:
            return MaterialPageRoute(builder: (_) => const _ListPage());

          case Routes.detail:
            final args = settings.arguments;
            if (args is! int) {
              return MaterialPageRoute(builder: (_) => notFound());
            }
            return MaterialPageRoute(
              builder: (_) => _DetailPage(ticketId: args),
            );

          default:
            return MaterialPageRoute(builder: (_) => notFound());
        }
      },
    );
  }
}

class Routes {
  static const login = '/login';
  static const list = '/list';
  static const detail = '/detail';
}

class Auth {
  static bool isLoggedIn = false;
}

class _LoginPage extends StatelessWidget {
  const _LoginPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('登录')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Auth.isLoggedIn = true;
            // 登录后替换到列表页（返回键不回登录）
            Navigator.pushReplacementNamed(context, Routes.list);
          },
          child: const Text('登录（模拟成功）'),
        ),
      ),
    );
  }
}

class _ListPage extends StatelessWidget {
  const _ListPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('工单列表'),
        actions: [
          TextButton(
            onPressed: () {
              Auth.isLoggedIn = false;
              Navigator.pushReplacementNamed(context, Routes.login);
            },
            child: const Text('退出', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (_, i) {
          final id = i + 1;
          return ListTile(
            title: Text('工单 #$id'),
            onTap: () async {
              final result = await Navigator.pushNamed(
                context,
                Routes.detail,
                arguments: id,
              );

              if (result != null && context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('返回结果：$result')),
                );
              }
            },
          );
        },
      ),
    );
  }
}

class _DetailPage extends StatelessWidget {
  final int ticketId;
  const _DetailPage({required this.ticketId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('详情 #$ticketId')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context, '已处理 ticketId=$ticketId');
          },
          child: const Text('处理完成并返回'),
        ),
      ),
    );
  }
}

class _NotFoundPage extends StatelessWidget {
  const _NotFoundPage();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('404 - 未知页面')),
    );
  }
}
