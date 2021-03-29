import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_shopper/models/cart.dart';

const mColor = Color(0xFF997B7B);
//тело
class MyCart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Корзина'),
        backgroundColor: Color(0xFF997B7B),
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(32),
                child: _CartList(),
              ),
            ),
            _CartTotal()
          ],
        ),
      ),
    );
  }
}

class _CartList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var cart = context.watch<CartModel>();
    return ListView.builder(
      itemCount: cart.items.length, //колво элементов
      itemBuilder: (context, index) => ListTile(
        leading: Container(child: cart.items[index].image), //картинка
        trailing: IconButton( //убрать из корзины
          icon: Icon(Icons.remove_circle_outline),
          onPressed: () {
            cart.remove(cart.items[index]);
          },
        ),
        title: Text(cart.items[index].name), //название цветка
      ),
    );
  }
}

class _CartTotal extends StatelessWidget { //купить
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<CartModel>(
                builder: (context, cart, child) => Text('\₽${cart.totalPrice}',//общая цена
                    style: TextStyle(fontSize: 24))),
            SizedBox(width: 24),
            TextButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Поздравляем с покупкой! nigga')));
              },
              child: Container( //описание кнопки
                decoration: BoxDecoration(
                  color: Color(0xFF997B7B),
                  borderRadius: BorderRadius.circular(16),
                ),
                margin: const EdgeInsets.only(left: 10, right: 10),
                padding: const EdgeInsets.only(
                    right: 50, left: 50, top: 15, bottom: 15),
                child: Text(
                  'Купить',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
