import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MyForm());
}

class MyForm extends StatelessWidget{
  const MyForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const title = 'FormApp';

    return MaterialApp(
    title: title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: const MyCustomForm(),
      ),
    );
  }
}

class MyCustomForm extends StatefulWidget {
  const MyCustomForm({Key? key}) : super(key: key);

  @override
  MyCustomFormState createState(){
    return MyCustomFormState();
  }
}

class MyCustomFormState extends State<MyCustomForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            validator: (value) {
              if (value == 'Rohan') {
                return 'Hello Rohan and welcome to this App';
              }
              return 'Sorry';
            },
          ),
          Padding(padding: const EdgeInsets.symmetric(vertical: 15.0),
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Sorry, Wrong Data entered'))
                  );
                }
              },
              child: const Text('Enter'),
            ),
          )
        ],
      ),
    );
  }
}