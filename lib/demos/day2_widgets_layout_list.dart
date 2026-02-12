import 'package:flutter/material.dart';

/// Day 2 Demo：Widget + 布局 + 列表
///
/// 包含：
/// - StatefulWidget（点赞计数器）
/// - Row/Column/Expanded（工单卡片布局）
/// - ListView.builder（列表渲染）
class Day2WidgetsLayoutListPage extends StatefulWidget {
  const Day2WidgetsLayoutListPage({super.key});

  @override
  State<Day2WidgetsLayoutListPage> createState() => _Day2WidgetsLayoutListPageState();
}

class _Day2WidgetsLayoutListPageState extends State<Day2WidgetsLayoutListPage> {
  int likes = 0;

  final tickets = <Map<String, String>>[
    {'title': '代取快递', 'status': '待接单', 'time': '08:30'},
    {'title': '食堂带饭', 'status': '进行中', 'time': '11:20'},
    {'title': '打印资料', 'status': '已完成', 'time': '14:00'},
    {'title': '取外卖', 'status': '待接单', 'time': '18:45'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Day 2：Widget + 布局 + 列表'),
      ),
      body: Column(
        children: [
          // ===== StatefulWidget：点赞计数器 =====
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                const Icon(Icons.thumb_up_alt_outlined),
                const SizedBox(width: 8),
                Text('点赞数：$likes', style: const TextStyle(fontSize: 18)),
                const Spacer(),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      likes++;
                    });
                  },
                  child: const Text('👍 点赞'),
                ),
              ],
            ),
          ),

          const Divider(height: 1),

          // ===== ListView 在 Column 内：必须用 Expanded =====
          Expanded(
            child: ListView.builder(
              itemCount: tickets.length,
              itemBuilder: (context, index) {
                final t = tickets[index];
                return _TicketCard(
                  title: t['title']!,
                  status: t['status']!,
                  time: t['time']!,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _TicketCard extends StatelessWidget {
  final String title;
  final String status;
  final String time;

  const _TicketCard({
    required this.title,
    required this.status,
    required this.time,
  });

  Color _statusColor() {
    switch (status) {
      case '待接单':
        return Colors.orange;
      case '进行中':
        return Colors.blue;
      case '已完成':
        return Colors.green;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: _statusColor().withOpacity(0.12),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(Icons.assignment_outlined, color: _statusColor()),
            ),
            const SizedBox(width: 12),

            // 中间区域：Expanded + Column
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      )),
                  const SizedBox(height: 4),
                  Text(time, style: const TextStyle(color: Colors.grey)),
                ],
              ),
            ),

            // 右侧标签：固定宽度/自适应
            Chip(
              label: Text(status, style: const TextStyle(fontSize: 12)),
              backgroundColor: _statusColor().withOpacity(0.15),
              side: BorderSide(color: _statusColor().withOpacity(0.35)),
            )
          ],
        ),
      ),
    );
  }
}
