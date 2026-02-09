class Person {
  late String name;
  late int age;

  Person(this.name, this.age);

  // 命名构造函数
  Person.fromJson_1(Map<String, dynamic> json) {
    this.name = json['name'];
    this.age = json['age'];
  }

  // 工厂构造函数
  factory Person.fromJson_2(Map<String, dynamic> json) {
    return Person(json['name'], json['age']);
  }

  void displayInfo() {
    print('Name: $name, Age: $age');
  }
}

void main() {
  Map<String, dynamic> json = {'name': 'Alice', 'age': 25};

  Person person1 = Person.fromJson_1(json);
  person1.displayInfo();

  // 使用工厂构造函数创建对象
  Person person2 = Person.fromJson_2(json);
  person2.displayInfo();
}