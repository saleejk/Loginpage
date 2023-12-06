import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('HOME'),
          actions: [
            IconButton(
                onPressed: () {
                  signout(context);
                },
                icon: Icon(Icons.exit_to_app)),
          ],
        ),
        body: ListView.builder(
            itemCount: 30,
            itemBuilder: (BuildContext context, Index) {
              return ListTile(
                onTap: () {},
                leading: Icon(Icons.person_2_outlined),
                trailing: Icon(Icons.call),
                title: Text("person ${Index + 1}"),
              );
            }));
  }

  signout(BuildContext ctx) async {
    final _sharedprefs = await SharedPreferences.getInstance();
    await _sharedprefs.clear();

    Navigator.of(ctx).pushAndRemoveUntil(
        MaterialPageRoute(builder: (ctx) => ScreenLogin()), (route) => false);
  }
}
