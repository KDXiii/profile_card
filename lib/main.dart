import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(colorSchemeSeed: Colors.teal), // teal 种子主色
      home: const ProfileCardPage(),
    );
  }
}

class ProfileCardPage extends StatelessWidget {
  const ProfileCardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100, // 浅灰页面底，衬出白卡
      body: Center(
        // 卡片容器：宽340，内边距16，居中
        child: Container(
          width: 340,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white, // 白底
            borderRadius: BorderRadius.circular(12), // 圆角12
            boxShadow: const [
              BoxShadow(
                blurRadius: 8, // 阴影 blur 8
                offset: Offset(0, 2), // offset(0,2)
                color: Colors.black12,
              ),
            ],
          ),
          child: const Column(
            mainAxisSize: MainAxisSize.min, // 高度随内容收缩
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _Header(), // 头像区 + 姓名行
              SizedBox(height: 16),
              Divider(height: 1), // 统计条上分隔线
              SizedBox(height: 16),
              _StatsBar(), // 统计条
              SizedBox(height: 16),
              Divider(height: 1), // 统计条下分隔线
              SizedBox(height: 16),
              _TagCloud(), // 标签云
            ],
          ),
        ),
      ),
    );
  }
}

// 头像区 + 姓名行
class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          // 层叠角标：头像 + 右下在线点
          children: [
            CircleAvatar(
              radius: 28, // 56×56 圆形头像
              child: Text('胡', style: TextStyle(fontSize: 20)),
            ),
            Positioned(
              right: 0,
              bottom: 0,
              child: Container(
                width: 12,
                height: 12, // 12×12 在线点
                decoration: BoxDecoration(
                  color: Colors.green, // 绿色在线状态
                  shape: BoxShape.circle,
                  border: Border.fromBorderSide(
                    BorderSide(color: Colors.white, width: 2),
                  ), // 白边与头像隔开
                ),
              ),
            ),
          ],
        ),
        SizedBox(width: 12), // 头像右侧间距12
        Expanded(
          // Expanded 防溢出：姓名签名过长时省略号截断而非撑破 Row
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '胡矿',
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                '移动应用开发教师',
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: Colors.black54),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// 统计条：三等分
class _StatsBar extends StatelessWidget {
  const _StatsBar();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12), // 统计条内留白
      decoration: BoxDecoration(
        color: Colors.teal.shade50, // 浅 teal 纯色底
        borderRadius: BorderRadius.circular(8), // 圆角8
      ),
      child: const Row(
        children: [
          Expanded(
            child: _StatItem(number: '12', label: '讲义'),
          ),
          Expanded(
            child: _StatItem(number: '50', label: '题库'),
          ),
          Expanded(
            child: _StatItem(number: '3', label: '阶段'),
          ),
        ],
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final String number;
  final String label;

  const _StatItem({required this.number, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          number,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Text(label, style: const TextStyle(color: Colors.black54)),
      ],
    );
  }
}

// 标签云
class _TagCloud extends StatelessWidget {
  const _TagCloud();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8, // 横向间距8
      runSpacing: 6, // 纵向间距6
      children: const [
        Chip(label: Text('Flutter')),
        Chip(label: Text('Dart')),
        Chip(label: Text('TraeWork')),
        Chip(label: Text('TraeCode')),
      ],
    );
  }
}
