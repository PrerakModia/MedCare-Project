import 'package:appointment_app/widgets/emergency_details.dart';
import 'package:appointment_app/widgets/identification_details.dart';
import 'package:appointment_app/widgets/personal_detals.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/patients.dart';

class PatientDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final PatientData = Provider.of<Patients>(context).allPatients;
    print('hehe');
    return Container(
      decoration: BoxDecoration(color: Colors.grey[300]),
      height: MediaQuery.of(context).size.height,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            PersonalDetails(PatientData),
            EmergencyDetails(PatientData),
            IdentificationDetails(PatientData),
          ],
        ),
      ),
    );
  }
}
