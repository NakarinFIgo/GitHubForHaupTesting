import 'package:flutter/material.dart';

class Sidebar extends StatelessWidget {
  final Function(String) onLanguageChanged;

  const Sidebar({super.key, required this.onLanguageChanged});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: const Text(
              "Nakarin Wangkit",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            accountEmail: const Text("Wangkit.nakarin@gmail.com"),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.network(
                  "https://images.unsplash.com/photo-1579168765467-3b235f938439?q=80&w=1288&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                  width: 98,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  "https://images.unsplash.com/photo-1497250681960-ef046c08a56e?q=80&w=1287&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                ),
                fit: BoxFit.cover,
              ),
            ),
         ),
          const ListTile(
            leading: Icon(Icons.language),
            title: Text("Language"),
          ),
          const Divider(
            height: 1,
            color: Color.fromARGB(255, 222, 220, 220),
          ),
          ListTile(
            title: const Text("ไทย"),
            onTap: () {
              onLanguageChanged("th");
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text("English"),
            onTap: () {
              onLanguageChanged("en");
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
