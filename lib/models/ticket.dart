/// Day 1 学习：Dart 类、枚举、空安全
/// 
/// 这个文件展示了：
/// 1. 枚举（enum）的定义和使用
/// 2. 类（class）的定义
/// 3. final 和 late 的区别
/// 4. 可选参数和命名参数
/// 5. getter 的使用

/// 工单状态枚举
enum TicketStatus {
  pending,    // 待处理
  processing, // 处理中
  completed,  // 已完成
}

/// 工单类
class Ticket {
  // final：定了就不能改（但对象内部可以变）
  final String id;
  
  // 普通属性：可以修改
  String title;
  TicketStatus status;
  
  // late：延迟初始化，稍后再赋值
  late DateTime createdAt;
  
  /// 构造函数
  /// - required：必填参数
  /// - 默认值：status 默认是 pending
  Ticket({
    required this.id,
    required this.title,
    this.status = TicketStatus.pending,
  }) {
    // 创建时记录时间
    createdAt = DateTime.now();
  }
  
  /// getter：状态的中文描述
  String get statusText {
    switch (status) {
      case TicketStatus.pending:
        return '待处理';
      case TicketStatus.processing:
        return '处理中';
      case TicketStatus.completed:
        return '已完成';
    }
  }
  
  /// getter：格式化的创建时间
  String get formattedTime {
    return '${createdAt.month}/${createdAt.day} ${createdAt.hour}:${createdAt.minute.toString().padLeft(2, '0')}';
  }
  
  /// 方法：推进到下一个状态
  void nextStatus() {
    switch (status) {
      case TicketStatus.pending:
        status = TicketStatus.processing;
        break;
      case TicketStatus.processing:
        status = TicketStatus.completed;
        break;
      case TicketStatus.completed:
        // 已完成，不能再推进
        break;
    }
  }
  
  /// 方法：重置状态
  void reset() {
    status = TicketStatus.pending;
  }
  
  /// toString：方便调试打印
  @override
  String toString() {
    return 'Ticket{id: $id, title: $title, status: $statusText}';
  }
}

// ============================================
// 下面是 Day 1 的知识点示例（可以在 DartPad 中运行）
// ============================================

/// 示例：var / final / const / late 的区别
void variableExamples() {
  // var：可以改
  var name = '浣熊';
  name = '小水獭';  // ✅ OK
  
  // final：运行时确定，不能重新赋值
  final now = DateTime.now();
  // now = DateTime.now();  // ❌ 报错
  
  // final 的 List 可以增删元素
  final list = [1, 2, 3];
  list.add(4);  // ✅ OK，list 还是那个 list
  // list = [5, 6];  // ❌ 报错，不能重新赋值
  
  // const：编译时确定，完全不可变
  const PI = 3.14159;
  const list2 = [1, 2, 3];
  // list2.add(4);  // ❌ 报错，不能修改
  
  // late：延迟初始化
  late String nickname;
  nickname = '主人';  // ✅ 稍后赋值
  print(nickname);
}

/// 示例：空安全 ? ! ?? 的使用
void nullSafetyExamples() {
  // String? 表示可能是 null
  String? name;
  
  // ?. 安全访问：如果是 null 就返回 null
  print(name?.length);  // 输出：null
  
  // ?? 空值合并：如果是 null 就用默认值
  String result = name ?? '匿名';
  print(result);  // 输出：匿名
  
  // ! 强制解包：我保证不是 null（危险！）
  name = '浣熊';
  print(name!.length);  // 输出：2
}

/// 示例：函数的多种写法
void functionExamples() {
  // 普通函数
  int add(int a, int b) {
    return a + b;
  }
  
  // 箭头函数（一行搞定）
  int multiply(int a, int b) => a * b;
  
  // 可选参数（用 [] 包裹）
  void greet(String name, [String? title]) {
    print('Hello, ${title ?? ''} $name');
  }
  greet('浣熊');           // Hello,  浣熊
  greet('浣熊', 'Mr.');    // Hello, Mr. 浣熊
  
  // 命名参数（用 {} 包裹）
  void createTicket({required String title, String status = '待处理'}) {
    print('工单: $title, 状态: $status');
  }
  createTicket(title: '服务器挂了');  // 工单: 服务器挂了, 状态: 待处理
}
