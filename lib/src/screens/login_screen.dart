import 'package:flutter/material.dart';
import '../mixins/validation_mixin.dart';

class LoginScreen extends StatefulWidget{
  @override
    State<StatefulWidget> createState() {
      return LoginScreenState();
    }
}

class LoginScreenState extends State<LoginScreen> with ValidationMixin{
  final formKey = GlobalKey<FormState>();

  String email ='';
  String password = '';

  Widget build(context){
    return Container(
      margin: EdgeInsets.all(20.0),
      child: Form(
        key: formKey,
        child: Column(
          children: <Widget>[
            emailField(),
            passwordField(),
            Container(margin: EdgeInsets.only(top: 25.0)),
            submit(),
          ],
        ),
      ),
    );
  }

  Widget emailField(){
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Enter Email Address',
        hintText: 'you@example.com',
      ),
      keyboardType: TextInputType.emailAddress,
      autofocus: true,
      validator: validateEmail,
      onSaved: (String value){
        email = value;
      },
    );
  }

  Widget passwordField(){
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Enter Password',
        hintText: 'Password',
      ),
      // obscureText: true,
      validator: validatePassword,
      onSaved: (String value){
        password = value;
      },
    );
  }

  Widget submit(){
    return RaisedButton(
      color: Colors.blue,
      child: Text('Submit'),
      onPressed: (){
        if(formKey.currentState.validate()){
          formKey.currentState.save();
          // take *both* password and email and post them to some API
          print('Time to post $email and $password to API');
        }
      },
    );
  }
}