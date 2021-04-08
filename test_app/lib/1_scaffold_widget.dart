import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScaffoldWidgetExample extends StatefulWidget {
  @override
  _ScaffoldWidgetExampleState createState() => _ScaffoldWidgetExampleState();
}

class _ScaffoldWidgetExampleState extends State<ScaffoldWidgetExample> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Scaffold Example'),
      ),
      body: Center(
        child: Text('We have pressed the button $_count times'),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Container(
          height: 50.0,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          setState(() {
            _count++;
          });
        },
      ),
      drawer: Drawer(
        elevation: 20.0,
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text('Vijay'),
              accountEmail: Text('vijay@gmail.com'),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.yellow,
                child: Text('abc'),
              ),
            ),
            ListTile(
              title: Text('Inbox'),
              leading: Icon(
                Icons.mail,
                color: Colors.cyan,
              ),
            ),
            Divider(
              height: 0.1,
            ),
            ListTile(
              title: Text('Primary'),
              leading: Icon(
                Icons.inbox,
                color: Colors.cyan,
              ),
            ),
            ListTile(
              title: Text('Social'),
              leading: Icon(
                Icons.people,
                color: Colors.cyan,
              ),
            ),
            ListTile(
              title: Text('Promotions'),
              leading: Icon(
                Icons.local_offer,
                color: Colors.cyan,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
