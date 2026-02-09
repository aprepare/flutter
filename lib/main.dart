import 'package:flutter/material.dart';
import 'models/ticket.dart';

void main() => runApp(const MyApp());

/// Day 1 学习示例：Flutter 基础 + Dart 语法
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Day 1 学习',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

/// 主页
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // 工单列表
  final List<Ticket> tickets = [
    Ticket(id: '001', title: '服务器宕机', status: TicketStatus.pending),
    Ticket(id: '002', title: '网络不稳定', status: TicketStatus.processing),
    Ticket(id: '003', title: '打印机故障', status: TicketStatus.completed),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('🎫 工单管理'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: tickets.length,
        itemBuilder: (context, index) {
          final ticket = tickets[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              leading: Icon(
                _getStatusIcon(ticket.status),
                color: _getStatusColor(ticket.status),
              ),
              title: Text(ticket.title),
              subtitle: Text('工单号: ${ticket.id}'),
              trailing: Chip(
                label: Text(
                  ticket.statusText,
                  style: const TextStyle(color: Colors.white, fontSize: 12),
                ),
                backgroundColor: _getStatusColor(ticket.status),
              ),
              onTap: () => _showTicketDetail(ticket),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addTicket,
        child: const Icon(Icons.add),
      ),
    );
  }

  // 根据状态返回图标
  IconData _getStatusIcon(TicketStatus status) {
    switch (status) {
      case TicketStatus.pending:
        return Icons.schedule;
      case TicketStatus.processing:
        return Icons.sync;
      case TicketStatus.completed:
        return Icons.check_circle;
    }
  }

  // 根据状态返回颜色
  Color _getStatusColor(TicketStatus status) {
    switch (status) {
      case TicketStatus.pending:
        return Colors.orange;
      case TicketStatus.processing:
        return Colors.blue;
      case TicketStatus.completed:
        return Colors.green;
    }
  }

  // 显示工单详情
  void _showTicketDetail(Ticket ticket) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(ticket.title),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('工单号: ${ticket.id}'),
            Text('状态: ${ticket.statusText}'),
            Text('创建时间: ${ticket.formattedTime}'),
          ],
        ),
        actions: [
          if (ticket.status != TicketStatus.completed)
            TextButton(
              onPressed: () {
                setState(() {
                  ticket.nextStatus();
                });
                Navigator.pop(context);
              },
              child: const Text('推进状态'),
            ),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('关闭'),
          ),
        ],
      ),
    );
  }

  // 添加新工单
  void _addTicket() {
    final newId = (tickets.length + 1).toString().padLeft(3, '0');
    setState(() {
      tickets.add(Ticket(
        id: newId,
        title: '新工单 #$newId',
      ));
    });
    
    // 显示提示
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('已添加工单 #$newId')),
    );
  }
}
