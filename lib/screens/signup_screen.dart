import 'package:flutter/material.dart';
import 'package:loja_virtual/models/user_model.dart';
import 'package:scoped_model/scoped_model.dart';

class SignUpScreen extends StatefulWidget {

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _nameController = TextEditingController();

  final _emailController = TextEditingController();

  final _passController = TextEditingController();

  final _addressController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      title: Text("Criar conta"),
      centerTitle: true,
    ),
    body: ScopedModelDescendant<UserModel>(
      builder: (context, child, model){
        if(model.isLoading)
          return Center(child: CircularProgressIndicator(),);
        return Form(
          key: _formKey,
          child: ListView(
            padding: EdgeInsets.all(16.0),
            children: <Widget>[
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  hintText: "Nome completo"
                ),
                validator: (text){
                  if(text.isEmpty) return "Nome inválido!";
                },
              ),
              SizedBox(height: 16.0,),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  hintText: "E-mail"
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (text){
                  if(text.isEmpty || !text.contains("@")) return "E-mail inválido!";
                },
              ),
              SizedBox(height: 16.0,),
              TextFormField(
                controller: _passController,
                decoration: InputDecoration(
                  hintText: "Senha"
                ),
                obscureText: true,
                validator: (text){
                  if(text.isEmpty || text.length < 6) return "Senha inválida!";
                },
              ),
              SizedBox(height: 16.0,),
              TextFormField(
                controller: _addressController,
                decoration: InputDecoration(
                  hintText: "Endereço"
                ),
                validator: (text){
                  if(text.isEmpty) return "Endereço inválida!";
                },
              ),
              SizedBox(height: 16.0,),
              SizedBox(
                height: 44.0,
                child: RaisedButton(
                  child: Text("Criar Conta",
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                  textColor: Colors.white,
                  color: Theme.of(context).primaryColor,
                  onPressed: (){
                    if(_formKey.currentState.validate()){

                      Map<String, dynamic> userData = {
                        "name": _nameController.text,
                        "email": _emailController.text,
                        "address": _addressController.text
                      };

                      model.signUp(
                        userData: userData, 
                        pass: _passController.text, 
                        onSucess: _onSucess, 
                        onFail: _onFail
                      );
                    }
                  },
                ),
              )
            ],
          ),
        );
      })
  );
  }
}

void _onSucess(){

}

void _onFail(){

}