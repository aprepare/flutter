# Day 3：路由 + 状态管理（先学 Navigator）

目标：掌握页面跳转（push/pop）、页面传参、返回结果；了解命名路由与 `onGenerateRoute` 的项目写法。

## 1. Navigator 栈模型
- `push`：进入新页面（压栈）
- `pop`：返回上一页（出栈）

## 2. 传参 + 回传结果
- A -> B：`Navigator.push` / `pushNamed`，通过构造函数或 arguments 传参
- B -> A：`Navigator.pop(context, result)` 回传结果
- A 等待结果：`final result = await Navigator.push...`

## 3. 命名路由（routes）
适合小项目：`routes: { '/list': (_) => ListPage() }`

## 4. onGenerateRoute（推荐项目用）
优点：
- 统一入口做参数校验
- 可做登录拦截（Route Guard）
- 处理未知路由（404）

## 代码
对应示例代码：`lib/demos/day3_routes_on_generate.dart`
