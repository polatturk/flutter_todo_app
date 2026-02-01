import 'package:flutter/cupertino.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(middle: Text('Profil')),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(CupertinoIcons.person_crop_circle_fill, size: 80, color: CupertinoColors.systemGrey),
            SizedBox(height: 10),
            Text('Polat Türk', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Text('Junior Software Developer'),
          ],
        ),
      ),
    );
  }
}