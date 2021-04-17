import 'package:date_time_picker/date_time_picker.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:flutter_dropdown/flutter_dropdown.dart';
import 'package:my_flutter/services/data_service.dart';
import 'models/data.dart';

class AddDataWidget extends StatefulWidget {
  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<AddDataWidget> {
  final _formKey = GlobalKey<FormState>();

  var isObscure = true;
  var _enabled = false;
  var pilihangender = ["Pria", "Wanita"];
  var gender = "Pria";

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
        title: Text("Add Data"),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                maxLength: 30,
                autofocus: true,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r"[a-zA-Z]+|\s")),
                ],
                validator: (isiNama) {
                  if (isiNama.isEmpty) {
                    return "Name is Required";
                  } else if (isiNama.length <= 2) {
                    return "Name Minimal 3 Characters";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: "Nama",
                  counterText: "",
                ),
                controller: tNama,
              ),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: "Email",
                  counterText: "",
                ),
                validator: (isiEmail) {
                  if (EmailValidator.validate(isiEmail) == false) {
                    return "Email is Invalid";
                  }
                  return null;
                },
                controller: tEmail,
              ),
              TextFormField(
                controller: tPassword,
                maxLength: 30,
                obscureText: isObscure,
                decoration: InputDecoration(
                  labelText: "Password",
                  counterText: "",
                ),
                validator: (isiPassword) {
                  if (isiPassword.isEmpty) {
                    return "Password is Required";
                  } else if (isiPassword.length <= 5) {
                    return "Password Minimal 6 Characters";
                  } else if (isiPassword
                          .contains(RegExp(r"(?=.*[A-Za-z][0-9])")) ==
                      false) {
                    return "Password Harus Terdapat Angka dan Huruf";
                  }

                  return null;
                },
              ),
              TextFormField(
                controller: confirmpassword,
                maxLength: 30,
                obscureText: isObscure,
                decoration: InputDecoration(
                  labelText: "Confirm Password",
                  counterText: "",
                  suffixIcon: GestureDetector(
                    child: Icon(Icons.remove_red_eye),
                    onTap: () {
                      setState(() {
                        isObscure = !isObscure;
                      });
                    },
                  ),
                ),
                validator: (val) {
                  if (val.isEmpty) return 'Confirm Your Password';
                  if (val != tPassword.text) return 'Password Not Match';
                  return null;
                },
              ),
              DropdownButton(
                hint: Text("Select Your Gender"),
                isExpanded: true,
                value: gender,
                onChanged: (value) {
                  setState(() {
                    gender = value;
                  });
                },
                items: pilihangender.map((value) {
                  return DropdownMenuItem(child: Text(value), value: value);
                }).toList(),
              ),
              DateTimePicker(
                controller: tBirth,
                firstDate: DateTime(1990),
                lastDate: DateTime(2022),
                dateLabelText: 'Date of Birth',
                onChanged: (val) => print(val),
                validator: (val) {
                  if (val.isEmpty) {
                    return "Date of Birth is Required";
                  }
                  print(val);
                  return null;
                },
                onSaved: (val) => print(val),
              ),
              Row(
                children: [
                  Checkbox(
                      value: _enabled,
                      onChanged: (value) {
                        setState(() {
                          _enabled = value;
                        });
                      }),
                  Text("I agree with term and conditions"),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    child: Text("Cancel"),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  ElevatedButton(
                    child: Text("Submit"),
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        Navigator.of(context).pop();
                        Data d = Data();
                        d.nama = tNama.text;
                        d.email = tEmail.text;
                        d.password = tPassword.text;
                        d.confirmpassword = confirmpassword.text;
                        d.gender = tGender.text;
                        d.birth = tBirth.text;

                        svc.addData(d);
                      }
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
