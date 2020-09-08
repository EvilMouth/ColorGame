import 'package:flutter/material.dart';

class ColorGameApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Color Game',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ColorGamePage(),
    );
  }
}

class ColorGamePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ColorGameState();
}

class _ColorGameState extends State<ColorGamePage> {
  final List<Map<String, Color>> colors = [
    {'黑': Colors.black},
    {'红': Colors.red},
    {'黄': Colors.yellow},
    {'蓝': Colors.blue},
    {'绿': Colors.green},
    {'紫': Colors.purple},
    {'橙': Colors.orange},
  ];
  Map<String, Color> _currentColor;

  @override
  void initState() {
    super.initState();
    _refreshColor();
  }

  _buildColorText() {
    final randomItem = _currentColor;
    final randomColor =
        (colors.where((element) => element != randomItem).toList()..shuffle())
            .first;
    return Text(
      randomItem.keys.first,
      style: TextStyle(
          color: randomColor.values.first,
          fontSize: 127,
          fontWeight: FontWeight.bold),
    );
  }

  _refreshColor() {
    setState(() {
      _currentColor = (colors.toList()..shuffle()).first;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Color Game')),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('游戏规则：1s内说出颜色'),
          ),
          Center(
            child: _buildColorText(),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _refreshColor,
        child: Icon(Icons.refresh),
      ),
    );
  }
}
