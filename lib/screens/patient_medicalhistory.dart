import 'package:flutter/material.dart';
import '../providers/medical_history.dart';
import 'package:provider/provider.dart';

class MedicalHistoryPatient extends StatelessWidget {
  final String id;
  const MedicalHistoryPatient(this.id, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final medHistory = Provider.of<Medical>(context, listen: false).all;
    return SingleChildScrollView(
      child: Column(children: <Widget>[
        Container(
          alignment: Alignment.bottomLeft,
          padding: const EdgeInsets.only(top: 20, left: 10),
          child: const Text(
            'Ever Had',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: 200,
          child: SafeArea(
            top: false,
            bottom: false,
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 40,
                crossAxisSpacing: 20,
                childAspectRatio: 300 / 200,
              ),
              itemBuilder: (BuildContext context, int index) {
                return GridTile(
                  child: Container(
                    padding: const EdgeInsets.only(left: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          everHadnames[index] as String,
                          style: const TextStyle(fontSize: 16),
                        ),
                        Checkbox(
                            value: medHistory.everHad['${everHadnames[index]}'],
                            onChanged: (_) {})
                      ],
                    ),
                  ),
                );
              },
              itemCount: medHistory.everHad.length,
            ),
          ),
        ),
        Container(
          alignment: Alignment.bottomLeft,
          padding: const EdgeInsets.only(top: 20, left: 10),
          child: const Text(
            'Family History',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: 150,
          child: SafeArea(
            top: false,
            bottom: false,
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 40,
                crossAxisSpacing: 20,
                childAspectRatio: 300 / 200,
              ),
              itemBuilder: (BuildContext context, int index) {
                return GridTile(
                  child: Container(
                    padding: const EdgeInsets.only(left: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          familyHistorynames[index] as String,
                          style: const TextStyle(fontSize: 16),
                        ),
                        Checkbox(
                            value: medHistory
                                .familyHistory['${familyHistorynames[index]}'],
                            onChanged: (_) {})
                      ],
                    ),
                  ),
                );
              },
              itemCount: medHistory.familyHistory.length,
            ),
          ),
        ),
        Container(
          alignment: Alignment.bottomLeft,
          padding: const EdgeInsets.only(top: 20, left: 10),
          child: const Text(
            'Mental Health',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: 70,
          child: SafeArea(
            top: false,
            bottom: false,
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 40,
                crossAxisSpacing: 20,
                childAspectRatio: 300 / 200,
              ),
              itemBuilder: (BuildContext context, int index) {
                return GridTile(
                  child: Container(
                    padding: const EdgeInsets.only(left: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          mentalHealthnames[index] as String,
                          style: const TextStyle(fontSize: 16),
                        ),
                        Checkbox(
                            value: medHistory
                                .mentalHealth['${mentalHealthnames[index]}'],
                            onChanged: (_) {})
                      ],
                    ),
                  ),
                );
              },
              itemCount: medHistory.mentalHealth.length,
            ),
          ),
        ),
        Container(
          alignment: Alignment.bottomLeft,
          padding: const EdgeInsets.only(top: 20, left: 10),
          child: const Text(
            'Operations',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: 120,
          child: SafeArea(
            top: false,
            bottom: false,
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 40,
                crossAxisSpacing: 20,
                childAspectRatio: 300 / 200,
              ),
              itemBuilder: (BuildContext context, int index) {
                return GridTile(
                  child: Container(
                    padding: const EdgeInsets.only(left: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          operationNames[index] as String,
                          style: const TextStyle(fontSize: 16),
                        ),
                        Checkbox(
                            value: medHistory
                                .operation['${operationNames[index]}'],
                            onChanged: (_) {})
                      ],
                    ),
                  ),
                );
              },
              itemCount: medHistory.operation.length,
            ),
          ),
        ),
      ]),
    );
  }
}
