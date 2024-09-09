import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:hkcom/pages/cart_page.dart';
import 'package:hkcom/pages/product_list_page.dart';
import 'package:hkcom/pages/splash_screen.dart';
import 'package:hkcom/routing/app_route_constants.dart';

class MyAppRouter{
  final getStorage = GetStorage();
  static final GoRouter router = GoRouter(
    initialLocation: '/',
    debugLogDiagnostics: true,
    errorPageBuilder: (context,state){
      return const MaterialPage(child: Scaffold(body: Center(child: Text('Error page'),),));
    },
    routes: [
      // Splash Screen Route :
      GoRoute(
        name: MyAppRouteConstants.splashScreenRouteName,
        path: '/',
        pageBuilder: (context,state){
          debugPrint('config page : SplashScreen');
          return const MaterialPage(child: SplashScreen()); },
      ),
      // Home Page Route :
      GoRoute(
        name: MyAppRouteConstants.homeRouteName,
        path: '/home',
        pageBuilder: (context,state){
          debugPrint('config page : HomePage');
          return const MaterialPage(child: ProductListPage()); },
      ),
      GoRoute(
        path: '/cart',
        // path: '/cart/:products',
        name: MyAppRouteConstants.cartRouteName,
        pageBuilder: (context,state){
          debugPrint('config page : CartPage');
          // final List<ProductModel> products = state.pathParameters['products'] ?? '[]';
          return const MaterialPage(child: CartPage());
        },
      ),
    ],
  );
}