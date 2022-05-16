import 'package:appointment_app/screens/doctors_screen.dart';
import 'package:appointment_app/screens/patient_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final idController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Home Screen'),
        ),
      ),
      body: SizedBox(
        height:
            MediaQuery.of(context).size.height - AppBar().preferredSize.height,
        width: double.infinity,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width: MediaQuery.of(context).size.width * .9 / 2,
                height: 40,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(DoctorScreen.routeName);
                  },
                  child: const FittedBox(
                    child: Text(
                      "Doctor's Screen",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40),
              SizedBox(
                width: MediaQuery.of(context).size.width * .9 / 2,
                height: 40,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(PatientScreen.routeName);
                  },
                  child: const FittedBox(
                    child: Text(
                      "Patient's Screen",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ),
            ]),
      ),
    );
  }
}
