import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oktoast/oktoast.dart';
import 'package:verifik/app/config/app.dart';
import 'package:verifik/app/module.dart';
import 'package:verifik/app/utils/http/http_client.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await App.instance.init();

  runApp(
    ModularApp(
      module: AppModule(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  Widget build(BuildContext context) {
    return OKToast(
      child: MaterialApp.router(
        title: 'Verifik - Data Validation and KYC Solutions',
        theme: ThemeData(
          textTheme: GoogleFonts.nunitoSansTextTheme(
            Theme.of(context).textTheme,
          ),
        ),
        routeInformationParser: Modular.routeInformationParser,
        routerDelegate: Modular.routerDelegate,
        builder: (context, child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(
              textScaler: const TextScaler.linear(1.0),
            ),
            child: child ?? const SizedBox.shrink(),
          );
        },
      ),
    );
  }
}
