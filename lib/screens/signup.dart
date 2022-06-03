import 'package:appointment_app/providers/auth.dart';
import 'package:appointment_app/screens/edit_user_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatefulWidget {
  static const routeName = '/sign-up';
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final List<String> _values = ['Doctor', 'Patient', 'Pharmacist']; // Option 2
  String? _selectedvalue;
  final GlobalKey<FormState> _formkey = GlobalKey();
  final _passwordController = TextEditingController();
  var _isLoading = false;
  final Map<String, String> _authData = {
    'email': '',
    'password': '',
    'usertype': ''
  };

  Future<void> _submit() async {
    //print('11111');
    if (!_formkey.currentState!.validate()) return;
    _formkey.currentState!.save();
    setState(() {
      _isLoading = true;
    });
    //print('11111');
    final response = await Provider.of<Auth>(context, listen: false).signup(
        _authData['email'].toString(),
        _authData['password'].toString(),
        _authData['usertype'].toString());
    Navigator.of(context).pushNamed(EditUserScreen.routeName);
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
          decoration: const BoxDecoration(color: Colors.white),
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
                'Sign Up',
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
                            return null;
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
                              return 'Password is too short';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _authData['password'] = value.toString();
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
                            hintText: 'Confirm Password',
                          ),
                          obscureText: true,
                          validator: (value) {
                            if (value != _passwordController.text) {
                              return 'Passwords do not match!';
                            }
                            return null;
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
                          border: Border.all(color: Colors.black, width: 3),
                        ),
                        width: double.infinity,
                        height: 52,
                        child: DropdownButtonHideUnderline(
                          child: ButtonTheme(
                            alignedDropdown: true,
                            child: DropdownButton(
                              isExpanded: true,
                              icon: const Icon(
                                IconData(0xf82b, fontFamily: 'MaterialIcons'),
                                size: 35,
                              ),
                              hint: SizedBox(
                                width: 300,
                                child: const Text('Select One'),
                              ),
                              value: _selectedvalue,
                              onChanged: (newValue) {
                                setState(() {
                                  _selectedvalue = newValue.toString();
                                  _authData['usertype'] = newValue.toString();
                                });
                              },
                              items: _values.map((location) {
                                return DropdownMenuItem(
                                  child: Container(child: Text(location)),
                                  value: location,
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 35),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal:
                              (MediaQuery.of(context).size.width - 343) / 2),
                      child: SizedBox(
                        width: double.infinity,
                        height: 52,
                        child: TextButton(
                          onPressed: () {
                            _submit();
                          },
                          child: Text('NEXT',
                              style: GoogleFonts.roboto(color: Colors.white)),
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.black)),
                        ),
                      ),
                    ),
                  ],
                )),
          ]),
        ),
      ),
    );
  }
}
