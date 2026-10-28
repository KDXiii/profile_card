import 'package:flutter/material.dart';

void main() => runApp(const PracticeLabApp());

class PracticeLabApp extends StatelessWidget {
  const PracticeLabApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(colorSchemeSeed: Colors.teal),
      home: const PracticeLabPage(),
    );
  }
}

class PracticeLabPage extends StatelessWidget {
  const PracticeLabPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _section('弹性分配 2:1:1'),
            const SizedBox(height: 8),
            _flexRow(null),
            const SizedBox(height: 12),
            _flexRow(const Text('TraeCodeTraeCodeTraeCode')),
            const SizedBox(height: 12),
            _flexRow(
              const Text(
                'TraeCodeTraeCodeTraeCode',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(height: 12),
            _flexRow(
              const FittedBox(
                fit: BoxFit.scaleDown,
                alignment: Alignment.centerLeft,
                child: Text('TraeCodeTraeCodeTraeCode', softWrap: false),
              ),
            ),
            const SizedBox(height: 28),
            _section('层叠角标'),
            const SizedBox(height: 8),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [_avatar(), const SizedBox(width: 32), const _Cover()],
            ),
            const SizedBox(height: 28),
            _section('容器美化'),
            const SizedBox(height: 8),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [_card(), const SizedBox(width: 24), _statCard()],
            ),
          ],
        ),
      ),
    );
  }

  Widget _section(String text) => Text(
    text,
    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
  );

  Widget _flexRow(Widget? middle) {
    return SizedBox(
      width: 500,
      child: Row(
        children: [
          Expanded(flex: 2, child: _pane('2', null)),
          const SizedBox(width: 6),
          Expanded(flex: 1, child: _pane('1', middle)),
          const SizedBox(width: 6),
          Expanded(flex: 1, child: _pane('1', null)),
        ],
      ),
    );
  }

  Widget _pane(String label, Widget? content) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.teal.shade50,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 12, color: Colors.black54),
          ),
          ?content,
        ],
      ),
    );
  }

  Widget _avatar() {
    return Stack(
      children: [
        const CircleAvatar(
          radius: 28,
          backgroundColor: Colors.teal,
          child: Text('胡', style: TextStyle(fontSize: 20, color: Colors.white)),
        ),
        Positioned(
          right: 0,
          bottom: 0,
          child: Container(
            width: 12,
            height: 12,
            decoration: BoxDecoration(
              color: Colors.green,
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 2),
            ),
          ),
        ),
      ],
    );
  }

  Widget _card() {
    return Container(
      width: 240,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, 2)),
        ],
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 28,
            backgroundColor: Colors.teal,
            child: Text(
              '胡',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
          SizedBox(height: 12),
          Text(
            '胡矿',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 4),
          Text('移动应用开发教师', style: TextStyle(color: Colors.black54)),
        ],
      ),
    );
  }

  Widget _statCard() {
    return Container(
      width: 240,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, 2)),
        ],
      ),
      child: const Row(
        children: [
          Expanded(child: _Stat('12', '讲义')),
          VerticalDivider(width: 1, color: Colors.black12),
          Expanded(child: _Stat('50', '题库')),
          VerticalDivider(width: 1, color: Colors.black12),
          Expanded(child: _Stat('3', '阶段')),
        ],
      ),
    );
  }
}

class _Cover extends StatelessWidget {
  const _Cover();

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: SizedBox(
        width: 300,
        height: 150,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Container(color: Colors.teal.shade700),
            Positioned(
              top: 8,
              right: 8,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: Colors.teal,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: const Text(
                  'NEW',
                  style: TextStyle(fontSize: 10, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Stat extends StatelessWidget {
  final String number;
  final String label;

  const _Stat(this.number, this.label);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          number,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Text(
          label,
          style: const TextStyle(fontSize: 12, color: Colors.black54),
        ),
      ],
    );
  }
}
