import 'package:appointment_app/providers/patients.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class PersonalDetails extends StatelessWidget {
  final patient;
  const PersonalDetails(this.patient, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.white),
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 10),
            decoration: const BoxDecoration(color: Colors.white),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.only(left: 10, bottom: 3),
                  child: Text(
                    '${patient.firstName} ${patient.lastName}',
                    style: const TextStyle(fontSize: 27, color: Colors.red),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    '${patient.dateofBirth} (${patient.age})',
                    style: const TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 18,
                        color: Colors.black54),
                  ),
                )
              ],
            ),
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
                      'Organ donor',
                      style: TextStyle(fontSize: 22),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(right: 10),
                    child: Text(
                      patient.organDonor,
                      style:
                          const TextStyle(color: Colors.black54, fontSize: 18),
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
                      'BloodType',
                      style: TextStyle(fontSize: 22),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(right: 10),
                    child: Text(
                      patient.bloodType,
                      style:
                          const TextStyle(color: Colors.black54, fontSize: 18),
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
                      'Height',
                      style: TextStyle(fontSize: 22),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(right: 10),
                    child: Text(
                      '${patient.height} cm',
                      style:
                          const TextStyle(color: Colors.black54, fontSize: 18),
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
                      'Weight',
                      style: TextStyle(fontSize: 22),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(right: 10),
                    child: Text(
                      '${patient.weight} kg',
                      style:
                          const TextStyle(color: Colors.black54, fontSize: 18),
                    ),
                  ),
                ]),
          ),
          const Divider(thickness: 2, height: 2),
          ExpandablePanel(
            theme: const ExpandableThemeData(
              headerAlignment: ExpandablePanelHeaderAlignment.center,
              hasIcon: false,
            ),
            header: Expandable(
              collapsed: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.only(left: 10),
                        child: const Text(
                          'Address',
                          style: TextStyle(fontSize: 22),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(right: 10),
                        child: Text(
                          '${patient.city}, ${patient.state}',
                          style: const TextStyle(
                              color: Colors.black54, fontSize: 18),
                        ),
                      ),
                    ]),
              ),
              expanded: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.only(left: 10),
                        child: const Text(
                          'Address',
                          style: TextStyle(fontSize: 22),
                        ),
                      ),
                    ]),
              ),
            ),
            expanded: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 5, left: 10),
                  child: Text(
                    patient.address as String,
                    style: const TextStyle(fontSize: 18, color: Colors.black54),
                  ),
                ),
              ],
            ),
            collapsed: Container(),
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
                      'Phone Number',
                      style: TextStyle(fontSize: 22),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(right: 10),
                    child: Text(
                      patient.mobileNumber,
                      style:
                          const TextStyle(color: Colors.black54, fontSize: 18),
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
                      'Email',
                      style: TextStyle(fontSize: 22),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(right: 10),
                    child: Text(
                      patient.emailAdd,
                      style:
                          const TextStyle(color: Colors.black54, fontSize: 18),
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
                      'Occupation',
                      style: TextStyle(fontSize: 22),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(right: 10),
                    child: Text(
                      patient.occupation,
                      style:
                          const TextStyle(color: Colors.black54, fontSize: 18),
                    ),
                  ),
                ]),
          ),
          const Divider(thickness: 2, height: 2),
        ],
      ),
    );
  }
}
