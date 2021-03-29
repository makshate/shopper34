import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_shopper/common/theme.dart';
import 'package:provider_shopper/models/cart.dart';
import 'package:provider_shopper/models/catalog.dart';
import 'package:provider_shopper/screens/cart.dart';
import 'package:provider_shopper/screens/catalog.dart';
import 'package:provider_shopper/screens/Эхеверия.dart';
import 'package:provider_shopper/screens/Адромискус.dart';
import 'package:provider_shopper/screens/Хавортия.dart'; //импорт страниц

void main() {
  runApp(MyApp());
}
//проверка корзины на пустоту
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (context) => CatalogModel()),
        ChangeNotifierProxyProvider<CatalogModel, CartModel>(
          create: (context) => CartModel(),
          update: (context, catalog, cart) {
            if (cart == null) throw ArgumentError.notNull('cart');
            cart.catalog = catalog;
            return cart;
          },
        ),
      ],
      //тело
      child: MaterialApp(
        title: 'Provider Demo',
        debugShowCheckedModeBanner: false,
        theme: appTheme,
        initialRoute: '/', //начальный путь
        routes: { //навигация
          '/': (context) => MyCatalog(),
          '/cart': (context) => MyCart(),
          '/Эхеверия': (context) => MyAbout(),
          '/Адромискус': (context) => MyAbout2(),
          '/Хавортия': (context) => MyAbout3(),
        },
      ),
    );
  }
}
