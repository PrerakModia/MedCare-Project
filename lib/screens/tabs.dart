import 'package:appointment_app/screens/edit_user_screen.dart';
import 'package:appointment_app/screens/patient_medicalhistory.dart';
import 'package:appointment_app/screens/patientdetails_screen.dart';
import 'package:flutter/material.dart';

class TabsScreen extends StatefulWidget {
  final String id;
  const TabsScreen(this.id, {Key? key}) : super(key: key);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  late List<Map<String, dynamic>> _pages;
  int indexx = 0;

  @override
  void initState() {
    _pages = [
      {'page': PatientDetails(), 'title': 'Patient Details'},
      {'page': MedicalHistoryPatient(widget.id), 'title': 'Medical Details'},
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(30.0),
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: Image.asset(
                      'images/screen-0.png',
                      height: 50,
                      width: 70,
                      //fit: BoxFit.,
                    ),
                  ),
                  Container(
                    width: 240,
                    alignment: Alignment.bottomLeft,
                    height: 50,
                    padding: const EdgeInsets.only(bottom: 3),
                    child: const Text(
                      'Medical Profile',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    height: 37,
                    width: MediaQuery.of(context).size.width - 310,
                    alignment: const Alignment(1.0, 1.0),
                    child: IconButton(
                      onPressed: () {
                        Navigator.of(context)
                            .pushNamed(EditUserScreen.routeName);
                      },
                      icon: Icon(IconData(0xe21a, fontFamily: 'MaterialIcons')),
                    ),
                  )
                ]),
          ),
        ),
      ),
      body: _pages[indexx]['page'],
      bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(IconData(0xe491, fontFamily: 'MaterialIcons')),
                label: 'Personal Details',
                backgroundColor: Colors.red),
            BottomNavigationBarItem(
                icon: Icon(IconData(0xe05a, fontFamily: 'MaterialIcons')),
                label: 'Medical History',
                backgroundColor: Colors.green),
          ],
          currentIndex: indexx,
          onTap: (ind) {
            setState(() {
              indexx = ind;
            });
          }),
    );
  }
}
