import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_flutter/models/data.dart';

// untuk connect ke firebase
class DataService {
  CollectionReference c = FirebaseFirestore.instance.collection("user");

// ambil data dari firebase
  Stream<QuerySnapshot> getAllData() {
    return c.snapshots();
  }

  void addData(Data d) {
    Map<String, dynamic> json = {
      "nama": d.nama,
      "email": d.email,
      "password": d.password,
      "confirmpassword": d.confirmpassword,
      "gender": d.gender,
      "birth": d.birth,
    };
    c.add(json);
  }
}
