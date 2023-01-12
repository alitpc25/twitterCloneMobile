import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_twitter_clone/http_service.dart';
import 'package:flutter_twitter_clone/pages/register.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "TwitterClone",
      home: Scaffold(
        appBar: AppBar(
          title: const Center(child: Icon(FontAwesomeIcons.twitter)),
        ),
        body: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 100,
                ),
                Text("Welcome to Twitter",
                    style: GoogleFonts.raleway(
                        textStyle: Theme.of(context).textTheme.headline4,
                        fontSize: 32,
                        fontWeight: FontWeight.w300,
                        fontStyle: FontStyle.italic,
                        color: Colors.black)),
                const MyCustomForm()
              ]),
        ),
      ),
    );
  }
}

// Create a Form widget.
class MyCustomForm extends StatefulWidget {
  const MyCustomForm({super.key});

  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

// Create a corresponding State class.
// This class holds data related to the form.
class MyCustomFormState extends State<MyCustomForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();
  var map = <String, dynamic>{};
  final HttpService httpService = HttpService();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Container(
      margin: const EdgeInsets.only(left: 30.0, top: 50.0, right: 30.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              // The validator receives the text that the user has entered.
              decoration: const InputDecoration(
                labelText: 'Username',
                contentPadding: EdgeInsets.symmetric(vertical: 0.0),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                } else if (value.length < 6) {
                  return 'Username must be longer.';
                }
                map["username"] = value;
                return null;
              },
            ),
            const SizedBox(height: 20),
            TextFormField(
              // The validator receives the text that the user has entered.
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password',
                contentPadding: EdgeInsets.symmetric(vertical: 0.0),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                map["password"] = value;
                return null;
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    try {
                      httpService.loginUser(map, context);
                    } catch (e) {
                      print(e);
                    }
                  }
                },
                child: const Text('Login'),
              ),
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: const TextStyle(fontSize: 15, color: Colors.blue),
              ),
              onPressed: () {
                Route route =
                    MaterialPageRoute(builder: (context) => Register());
                Navigator.pushReplacement(context, route);
              },
              child: const Text("Don't have an account?"),
            ),
          ],
        ),
      ),
    );
  }
}
