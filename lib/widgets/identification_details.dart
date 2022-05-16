import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/patients.dart';

class IdentificationDetails extends StatelessWidget {
  final patient;
  const IdentificationDetails(this.patient, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      const SizedBox(height: 30),
      Container(
        padding: const EdgeInsets.only(left: 10),
        alignment: Alignment.bottomLeft,
        child: const Text(
          'Identification Details',
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
      ),
      const Divider(thickness: 2, height: 2),
      Container(
        decoration: const BoxDecoration(color: Colors.white),
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.only(left: 10),
                      child: const Text(
                        'MediCare Number',
                        style: TextStyle(fontSize: 22),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(right: 10),
                      child: Text(
                        patient.mediCareNumber,
                        style: const TextStyle(
                            color: Colors.black54, fontSize: 18),
                      ),
                    ),
                  ]),
            ),
            const Divider(thickness: 2, height: 2),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.only(left: 10),
                      child: const Text(
                        'MediCare Expire Date',
                        style: TextStyle(fontSize: 22),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(right: 10),
                      child: Text(
                        patient.mediCareExpire,
                        style: const TextStyle(
                            color: Colors.black54, fontSize: 18),
                      ),
                    ),
                  ]),
            ),
            const Divider(thickness: 2, height: 2),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.only(left: 10),
                      child: const Text(
                        'License Number',
                        style: TextStyle(fontSize: 22),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(right: 10),
                      child: Text(
                        patient.driversLicense,
                        style: const TextStyle(
                            color: Colors.black54, fontSize: 18),
                      ),
                    ),
                  ]),
            ),
            const Divider(thickness: 2, height: 2),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.only(left: 10),
                      child: const Text(
                        'License Expire Date',
                        style: TextStyle(fontSize: 22),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(right: 10),
                      child: Text(
                        patient.driversExpire,
                        style: const TextStyle(
                            color: Colors.black54, fontSize: 18),
                      ),
                    ),
                  ]),
            ),
          ],
        ),
      )
    ]);
  }
}
