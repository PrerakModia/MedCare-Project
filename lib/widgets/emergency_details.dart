import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/patients.dart';

class EmergencyDetails extends StatelessWidget {
  final patient;
  const EmergencyDetails(this.patient, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      const SizedBox(height: 30),
      Container(
        padding: const EdgeInsets.only(left: 10),
        alignment: Alignment.bottomLeft,
        child: const Text(
          'Emergency Contact Details',
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
                        'Name',
                        style: TextStyle(fontSize: 22),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(right: 10),
                      child: Text(
                        patient.emergencyName,
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
                        'Phone Number',
                        style: TextStyle(fontSize: 22),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(right: 10),
                      child: Text(
                        patient.emergencyNumber,
                        style: const TextStyle(
                            color: Colors.black54, fontSize: 18),
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
                  padding:
                      const EdgeInsets.only(top: 10, bottom: 10, right: 10),
                  child: Flex(direction: Axis.horizontal, children: <Widget>[
                    Expanded(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              padding: const EdgeInsets.only(left: 10),
                              child: const Text(
                                'Emergency Address',
                                style: TextStyle(fontSize: 22),
                              ),
                            ),
                            Flexible(
                              //padding: const EdgeInsets.only(right: 10),
                              child: Text(
                                '${patient.emergencyCity} ${patient.emergencyState}',
                                style: const TextStyle(
                                    color: Colors.black54, fontSize: 18),
                                textAlign: TextAlign.right,
                              ),
                            ),
                          ]),
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
                            'Emergency Address',
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
                      patient.emergencyAdd as String,
                      style:
                          const TextStyle(fontSize: 18, color: Colors.black54),
                    ),
                  ),
                ],
              ),
              collapsed: Container(),
            ),
            const Divider(thickness: 2, height: 2),
          ],
        ),
      )
    ]);
  }
}
