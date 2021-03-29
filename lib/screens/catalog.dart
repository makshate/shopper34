import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_shopper/models/cart.dart';
import 'package:provider_shopper/models/catalog.dart';

const brColor = Color(0xFF997B7B);
//тело
class MyCatalog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _MyAppBar(),
          SliverToBoxAdapter(child: SizedBox(height: 12)),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                (context, index) => _MyListItem(index)),
          ),
        ],
      ),
    );
  }
}

class _AddButton extends StatelessWidget {
  final Item item;

  const _AddButton({required this.item, Key? key}) : super(key: key);

//проверка наличия в корзине
  @override
  Widget build(BuildContext context) {
    var isInCart = context.select<CartModel, bool>(
      (cart) => cart.items.contains(item),
    );

    return TextButton(
      onPressed: isInCart
          ? null //проверяет в корзине или нет
          : () {
              var cart = context.read<CartModel>();
              cart.add(item);
            },
      style: ButtonStyle(
        overlayColor: MaterialStateProperty.resolveWith<Color?>((states) {
          if (states.contains(MaterialState.pressed)) {
            return null;
          }
          return null;
        }),
      ),
      child: isInCart
          ? Icon(Icons.check, semanticLabel: 'Добавлено')
          : Container( //кнопка в корзину
              decoration: BoxDecoration(
                color: brColor,
                borderRadius: BorderRadius.circular(8),
              ),
              padding:
                  const EdgeInsets.only(right: 12, left: 12, top: 8, bottom: 8),
              child: Text(
                'В корзину',
                style: TextStyle(color: Colors.white),
              ),
            ),
    );
  }
}

class _MyAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: Text('Комнатные растения',
          style: TextStyle(fontSize: 24, color: Colors.black)),
      floating: true,
      backgroundColor: Color(0xFFFAFAFA),
      actions: [
        IconButton(
          icon: Icon(Icons.shopping_cart, color: Colors.black),
          onPressed: () => Navigator.pushNamed(context, '/cart'), //переход в корзину
        ),
      ],
    );
  }
}
//заполнение списка
class _MyListItem extends StatelessWidget {
  final int index;
  _MyListItem(this.index, {Key? key}) : super(key: key);
//получение элементов из models
  @override
  Widget build(BuildContext context) {
    var item = context.select<CatalogModel, Item>(
      (catalog) => catalog.getByPosition(index),
    );
//внешнее описание списка
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: LimitedBox(
        maxHeight: 48,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: Container(
                child: item.image,
              ),
            ),
            SizedBox(width: 24),
            InkWell(//переход на карточку растения
                onTap: () {
                  Navigator.pushNamed(context, '/' + item.name);
                },
                child: Text(item.name)),
            Text(' \u{2B50}  4,8'),
            SizedBox(width: 24),
            _AddButton(item: item),
          ],
        ),
      ),
    );
  }
}
