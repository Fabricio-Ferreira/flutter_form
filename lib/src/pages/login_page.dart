import 'package:flutter/material.dart';
import 'package:flutter_form/src/models/user.dart';
import 'package:flutter_form/src/pages/home_page.dart';

class LoginPage extends StatefulWidget {

   final User user;
   LoginPage({this.user});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _phoneController = TextEditingController();
  final _namefocus = FocusNode();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text('FORMULÁRIO DE CADASTRO' ),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Padding(
          padding: const EdgeInsets.all(10),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextFormField(
                  textCapitalization: TextCapitalization.words,
                  controller: _nameController,
                  autofocus: true,
                  focusNode: _namefocus,
                  keyboardType: TextInputType.text,
                  style: new TextStyle(color: Colors.white, fontSize: 20.0),
                  decoration: InputDecoration(
                    icon: Icon(Icons.person_outline),
                    labelText: "Nome",
                    labelStyle: TextStyle(color: Colors.white, fontSize: 18.0),
                    hintText: 'Nome completo'
                  ),
                  onSaved: (value) => User().name = value,
                  validator: (value) => value.isEmpty 
                              ? "Nome não pode ser nulo"
                              : null,
                ),
                Divider(),
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  style: new TextStyle(color: Colors.white, fontSize: 20.0),
                  decoration: InputDecoration(
                    icon: Icon(Icons.email),
                    labelText: "Email",
                    labelStyle: TextStyle(color: Colors.white, fontSize: 18.0),
                    hintText: 'xxxx@xxx.com'
                  ),
                  onSaved: (value) => User().name = value,
                  validator: (value) => value.isEmpty 
                              ? "Email não pode ser nulo"
                              : null,
                ),
                Divider(),
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  keyboardType: TextInputType.text,
                  style: new TextStyle(color: Colors.white, fontSize: 20.0),
                  decoration: InputDecoration(
                    icon: Icon(Icons.security),
                    hintText: 'numeros, letras e caracteres',
                    labelText: "Senha",
                    labelStyle: TextStyle(color: Colors.white, fontSize: 20.0)
                  ),
                  onSaved: (value) => User().name = value,
                  validator: (value) => value.isEmpty 
                              ? "Senha não pode ser nula"
                              : null, 
                ),
                Divider(),
                TextFormField( 
                  maxLength: 11,
                  controller: _phoneController,
                  keyboardType: TextInputType.phone,
                  style: new TextStyle(color: Colors.white, fontSize: 20.0),
                  decoration: InputDecoration(
                    icon: Icon(Icons.phone),
                    hintText: '(xx) xxxxx - xxxx',
                    labelText: "Telefone",
                    labelStyle: TextStyle(color: Colors.white, fontSize: 20.0)
                  ),
                  onSaved: (value) => User().name = value,
                  validator: (value) => value.isEmpty 
                              ? "Telefone não pode ser nulo"
                              : null,
                ),
                Divider(),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ButtonTheme(
                      height: 45,
                      child: RaisedButton(
                        onPressed: () {
                          if(_formKey.currentState.validate()){
                            _formKey.currentState.save();
                            Navigator.push(
                              context, MaterialPageRoute(
                                builder: (context) => HomePage()));
                         }
                        },
                        child: Text('ENTRAR',
                          style: TextStyle(color: Colors.deepPurple),
                        ),
                        color: Colors.white,
                        
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    ButtonTheme(
                      height: 45,
                      child: RaisedButton(
                        onPressed: () { _limparCampos(); },
                        child: Text('CANCELAR',
                          style: TextStyle(color: Colors.deepPurple),
                        ),
                        color: Colors.white,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
     )
   );
  }
  void _limparCampos(){
    _emailController.text ="";
    _nameController.text="";
    _passwordController.text="";
    _phoneController.text="";
  }
}