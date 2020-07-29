import 'package:flutter/material.dart';
import 'package:flutter_provider_shopper/common/theme.dart';
import 'package:flutter_provider_shopper/models/cart.dart';
import 'package:flutter_provider_shopper/models/catalog.dart';
import 'package:flutter_provider_shopper/screens/cart.dart';
import 'package:flutter_provider_shopper/screens/catalog.dart';
import 'package:flutter_provider_shopper/screens/login.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (context) => CatalogModel()),
        ChangeNotifierProxyProvider<CatalogModel, CartModel>(
            create: (context) => CartModel(),
            update: (context, catalog, cart) {
              cart.catalog = catalog;
              return cart;
            })
      ],
      child: MaterialApp(
        title: 'Provider Demo',
        theme: appTheme,
        initialRoute: '/',
        routes: {
          '/': (context) => MyLogin(),
          '/catalog': (context) => MyCatalog(),
          '/cart': (context) => MyCart(),
        },
      ),
    );
  }
}
