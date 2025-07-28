import 'package:flutter/material.dart';
import 'first_screen.dart';
import 'todo_page.dart';
import 'counter_page.dart';
import 'insta_page.dart';
import 'users_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Flutter Essentials")),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              customButton(
                context,
                label: " Gestion des utilisateurs",
                page: const UsersPage(),
              ),
              customButton(
                context,
                label: " Counter avec Provider",
                page: const CounterPage(),
              ),
              customButton(
                context,
                label: " Mini Instagram App (Provider)",
                page: const InstaPage(),
              ),
              customButton(
                context,
                label: " To-Do List avec BLoC",
                page: const TodoPage(),
              ),
              customButton(
                context,
                label: " Navigation push/pop",
                page: const FirstScreen(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget customButton(BuildContext context, {required String label, required Widget page}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: SizedBox(
        width: 250, // largeur fixe
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => page),
            );
          },
          child: Text(label, textAlign: TextAlign.center),
        ),
      ),
    );
  }
}
