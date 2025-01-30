// import 'package:flutter/material.dart';
// import 'package:lift_up/view/login/login_view.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'LiftUP',
//       debugShowCheckedModeBanner: true,
//       theme: ThemeData(
//         fontFamily: "JetBrainsMonoNL",

//         colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 0, 0, 0)),
//         useMaterial3: true,
//       ),
//       home: const LoginView(),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:lift_up/view/home/home_view.dart';
import 'package:lift_up/view/login/login_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        '/': (context) => LoginView(),
        '/home': (context) => HomeView(),
      },
    );
  }
}

