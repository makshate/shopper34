import 'package:flutter/material.dart';

class CatalogModel {
  static List<String> itemNames = ['Адромискус', 'Эхеверия', 'Хавортия'];

  Item getById(int id) => Item(id, itemNames[id % itemNames.length]); //бесконечный скроллинг 
  Item getByPosition(int position) {
    return getById(position);
  }
}
//описание элементов
@immutable
class Item { //класс элемента
  final int id;
  final String name;
  final Image image;
  final int price = 1290;

  Item(this.id, this.name)
      : image = Image.asset(
          'images/' + name + '-preview.png',
          width: 113,
          height: 98,
        );

  @override
  int get hashCode => id;

  @override
  bool operator ==(Object other) => other is Item && other.id == id;
}
