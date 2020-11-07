import 'package:farmers_market_web/routes.dart';
import 'package:farmers_market_web/screens/homepage.dart';
import 'package:farmers_market_web/services/firestore_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:farmers_market_web/blocs/auth_bloc.dart';
import 'package:farmers_market_web/blocs/product_bloc.dart';
import 'package:firebase_core/firebase_core.dart';

final authBloc = AuthBloc();
final productBloc = ProductBloc();
final firestoreService = FirestoreService();

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of of the application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      Provider(create: (context) => authBloc),
      Provider(create: (context) => productBloc),
      FutureProvider(create: (context) => authBloc.isLoggedIn()),
      StreamProvider(create: (context) => firestoreService.fetchUnitTypes())
    ], child: PlatformApp());
  }

  @override
  void dispose() {
    authBloc.dispose();
    super.dispose();
  }
}

class PlatformApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RafikiMarket',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: Scaffold(
          body: SafeArea(
              child: Scrollbar(
        thickness: 15,
        child: HomePage(),
      ))),
      onGenerateRoute: Routes.materialRoutes,
      debugShowCheckedModeBanner: false,
    );
  }

  Widget loadingScreen() {
    return Scaffold(body: Center(child: CircularProgressIndicator()));
  }
}