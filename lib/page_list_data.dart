import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_flutter/services/data_service.dart';

class ListDataWidget extends StatefulWidget {
  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<ListDataWidget> {
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
        title: Text("List Data"),
        centerTitle: true,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: svc.getAllData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var allData = snapshot.data.docs;
            return ListView(
              children: allData.map((dt) {
                var isi = dt.data();
                return Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  height: 125,
                  width: double.maxFinite,
                  child: Card(
                      elevation: 5,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(10, 25, 20, 10),
                        child: Column(
                          children: [
                            Text(isi["nama"]),
                            Text(isi["email"]),
                            Text(isi["birth"]),
                          ],
                        ),
                      )),
                  // title: Text(isi["nopolisi"]),
                  // subtitle: Text(isi["merk"]),
                );
              }).toList(),
            );
          } else if (snapshot.hasError) {
            return Center(child: Text("Please try again"));
          } else {
            return Center(child: LinearProgressIndicator());
          }
        },
      ),
    );
  }
}
