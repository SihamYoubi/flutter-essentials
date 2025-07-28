import 'package:flutter/material.dart';
import 'package:flutter_essentials/provider/insta_provider.dart';
import 'package:provider/provider.dart';
import 'pages/home_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/todo_bloc.dart';
import 'provider/counter_state.dart';

void main() {
  runApp(const FlutterEssentialsApp());
}

class FlutterEssentialsApp extends StatelessWidget {
  const FlutterEssentialsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CounterState()),
        ChangeNotifierProvider(create: (_) => InstaProvider()),
        BlocProvider(create: (_) => TodoBloc()),


      ],
      child: MaterialApp(
        title: 'Flutter Essentials',
        theme: ThemeData(
          primarySwatch: Colors.deepOrange,
        ),
        home: const HomePage(),
        debugShowCheckedModeBanner: false,

      ),
    );
  }
}
