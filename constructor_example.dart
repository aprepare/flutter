class Color {
  final int red;
  final int green;
  final int blue;

  // 默认构造函数
  Color(this.red, this.green, this.blue);

  // 命名构造函数示例1：使用RGB值创建白色
  Color.white()
      : red = 255,
        green = 255,
        blue = 255;

  // 命名构造函数示例2：使用RGB值创建黑色
  Color.black()
      : red = 0,
        green = 0,
        blue = 0;

  // 命名构造函数示例3：从十六进制字符串创建颜色
  Color.fromHex(String hexColor)
      : red = int.parse(hexColor.replaceAll('#', '').substring(0, 2), radix: 16),
        green = int.parse(hexColor.replaceAll('#', '').substring(2, 4), radix: 16),
        blue = int.parse(hexColor.replaceAll('#', '').substring(4, 6), radix: 16);

  @override
  String toString() => 'Color(R:$red, G:$green, B:$blue)';
}

// 使用工厂构造函数的示例
class Logger {
  // 私有构造函数
  Logger._internal();
  
  // 单例实例
  static final Logger _instance = Logger._internal();
  
  // 工厂构造函数实现单例模式
  factory Logger() {
    return _instance;
  }

  void log(String message) {
    print('${DateTime.now()}: $message');
  }
}

// 另一个工厂构造函数的示例
class Shape {
  // 抽象类不能被直接实例化
  const Shape();
  
  // 工厂构造函数根据类型创建不同的形状
  factory Shape.create(String type) {
    switch (type.toLowerCase()) {
      case 'circle':
        return Circle();
      case 'square':
        return Square();
      default:
        throw ArgumentError('Unknown shape type: $type');
    }
  }
}

class Circle extends Shape {
  @override
  String toString() => 'Circle';
}

class Square extends Shape {
  @override
  String toString() => 'Square';
}

void main() {
  // 命名构造函数示例
  print('\n=== 命名构造函数示例 ===');
  final white = Color.white();
  print('白色: $white');

  final black = Color.black();
  print('黑色: $black');

  final customColor = Color(255, 128, 0);
  print('自定义颜色: $customColor');

  final hexColor = Color.fromHex('FF8800');
  print('从十六进制创建的颜色: $hexColor');

  // 工厂构造函数示例1：单例模式
  print('\n=== 工厂构造函数示例1：单例模式 ===');
  final logger1 = Logger();
  final logger2 = Logger();
  print('logger1 和 logger2 是否是同一个实例: ${identical(logger1, logger2)}');
  
  logger1.log('这是来自 logger1 的消息');
  logger2.log('这是来自 logger2 的消息');

  // 工厂构造函数示例2：根据类型创建不同对象
  print('\n=== 工厂构造函数示例2：创建不同类型 ===');
  final circle = Shape.create('circle');
  print('创建的形状1: $circle');

  final square = Shape.create('square');
  print('创建的形状2: $square');

  try {
    Shape.create('triangle');
  } catch (e) {
    print('创建未知形状时的错误: $e');
  }
} 