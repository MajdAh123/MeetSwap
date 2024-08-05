import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:meetswap/App/Home/Bindings/HomeBindings.dart';
import 'package:meetswap/App/Home/View/HomePageView.dart';
import 'package:meetswap/App/SignUp/Controller/SignUpController.dart';
import 'package:meetswap/Constant/Colors.dart';
import 'App/SignUp/View/SignUpViewPage.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: null, // navigation bar color
    statusBarColor: Colors.transparent, // status bar color
  ));

  Get.put(SignUpController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          textTheme: const TextTheme(
            bodyLarge: TextStyle(fontFamily: 'SFPRODISPLAY'),
            bodyMedium: TextStyle(fontFamily: 'SFPRODISPLAY'),
            bodySmall: TextStyle(fontFamily: 'SFPRODISPLAY'),
            // bodyText1: TextStyle(fontFamily: 'SFPRODISPLAY'),
            // bodyText2: TextStyle(fontFamily: 'SFPRODISPLAY'),
            // button: TextStyle(fontFamily: 'SFPRODISPLAY'),
            displayLarge: TextStyle(fontFamily: 'SFPRODISPLAY'),
            displayMedium: TextStyle(fontFamily: 'SFPRODISPLAY'),
            displaySmall: TextStyle(fontFamily: 'SFPRODISPLAY'),
            // headline1: TextStyle(fontFamily: 'SFPRODISPLAY'),
            // headline2: TextStyle(fontFamily: 'SFPRODISPLAY'),
            headlineLarge: TextStyle(fontFamily: 'SFPRODISPLAY'),
            headlineMedium: TextStyle(fontFamily: 'SFPRODISPLAY'),
            headlineSmall: TextStyle(fontFamily: 'SFPRODISPLAY'),
            labelMedium: TextStyle(fontFamily: 'SFPRODISPLAY'),
            labelLarge: TextStyle(fontFamily: 'SFPRODISPLAY'),
            labelSmall: TextStyle(fontFamily: 'SFPRODISPLAY'),
            // overline: TextStyle(fontFamily: 'SFPRODISPLAY'),
            // subtitle1: TextStyle(fontFamily: 'SFPRODISPLAY'),
            // subtitle2: TextStyle(fontFamily: 'SFPRODISPLAY'),
            titleLarge: TextStyle(fontFamily: 'SFPRODISPLAY'),
            titleMedium: TextStyle(fontFamily: 'SFPRODISPLAY'),
            titleSmall: TextStyle(fontFamily: 'SFPRODISPLAY'),
            // headline3: TextStyle(fontFamily: 'SFPRODISPLAY'),
            // headline4: TextStyle(fontFamily: 'SFPRODISPLAY'),
            // headline5: TextStyle(fontFamily: 'SFPRODISPLAY'),
            // headline6: TextStyle(fontFamily: 'SFPRODISPLAY'),
            // caption: TextStyle(fontFamily: 'SFPRODISPLAY'),
          ),

          // This is the theme of your application.
          //
          // TRY THIS: Try running your application with "flutter run". You'll see
          // the application has a purple toolbar. Then, without quitting the app,
          // try changing the seedColor in the colorScheme below to Colors.green
          // and then invoke "hot reload" (save your changes or press the "hot
          // reload" button in a Flutter-supported IDE, or press "r" if you used
          // the command line to start the app).
          //
          // Notice that the counter didn't reset back to zero; the application
          // state is not lost during the reload. To reset the state, use hot
          // restart instead.
          //
          // This works for code too, not just values: Most code changes can be
          // tested with just a hot reload.
          colorScheme: ColorScheme.fromSeed(seedColor: AppColor.primaryColor),
          useMaterial3: true,
          scaffoldBackgroundColor: Colors.transparent),
      home: const SignUpView(),
      // initialBinding: HomeBinding()
    );
  }
}
