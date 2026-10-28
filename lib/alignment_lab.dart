import 'package:flutter/material.dart';

void main() => runApp(const AlignmentLabApp());

class AlignmentLabApp extends StatelessWidget {
  const AlignmentLabApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(colorSchemeSeed: Colors.teal),
      home: const AlignmentLabPage(),
    );
  }
}

class _AlignCase {
  final String name;
  final MainAxisAlignment value;
  const _AlignCase(this.name, this.value);
}

class AlignmentLabPage extends StatelessWidget {
  const AlignmentLabPage({super.key});

  static const _cases = [
    _AlignCase('start', MainAxisAlignment.start),
    _AlignCase('center', MainAxisAlignment.center),
    _AlignCase('end', MainAxisAlignment.end),
    _AlignCase('spaceBetween', MainAxisAlignment.spaceBetween),
    _AlignCase('spaceAround', MainAxisAlignment.spaceAround),
    _AlignCase('spaceEvenly', MainAxisAlignment.spaceEvenly),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '固定 340 宽容器 + 3 个 40×28 方块',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(
              '用 Inspector 读每个方块的 x 坐标，验证主轴余量如何分配',
              style: TextStyle(color: Colors.black54),
            ),
            const SizedBox(height: 16),
            for (var i = 0; i < 6; i += 2)
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _CaseCell(index: i + 1, c: _cases[i]),
                    const SizedBox(width: 24),
                    _CaseCell(index: i + 2, c: _cases[i + 1]),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _CaseCell extends StatelessWidget {
  final int index;
  final _AlignCase c;

  const _CaseCell({required this.index, required this.c});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$index. ${c.name}',
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 2),
        Text(
          'MainAxisAlignment.${c.name}',
          style: const TextStyle(fontSize: 13, color: Colors.black54),
        ),
        const SizedBox(height: 6),
        Container(
          width: 340, // 定宽容器，余量才可测
          height: 48,
          padding: const EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisAlignment: c.value,
            children: const [_Block(), _Block(), _Block()],
          ),
        ),
      ],
    );
  }
}

class _Block extends StatelessWidget {
  const _Block();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 28,
      decoration: BoxDecoration(
        color: Colors.teal,
        borderRadius: BorderRadius.circular(6),
      ),
    );
  }
}
