import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MedicalHistory {
  String id;
  Map<String, bool> everHad;
  Map<String, bool> operation;
  Map<String, bool> mentalHealth;
  Map<String, bool> familyHistory;

  MedicalHistory(
      {required this.id,
      required this.everHad,
      required this.familyHistory,
      required this.mentalHealth,
      required this.operation});
}

class Medical with ChangeNotifier {
  List<MedicalHistory> _items = [
    MedicalHistory(id: '12', everHad: {
      'Rheumatic Fever': false,
      'TB': false,
      'Asthama': false,
      'Stroke': false,
      'Thyroid Problems': false,
      'Diabetes': false,
      'Epilepsy': false,
      'Blood Pressure': false,
      'Heart Attack': false,
      'Clot in leg/lungs': false,
    }, familyHistory: {
      'Diabetes': false,
      'Colon Cancer': false,
      'HyperTension': false,
      'Depression': false,
      'Heart Disease': false,
      'Breast Cancer': false,
      'Stroke': false,
    }, mentalHealth: {
      'Depression': false,
      'Anxiety': false,
      'Other': false,
    }, operation: {
      'Tonsils': false,
      'Gall Bladder': true,
      'Hernia': true,
      'Appendix': true,
      'Veins': true,
      'Joints/Bones': false,
    }),
    MedicalHistory(id: '13', everHad: {
      'Rheumatic Fever': false,
      'TB': false,
      'Asthama': false,
      'Stroke': false,
      'Thyroid Problems': false,
      'Diabetes': false,
      'Epilepsy': false,
      'Blood Pressure': false,
      'Heart Attack': false,
      'Clot in leg/lungs': false,
    }, familyHistory: {
      'Diabetes': false,
      'Colon Cancer': true,
      'HyperTension': false,
      'Depression': true,
      'Heart Disease': true,
      'Breast Cancer': false,
      'Stroke': false,
    }, mentalHealth: {
      'Depression': true,
      'Anxiety': false,
      'Other': false,
    }, operation: {
      'Tonsils': false,
      'Gall Bladder': true,
      'Hernia': true,
      'Appendix': true,
      'Veins': true,
      'Joints/Bones': false,
    })
  ];

  final String authToken;
  final String userID;

  Medical(this.authToken, this.userID);

  MedicalHistory get all {
    return _items[0];
  }

  Future<void> findbyID() async {
    final filterString = 'orderBy="creator"&equalTo="$userID"';
    final uri = Uri.parse(
        'https://medcare-98a4c-default-rtdb.asia-southeast1.firebasedatabase.app/patients.json?auth=$authToken&$filterString');
    final response = await http.get(uri);
    final extractedData = json.decode(response.body) as Map<String, dynamic>;
    final List<MedicalHistory> loadedData = [];
    extractedData.forEach((key, value) {
      loadedData.add(MedicalHistory(id: '', everHad: {
        'Rheumatic Fever': value['ever-had']['Rheumatic Fever'],
        'TB': value['ever-had']['TB'],
        'Asthama': value['ever-had']['Asthama'],
        'Stroke': value['ever-had']['Stroke'],
        'Thyroid Problems': value['ever-had']['Thyroid Problems'],
        'Diabetes': value['ever-had']['Diabetes'],
        'Epilepsy': value['ever-had']['Epilepsy'],
        'Blood Pressure': value['ever-had']['Blood Pressure'],
        'Heart Attack': value['ever-had']['Heart Attack'],
        'Clot in leg/lungs': value['ever-had']['Clot in leg-lungs'],
      }, familyHistory: {
        'Diabetes': value['family-history']['Diabetes'],
        'Colon Cancer': value['family-history']['Colon Cancer'],
        'HyperTension': value['family-history']['HyperTension'],
        'Depression': value['family-history']['Depression'],
        'Heart Disease': value['family-history']['Heart Disease'],
        'Breast Cancer': value['family-history']['Breast Cancer'],
        'Stroke': value['family-history']['Stroke'],
      }, mentalHealth: {
        'Depression': value['mentalHealth']['Depression'],
        'Anxiety': value['mentalHealth']['Anxiety'],
        'Other': value['mentalHealth']['Other'],
      }, operation: {
        'Tonsils': value['operations']['Tonsils'],
        'Gall Bladder': value['operations']['Gall Bladder'],
        'Hernia': value['operations']['Hernia'],
        'Appendix': value['operations']['Appendix'],
        'Veins': value['operations']['Veins'],
        'Joints/Bones': value['operations']['Joints-Bones'],
      }));
    });
    _items = loadedData;
    notifyListeners();
  }
}

const everHadnames = {
  0: 'Rheumatic Fever',
  1: 'TB',
  2: 'Asthama',
  3: 'Stroke',
  4: 'Thyroid Problems',
  5: 'Diabetes',
  6: 'Epilepsy',
  7: 'Blood Pressure',
  8: 'Heart Attack',
  9: 'Clot in leg/lungs',
};

const familyHistorynames = {
  0: 'Diabetes',
  1: 'Colon Cancer',
  2: 'HyperTension',
  3: 'Depression',
  4: 'Heart Disease',
  5: 'Breast Cancer',
  6: 'Stroke',
};

var mentalHealthnames = {
  0: 'Depression',
  1: 'Anxiety',
  2: 'Other',
};

var operationNames = {
  0: 'Tonsils',
  1: 'Gall Bladder',
  2: 'Hernia',
  3: 'Appendix',
  4: 'Veins',
  5: 'Joints/Bones',
};
