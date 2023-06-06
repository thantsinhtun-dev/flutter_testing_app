import 'package:flutter/material.dart';
import 'package:flutter_testing_app/screens/favourites.dart';
import 'package:flutter_testing_app/screens/home.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'models/favourites.dart';

void main() {
  runApp(const TestingApp());
}
final _router = GoRouter(
  routes: [
    GoRoute(
      path: HomePage.routeName,
      builder: (context, state) {
        return const HomePage();
      },
      routes: [
        GoRoute(
          path: FavouritePage.routeName,
          builder: (context, state) {
            return const FavouritePage();
          },
        ),
      ],
    ),
  ],
);
class TestingApp extends StatelessWidget {
  const TestingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Favourites>(
      create: (context) => Favourites(),
      child: MaterialApp.router(
        title: 'Testing Sample',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          useMaterial3: true,
        ),
        routerConfig: _router,
      ),
    );
  }
}