import 'package:device_preview/device_preview.dart';
import 'package:flutter/cupertino.dart';
import 'screens/todo_list_page.dart';
import 'screens/profile_page.dart';

void main() => runApp(
      DevicePreview(
        enabled: true,
        builder: (context) => const TodoApp(),
      ),
    );

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      debugShowCheckedModeBanner: false,
      theme: CupertinoThemeData(brightness: Brightness.light),
      home: MainTabScreen(),
    );
  }
}

class MainTabScreen extends StatelessWidget {
  const MainTabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.list_bullet), label: 'Görevler'),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.person), label: 'Profil'),
        ],
      ),
      tabBuilder: (context, index) {
        return index == 0 ? const TodoListPage() : const ProfilePage();
      },
    );
  }
}