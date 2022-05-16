import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../providers/auth.dart';

class LogInScreen extends StatefulWidget {
  static const routeName = '/log-in';
  const LogInScreen({Key? key}) : super(key: key);

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final GlobalKey<FormState> _formkey = GlobalKey();
  List<String> _values = ['Doctor', 'Patient', 'Pharmacist'];
  final _passwordController = TextEditingController();
  var _isLoading = false;
  Map<String, String> _authData = {'email': '', 'password': '', 'usertype': ''};

  Future<void> _submit() async {
    if (!_formkey.currentState!.validate()) return;
    _formkey.currentState!.save();
    setState(() {
      _isLoading = true;
    });
    final response = await Provider.of<Auth>(context, listen: false).login(
      _authData['email'].toString(),
      _authData['password'].toString(),
    );
    setState(() {
      _isLoading = false;
    });
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          iconSize: 30,
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            IconData(0xf571,
                fontFamily: 'MaterialIcons', matchTextDirection: true),
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(color: Colors.white),
          height: MediaQuery.of(context).size.height -
              (MediaQuery.of(context).padding.top + 100),
          child: Column(children: [
            const SizedBox(height: 40),
            Container(
              //decoration: BoxDecoration(color: Colors.red),
              padding: EdgeInsets.only(
                  left: (MediaQuery.of(context).size.width - 343) / 2),
              width: double.infinity,
              child: Text(
                'Log in',
                style: GoogleFonts.comfortaa(fontSize: 40),
              ),
            ),
            const SizedBox(height: 15),
            Form(
                key: _formkey,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal:
                              (MediaQuery.of(context).size.width - 343) / 2),
                      child: Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            border: Border.all(color: Colors.black, width: 3)),
                        width: double.infinity,
                        height: 52,
                        child: TextFormField(
                          decoration: const InputDecoration(
                            prefix: SizedBox(width: 15),
                            border: InputBorder.none,
                            hintText: 'Email',
                          ),
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value!.isEmpty || !value.contains('@')) {
                              return 'Invalid Email';
                            }
                          },
                          onSaved: (value) {
                            _authData['email'] = value.toString();
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal:
                              (MediaQuery.of(context).size.width - 343) / 2),
                      child: Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            border: Border.all(color: Colors.black, width: 3)),
                        width: double.infinity,
                        height: 52,
                        child: TextFormField(
                          decoration: const InputDecoration(
                            prefix: SizedBox(width: 15),
                            border: InputBorder.none,
                            hintText: 'Password',
                          ),
                          obscureText: true,
                          controller: _passwordController,
                          validator: (value) {
                            if (value!.isEmpty || value.length < 6) {
                              return 'Password is too short!';
                            }
                          },
                          onSaved: (value) {
                            _authData['password'] = value.toString();
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 35),
                    if (_isLoading)
                      CircularProgressIndicator()
                    else
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal:
                                (MediaQuery.of(context).size.width - 343) / 2),
                        child: Container(
                          width: double.infinity,
                          height: 52,
                          child: TextButton(
                            onPressed: () {
                              _submit();
                            },
                            child: Text('LOG IN',
                                style: GoogleFonts.roboto(color: Colors.white)),
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.black)),
                          ),
                        ),
                      ),
                  ],
                ))
          ]),
        ),
      ),
    );
  }
}
