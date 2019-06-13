import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AuthPageState();
  }
}

class _AuthPageState extends State<AuthPage> {
  final Map<String, dynamic> _formData = {
    "email": null,
    "password": null,
    "acceptTerms": false
  };
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  DecorationImage _buildBackgroundImage() {
    return DecorationImage(
      fit: BoxFit.cover,
      image: AssetImage("assets/background.jpg"),
      colorFilter:
          ColorFilter.mode(Colors.grey.withOpacity(0.3), BlendMode.dstATop),
    );
  }

  Widget _buildEmailTextField() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: "Emial", filled: true, fillColor: Colors.white),
      keyboardType: TextInputType.emailAddress,
      onSaved: (String value) {
        _formData["email"] = value;
      },
      validator: (String value) {
        if (value.isEmpty ||
            !RegExp(r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_"
                    r"`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9]"
                    r"(?:[a-z0-9-]*[a-z0-9])?")
                .hasMatch(value)) {
          return "enter valid email address";
        }
      },
    );
  }

  Widget _buildPasswordTextField() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: "Password", filled: true, fillColor: Colors.white),
      obscureText: true,
      onSaved: (String value) {
        _formData["password"] = value;
      },
      validator: (String value) {
        if (value.isEmpty || value.length < 6) {
          return "enter valid password";
        }
      },
    );
  }

  Widget _buildAcceptSwitch() {
    return SwitchListTile(
      title: Text("Accept Terms"),
      value: _formData["acceptTerms"],
      onChanged: (bool value) {
        setState(() {
          _formData["acceptTerms"] = value;
        });
      },
    );
  }

  void _submitForm() {
    if (!_formKey.currentState.validate() || !_formData["acceptTerms"]) {
      return;
    }
    _formKey.currentState.save();
    print(_formData);
    Navigator.pushReplacementNamed(context, "/products");
  }

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double targetWidth = deviceWidth > 550.0 ? 500.0 : deviceWidth * 0.95;
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: _buildBackgroundImage(),
        ),
        padding: EdgeInsets.all(10.0),
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              width: targetWidth,
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    _buildEmailTextField(),
                    SizedBox(
                      height: 10.0,
                    ),
                    _buildPasswordTextField(),
                    _buildAcceptSwitch(),
                    SizedBox(
                      height: 10.0,
                    ),
                    RaisedButton(
                      textColor: Colors.white,
                      child: Text("LOGIN"),
                      onPressed: _submitForm,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
