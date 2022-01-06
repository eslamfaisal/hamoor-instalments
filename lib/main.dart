import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:instalment/locator.dart';
import 'package:instalment/routs/app_router.dart';
import 'package:instalment/routs/routs_names.dart';
import 'package:instalment/services/navigation_service.dart';
import 'package:instalment/utils/colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  setupLocator();
  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('ar'),
      ],
      startLocale: const Locale('ar'),
      saveLocale: true,
      path: 'assets/translations',
      useOnlyLangCode: true,
      child: const MainPage(),
    ),
  );
}

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.white,
    ));
    return MaterialApp(
      locale: context.locale,
      supportedLocales: context.supportedLocales,
      localizationsDelegates: context.localizationDelegates,
      debugShowCheckedModeBanner: false,
      title: tr('app_name'),
      theme: ThemeData(
        primaryColor: primaryColor,
        primarySwatch: Colors.blue,
        fontFamily: 'uighur',
      ),
      initialRoute: RouteName.HOME,
      navigatorKey: locator<NavigationService>().navigatorKey,
      onGenerateRoute: AppRouter.generateRoute,
    );
  }
}
