import 'package:flutter/material.dart';
import 'package:my_flutter/services/data_service.dart';

class HomeWidget extends StatefulWidget {
  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  TextEditingController tNama = TextEditingController();
  TextEditingController tEmail = TextEditingController();
  TextEditingController tPassword = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();
  TextEditingController tGender = TextEditingController();
  TextEditingController tBirth = TextEditingController();

  DataService svc = DataService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Rizal Akbar D"),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Center(
                  child: Text("Rizal Akbar Dewangga",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white))),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text('Add Data'),
              onTap: () {
                Navigator.pushNamed(context, "page_add_data");
              },
            ),
            Divider(),
            ListTile(
              title: Text('List Data'),
              onTap: () {
                Navigator.pushNamed(context, "page_list_data");
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Text(
          "Maimaid.id",
          style: TextStyle(
            fontSize: 28,
            color: Colors.blue,
          ),
        ),
      ),
    );
  }
}
