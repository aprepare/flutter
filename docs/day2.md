# Day 2：Widget + 布局 + 列表

目标：理解 Flutter 的 UI 由 Widget 组成；掌握常用布局（Row/Column/Expanded/Stack）；掌握列表渲染（ListView.builder）。

## 1. 一切皆 Widget
Flutter 的界面由一棵 Widget 树描述。Text、Container、SizedBox、Scaffold、AppBar 都是 Widget。

## 2. StatelessWidget vs StatefulWidget
- StatelessWidget：不持有可变状态（展示型组件）。
- StatefulWidget：有可变状态；状态放在 `State` 里；状态变化用 `setState` 通知重建。

> 记忆法：StatefulWidget = 外壳（不变） + State（会变的数据/逻辑）。

## 3. 布局三件套
- Row：横向排列
- Column：纵向排列
- Stack：叠放（可用 Positioned 定位）

### Expanded（救命组件）
当 Row/Column 出现溢出或需要“中间区域占满剩余空间”时，用 Expanded。

## 4. 列表组件
推荐：`ListView.builder`（懒加载，性能好）

常见坑：`Column` 里直接放 `ListView` 会报错，需要：
- 用 `Expanded(child: ListView(...))`
- 或 `SizedBox(height: xxx, child: ListView(...))`

## 代码
对应示例代码：`lib/demos/day2_widgets_layout_list.dart`
