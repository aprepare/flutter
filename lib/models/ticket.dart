/// ===========================================
/// Day 1 学习笔记：Dart 核心语法
/// ===========================================
/// 
/// 今天学习了：
/// 1. 变量声明：var / final / const / late
/// 2. 空安全：? / ?. / ?? / !
/// 3. 枚举 enum
/// 4. 类 class、构造函数、getter、方法

// ============================================
// 1️⃣ 枚举 - 一组固定的选项
// ============================================
enum TicketStatus {
  pending,    // 待处理
  processing, // 处理中
  completed,  // 已完成
}

// ============================================
// 2️⃣ 类 - 自定义类型
// ============================================
class Ticket {
  // ------------------------------------------
  // 属性声明
  // ------------------------------------------
  
  // final：赋值后不能改（但创建时必须赋值）
  final String id;
  
  // 普通属性：可以修改
  String title;
  TicketStatus status;
  
  // late：延迟初始化（保证用之前会赋值）
  late DateTime createdAt;
  
  // ------------------------------------------
  // 构造函数
  // ------------------------------------------
  
  /// 构造函数简写：this.id 自动把参数赋给属性
  /// - required：必填参数
  /// - this.status = ...：默认值
  Ticket({
    required this.id,
    required this.title,
    this.status = TicketStatus.pending,
  }) {
    // 构造时记录创建时间
    createdAt = DateTime.now();
  }
  
  // ------------------------------------------
  // Getter - 计算属性（像属性一样访问，不用括号）
  // ------------------------------------------
  
  /// 状态的中文描述
  /// 使用：ticket.statusText（不是 ticket.statusText()）
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
  
  /// 格式化的创建时间
  String get formattedTime {
    return '${createdAt.month}/${createdAt.day} ${createdAt.hour}:${createdAt.minute.toString().padLeft(2, '0')}';
  }
  
  // ------------------------------------------
  // 方法 - 类里面的函数
  // ------------------------------------------
  
  /// 推进到下一个状态
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
  
  /// 重置状态
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
// 📚 Day 1 知识点速查
// ============================================

/*

## 1️⃣ 变量声明

| 关键字 | 能改吗 | 什么时候确定值 |
|--------|--------|----------------|
| var    | ✅ 能  | 随时           |
| final  | ❌ 不能重新赋值 | 运行时 |
| const  | ❌ 完全不能改 | 编译时 |
| late   | ✅ 第一次赋值后不能改 | 延迟 |

关键区别：
- final list = [1,2,3]; list.add(4); ✅ 可以（内容能改）
- final list = [1,2,3]; list = [4,5]; ❌ 不行（不能重新赋值）
- const 必须是编译时就知道的值，DateTime.now() 不行

## 2️⃣ 空安全

| 符号 | 作用 | 例子 |
|------|------|------|
| ?    | 允许 null | String? name; |
| ?.   | 安全访问 | name?.length |
| ??   | 默认值 | name ?? '匿名' |
| !    | 强制解包（危险） | name!.length |

## 3️⃣ 类 vs 对象

class Ticket { }     // 类 = 设计图（大写开头）
var ticket = Ticket(); // 对象 = 实例（小写开头）

## 4️⃣ Getter vs 方法

String get xxx { }   // getter，访问：ticket.xxx
String xxx() { }     // 方法，调用：ticket.xxx()

*/
