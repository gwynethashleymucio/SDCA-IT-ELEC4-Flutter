import 'package:flutter/material.dart';

import '../utils/api.dart';

class RegisterScreen extends StatelessWidget {
  final _txtFirstNameController = TextEditingController();
  final _txtLastNameController = TextEditingController();
  final _txtEmailController = TextEditingController();
  final _txtPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    TextFormField txtFirstName = TextFormField(
      decoration: InputDecoration(labelText: 'First Name'),
      keyboardType: TextInputType.text,
      controller: _txtFirstNameController,
      textInputAction: TextInputAction.next
    );

    TextFormField txtLastName = TextFormField(
      decoration: InputDecoration(labelText: 'Last Name'),
      keyboardType: TextInputType.text,
      controller: _txtLastNameController,
      textInputAction: TextInputAction.next
    );

    TextFormField txtEmail = TextFormField(
      decoration: InputDecoration(labelText: 'Email Address'),
      keyboardType: TextInputType.emailAddress,
      controller: _txtEmailController,
      textInputAction: TextInputAction.next
    );

    TextFormField txtPassword = TextFormField(
      decoration: InputDecoration(labelText: 'Password'),
      obscureText: true,
      keyboardType: TextInputType.text,
      controller: _txtPasswordController,
      textInputAction: TextInputAction.done
    );

    Container btnSubmit = Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: 10.0),
      child: ElevatedButton(
        onPressed: () {
          API().register(
            firstName: _txtFirstNameController.text, 
            lastName: _txtLastNameController.text,
            email: _txtEmailController.text,
            password: _txtPasswordController.text
          ).then((value) {
            if (value == true) {
              const snackBar = SnackBar(content: Text('You have registered successfully'));
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
          });
        },
        child: Text('Submit')
      )
    );

    Container btnClear = Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: 10.0),
      child: ElevatedButton(
        onPressed: () {
          _txtFirstNameController.text = '';
          _txtLastNameController.text = '';
          _txtEmailController.text = '';
          _txtPasswordController.text = '';
        },
        child: Text('Clear')
      )
    );

    Form formRegister = Form(
      child: Column(
        children: [
          txtFirstName,
          txtLastName,
          txtEmail,
          txtPassword,
          btnSubmit,
          btnClear
        ]
      )
    );

    return Scaffold(
      appBar: AppBar(title: Text('Create Account')),
      body: Container(
        width: double.infinity,
        margin: EdgeInsets.only(top: 30.0, left: 10.0, right: 10.0),
        child: formRegister
      )
    );
  }
}