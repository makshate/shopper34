import 'package:flutter/material.dart';

const gColor = Color(0xFFF5BA11);
const wColor = Color(0xFFFFFFFF);
const bColor = Color(0xFFAFAFAF);
const brColor = Color(0xFF997B7B);
const grColor = Color(0xffE7E7E7);

class MyAbout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget titleSection = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    'Эхеверия',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                ),
                Text(
                  ' \u{2B50}  4,8',
                  style: TextStyle(
                    color: gColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );

    Widget buttonSection = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FavoriteWidget(),
          _buildButtonColumn(wColor, 'Нет в наличии'),
        ],
      ),
    );

    Widget buttonSizeSection = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildSizeColumn(wColor, brColor, '18 см'),
          _buildSizeColumn(bColor, grColor, '20 см'),
          _buildSizeColumn(bColor, grColor, '24 см'),
          _buildSizeColumn(bColor, grColor, '30 см'),
        ],
      ),
    );

    Widget textSection = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    'Описание',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  'В домашних условиях эхеверия отлично себя чувствует и великолепно выглядит, а при должном уходе даже радует цветами.',
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );

    return MaterialApp(
      title: 'Flutter layout demo',
      home: Scaffold(
        body: ListView(
          children: [
            Image.asset(
              'images/Эхеверия.png',
              width: 375,
              height: 408,
              fit: BoxFit.cover,
            ),
            titleSection,
            buttonSizeSection,
            textSection,
            buttonSection,
          ],
        ),
      ),
    );
  }

  Column _buildSizeColumn(Color color, Color color2, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          decoration: BoxDecoration(
            color: color2,
            borderRadius: BorderRadius.circular(8),
          ),
          margin: const EdgeInsets.only(left: 10, right: 10),
          padding:
              const EdgeInsets.only(right: 12, left: 12, top: 8, bottom: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}

Column _buildButtonColumn(Color color, String label) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Container(
        decoration: BoxDecoration(
          color: const Color(0x99997B7B),
          borderRadius: BorderRadius.circular(16),
        ),
        margin: const EdgeInsets.only(bottom: 25),
        padding:
            const EdgeInsets.only(right: 50, left: 50, top: 15, bottom: 15),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w400,
            color: color,
          ),
        ),
      ),
    ],
  );
}

class FavoriteWidget extends StatefulWidget {
  @override
  _FavoriteWidgetState createState() => _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<FavoriteWidget> {
  bool _isFavorited = false;
  void _toggleFavorite() {
    setState(() {
      if (_isFavorited) {
        _isFavorited = false;
      } else {
        _isFavorited = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    const mColor = Color(0xFF997B7B);
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            color: const Color(0xffE7E7E7),
            borderRadius: BorderRadius.circular(16),
          ),
          padding: EdgeInsets.all(0),
          margin: const EdgeInsets.only(bottom: 25),
          child: IconButton(
            padding: EdgeInsets.all(0),
            alignment: Alignment.center,
            icon: (_isFavorited
                ? Icon(Icons.favorite)
                : Icon(Icons.favorite_border)),
            color: mColor,
            onPressed: _toggleFavorite,
          ),
        ),
        SizedBox(
          width: 24,
        ),
      ],
    );
  }
}
