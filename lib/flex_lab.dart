import 'package:flutter/material.dart';

void main() => runApp(const FlexLabApp());

class FlexLabApp extends StatelessWidget {
  const FlexLabApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(colorSchemeSeed: Colors.teal),
      home: const FlexLabPage(),
    );
  }
}

const _longText = 'TraeCodeTraeCodeTraeCode';

class FlexLabPage extends StatelessWidget {
  const FlexLabPage({super.key});

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
              '实验一　三栏 2:1:1（外层定宽 500）',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(
              '每栏内显示 Inspector 同级实测宽度，2:1:1 的余量分配一眼可读',
              style: TextStyle(color: Colors.black54),
            ),
            const SizedBox(height: 8),
            const _RatioRow(),
            const SizedBox(height: 24),
            const Text(
              '实验二　中间栏内容超长时的四种表现',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(
              '同样是 flex 1 的中间栏，只改一处处理方式',
              style: TextStyle(color: Colors.black54),
            ),
            const SizedBox(height: 8),
            const _VariantRow(
              label: '① 不处理：长串无空格，文字越界画到右栏上',
              child: Text(_longText, softWrap: false),
            ),
            const SizedBox(height: 12),
            const _VariantRow(
              label: '② overflow: ellipsis：截断加省略号，栏宽不变',
              child: Text(_longText, maxLines: 1, overflow: TextOverflow.ellipsis),
            ),
            const SizedBox(height: 12),
            const _VariantRow(
              label: '③ FittedBox(scaleDown)：整串等比缩小，内容完整',
              child: FittedBox(
                fit: BoxFit.scaleDown,
                alignment: Alignment.centerLeft,
                child: Text(_longText, softWrap: false),
              ),
            ),
            const SizedBox(height: 12),
            const _VariantRow(
              label: '④ 栏内放固定宽子项：超出约束，出黄黑条',
              child: Row(
                children: [
                  _FixedBlock(),
                  _FixedBlock(),
                  _FixedBlock(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _RatioRow extends StatelessWidget {
  const _RatioRow();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 500,
      child: Row(
        children: const [
          Expanded(flex: 2, child: _Cell(flex: 2)),
          SizedBox(width: 6),
          Expanded(flex: 1, child: _Cell(flex: 1)),
          SizedBox(width: 6),
          Expanded(flex: 1, child: _Cell(flex: 1)),
        ],
      ),
    );
  }
}

class _Cell extends StatelessWidget {
  final int flex;

  const _Cell({required this.flex});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.teal.shade50,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.teal.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'flex $flex',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 2),
          LayoutBuilder(
            builder: (context, cons) => Text(
              '实测 ${cons.maxWidth.round()}dp',
              style: const TextStyle(fontSize: 12, color: Colors.black54),
            ),
          ),
          const SizedBox(height: 6),
          Container(height: 10, color: Colors.teal),
        ],
      ),
    );
  }
}

class _VariantRow extends StatelessWidget {
  final String label;
  final Widget child;

  const _VariantRow({required this.label, required this.child});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontSize: 13)),
        const SizedBox(height: 4),
        SizedBox(
          width: 500,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Expanded(flex: 2, child: _SideCell('左栏 flex 2')),
              const SizedBox(width: 6),
              Expanded(flex: 1, child: _TargetCell(child)),
              const SizedBox(width: 6),
              const Expanded(flex: 1, child: _SideCell('右栏 flex 1')),
            ],
          ),
        ),
      ],
    );
  }
}

class _TargetCell extends StatelessWidget {
  final Widget child;

  const _TargetCell(this.child);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.teal.shade200),
      ),
      child: child,
    );
  }
}

class _SideCell extends StatelessWidget {
  final String text;

  const _SideCell(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.teal.shade50,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        text,
        style: const TextStyle(fontSize: 12, color: Colors.black54),
      ),
    );
  }
}

class _FixedBlock extends StatelessWidget {
  const _FixedBlock();

  @override
  Widget build(BuildContext context) {
    return Container(width: 60, height: 20, color: Colors.teal);
  }
}
