import 'package:appointment_app/screens/tabs.dart';
import 'package:provider/provider.dart';
import '../providers/patients.dart';
import '../providers/medical_history.dart';
import 'package:flutter/material.dart';

class PatientScreen extends StatefulWidget {
  static const routeName = 'patient-screen';
  const PatientScreen({Key? key}) : super(key: key);

  @override
  State<PatientScreen> createState() => _PatientScreenState();
}

class _PatientScreenState extends State<PatientScreen> {
  var _isLoading = false;
  @override
  void initState() {
    Future.delayed(Duration.zero).then((value) async {
      setState(() {
        _isLoading = true;
      });
      await Provider.of<Patients>(context, listen: false).findbyID();
      await Provider.of<Medical>(context, listen: false).findbyID();
      setState(() {
        _isLoading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String id = ModalRoute.of(context)!.settings.arguments.toString();

    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 224, 130),
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height * 0.65 - 10,
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: AssetImage('images/screen1.jpg'),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.elliptical(
                      MediaQuery.of(context).size.width,
                      170,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                height: MediaQuery.of(context).size.height * .35 - 20,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(children: <Widget>[
                  const Text(
                    'Health App',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'App that monitors your Medical history and lets you make an appointment.',
                    style: TextStyle(fontSize: 18),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => TabsScreen(id)));
                          },
                          style: ElevatedButton.styleFrom(
                            primary: const Color(0xff7fc2ec),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                            elevation: 5,
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(12),
                            child: Text(
                              'View Details',
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/make-appointment');
                          },
                          style: ElevatedButton.styleFrom(
                            primary: const Color(0xff7fc2ec),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                            elevation: 5.0,
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(12),
                            child: Text(
                              'Make Appointment',
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ]),
              )
            ],
          ),
        ));
  }
}
