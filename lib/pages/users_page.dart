import 'package:flutter/material.dart';
import '../db/user_database.dart';
import '../model/user.dart';

class UsersPage extends StatefulWidget {
  const UsersPage({super.key});

  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  List<User> users = [];
  final nameController = TextEditingController();
  final ageController = TextEditingController();

  @override
  void initState() {
    super.initState();
    refreshUsers();
  }

  Future refreshUsers() async {
    final data = await UserDatabase.getUsers();
    setState(() {
      users = data;
    });
  }

  Future addUser() async {
    final name = nameController.text;
    final age = int.tryParse(ageController.text);
    if (name.isNotEmpty && age != null) {
      await UserDatabase.insertUser(User(name: name, age: age));
      nameController.clear();
      ageController.clear();
      refreshUsers();
    }
  }

  Future deleteUser(int id) async {
    await UserDatabase.deleteUser(id);
    refreshUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Utilisateurs")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: "Nom"),
            ),
            TextField(
              controller: ageController,
              decoration: const InputDecoration(labelText: "Âge"),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: addUser,
              child: const Text("Ajouter un utilisateur"),
            ),
            const SizedBox(height: 20),
            const Text("Liste des utilisateurs :", style: TextStyle(fontWeight: FontWeight.bold)),
            Expanded(
              child: ListView.builder(
                itemCount: users.length,
                itemBuilder: (context, index) {
                  final user = users[index];
                  return ListTile(
                    title: Text("${user.name} (${user.age} ans)"),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () => deleteUser(user.id!),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
