import 'package:appointment_app/providers/appointments.dart';

import 'package:flutter_slidable/flutter_slidable.dart';
import '../screens/tabs.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/doctors.dart';

class DoctorScreen extends StatefulWidget {
  static const routeName = 'doctor-screen';
  const DoctorScreen({Key? key}) : super(key: key);

  @override
  State<DoctorScreen> createState() => _DoctorScreenState();
}

class _DoctorScreenState extends State<DoctorScreen> {
  var _isInit = true;
  @override
  void didChangeDependencies() {
    if (_isInit) {
      Provider.of<Doctors>(context, listen: false).findbyID();
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    DoctorData doc = Provider.of<Doctors>(context).doctor;
    Provider.of<Appointments>(context, listen: false).getappointments(doc.id);
    List<Appointment> availableAppointments =
        Provider.of<Appointments>(context).all;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Doctor Home Screen'),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Card(
            child: Slidable(
              child: Container(
                child: ListTile(
                  title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(availableAppointments[index].date),
                        Text(availableAppointments[index].time),
                      ]),
                  subtitle: Container(
                      margin: const EdgeInsets.all(15),
                      width: double.infinity,
                      child: Center(
                          child: Text(
                        availableAppointments[index].symptom,
                        style: const TextStyle(fontSize: 16),
                      ))),
                ),
              ),
              endActionPane:
                  ActionPane(motion: const ScrollMotion(), children: <Widget>[
                SlidableAction(
                  onPressed: (_) {},
                  label: "Cancel",
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  icon: const IconData(0xef28, fontFamily: 'MaterialIcons'),
                ),
                SlidableAction(
                  onPressed: (_) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TabsScreen(
                                availableAppointments[index].patientId)));
                  },
                  label: "Profile",
                  backgroundColor: const Color(0xFF7BC043),
                  foregroundColor: Colors.white,
                  icon: const IconData(0xf522, fontFamily: 'MaterialIcons'),
                ),
                SlidableAction(
                  onPressed: (_) {
                    Provider.of<Appointments>(context).deleteAppointment(index);
                    setState(() {});
                  },
                  backgroundColor: const Color(0xFF0392CF),
                  foregroundColor: Colors.white,
                  label: "Done",
                  icon: const IconData(0xf6d4, fontFamily: 'MaterialIcons'),
                ),
              ]),
            ),
          );
        },
        itemCount: availableAppointments.length,
      ),
    );
  }
}
