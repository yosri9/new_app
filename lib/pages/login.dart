import 'package:flutter/material.dart';
import 'package:news_app/api/authentication_api.dart';
import 'package:news_app/screens/homescreen.dart';
class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey=GlobalKey<FormState>();
  AuthenticationApi authenticationApi=AuthenticationApi();
  bool isLoading=false ;
  bool loginError=false;
  TextEditingController _usernameController;
  TextEditingController _passwordController;
  String username;
  String password;
  @override
  void initState() {
    super.initState();
    _usernameController=TextEditingController();
    _passwordController=TextEditingController();
  }
  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('LOGIN'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child:(isLoading) ? _drawLoading() : _drawLoginForm() ,
      ),
    );
  }

  Widget _drawLoginForm(){
    if (loginError) {
       return Container(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Login Error'),
              RaisedButton(
                  onPressed: (){
                    setState(() {
                      loginError=false;
                    });
                  },
                  child: Text(
                    'try Again',
                    style: TextStyle(
                      color: Colors.white
                    )
                    ,)
                ,)
            ],
          ),
        ),
      );
    }else {
      return Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              controller: _usernameController,
                decoration: InputDecoration(
                  labelText: 'Username',
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter your username';
                  } else {
                    return null;
                  }
                }
            ),
            SizedBox(height: 48,),
            TextFormField(
                controller:_passwordController ,
                decoration: InputDecoration(
                    labelText: 'Password'
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter your password';
                  } else {
                    return null;
                  }
                }
            ),
            SizedBox(height: 48,),
            SizedBox(
                width: double.infinity,
                child: RaisedButton(
                  onPressed: () async {
                    if (_formKey.currentState.validate()) {
                      //TODO : Call Api for Login
                      setState(() {
                        isLoading = true;
                      }
                      );
                      username=_passwordController.value.text;
                      password=_passwordController.value.text;

                      var response = await authenticationApi.login(
                         username, password);
                      if (response) {
                        Navigator.push(
                            context, MaterialPageRoute(builder: (context) {
                          return homescreen();
                        }
                        )
                        );
                      } else {
                        loginError = true;
                      }
                      setState(() {
                        isLoading = false;
                      });
                    } else {
                      setState(() {
                        isLoading = false;
                      }
                      );
                    }
                  },
                  child: Text(
                    'LOGIN',
                    style: TextStyle(
                        color: Colors.white
                    ),
                  ),
                  color: Colors.red,
                )

            )

          ],
        ),
      );
    }
  }
  Widget _drawLoading(){
      return Container(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );

    }
  }


