import 'package:flutter/material.dart';

void main() {
  runApp(const CampusHubApp());
}

/// 校园聚合 App：课表 / 作业 / 日历 / 待办
class CampusHubApp extends StatelessWidget {
  const CampusHubApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Campus Hub',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF3F6BFF)),
        useMaterial3: true,
      ),
      home: const HomeShell(),
    );
  }
}

class HomeShell extends StatefulWidget {
  const HomeShell({super.key});

  @override
  State<HomeShell> createState() => _HomeShellState();
}

class _HomeShellState extends State<HomeShell> {
  int _index = 0;

  static const _titles = ['课表', '作业', '日历', '待办'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_titles[_index])),
      body: _placeholder(_titles[_index]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: '手动录入',
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _index,
        onDestinationSelected: (i) => setState(() => _index = i),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.schedule), label: '课表'),
          NavigationDestination(icon: Icon(Icons.assignment_outlined), label: '作业'),
          NavigationDestination(icon: Icon(Icons.calendar_month), label: '日历'),
          NavigationDestination(icon: Icon(Icons.checklist), label: '待办'),
        ],
      ),
    );
  }

  Widget _placeholder(String title) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.inbox_outlined, size: 56, color: Colors.grey),
          const SizedBox(height: 12),
          Text('还没有$title数据', style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 4),
          const Text('点击右下角手动录入，或导入 ICS 文件'),
        ],
      ),
    );
  }
}
