import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

List data = [
  'First Name',
  'Last Name',
  'Date of Birth',
  'Age',
  'Organ Donor',
  'Blood Type',
  'Height',
  'Weight',
  'Address',
  'City',
  'State',
  'Phone Number',
  'Email',
  'Occupation',
  'Emergency Name',
  'Emergency Phone Number',
  'Emergency Address',
  'MediCare Number',
  'MediCare Ezpire Date',
  'License Number',
  'License Expire Date',
];

class PatientData {
  String id;
  String firstName;
  String lastName;
  String dateofBirth;
  String address;
  String mobileNumber;
  String emailAdd;
  String occupation;
  String emergencyName;
  String emergencyNumber;
  String emergencyAdd;
  String mediCareNumber;
  String driversLicense;
  String mediCareExpire;
  String driversExpire;
  bool advancedHealthDirective;
  String age;
  String organDonor;
  String weight;
  String height;
  String bloodType;
  String city;
  String state;
  String emergencyCity;
  String emergencyState;

  PatientData(
      {required this.id,
      required this.address,
      required this.advancedHealthDirective,
      required this.dateofBirth,
      required this.driversExpire,
      required this.driversLicense,
      required this.emailAdd,
      required this.emergencyAdd,
      required this.emergencyName,
      required this.emergencyNumber,
      required this.firstName,
      required this.lastName,
      required this.mediCareExpire,
      required this.mediCareNumber,
      required this.mobileNumber,
      required this.occupation,
      required this.age,
      required this.bloodType,
      required this.height,
      required this.organDonor,
      required this.weight,
      required this.city,
      required this.state,
      required this.emergencyCity,
      required this.emergencyState});
}

class Patients with ChangeNotifier {
  List<PatientData> _items = [
    PatientData(
        id: '',
        address: '',
        advancedHealthDirective: true,
        dateofBirth: '',
        driversExpire: '',
        driversLicense: '',
        emailAdd: '',
        emergencyAdd: '',
        emergencyName: '',
        emergencyNumber: '',
        firstName: '',
        lastName: '',
        mediCareExpire: '',
        mediCareNumber: '',
        mobileNumber: '',
        occupation: '',
        age: '',
        organDonor: '',
        bloodType: '',
        height: '',
        weight: '',
        city: '',
        state: '',
        emergencyCity: '',
        emergencyState: ''),
  ];

  final String authToken;
  final String userID;
  Patients(this.authToken, this.userID);

  PatientData get allPatients {
    return _items[0];
  }

  // Future<void> upload() async {
  //   print('upload accessed');
  //   final url = Uri.parse(
  //       'https://medcare-98a4c-default-rtdb.asia-southeast1.firebasedatabase.app/patients.json?auth=$authToken');
  //   final respone = await http.post(url,
  //       body: json.encode({
  //         'creator': userID,
  // 'first name': patient.firstName,
  // 'last name': patient.lastName,
  // 'DOB': {
  //   "date": "${patient.dateofBirth[1]}",
  //   "month": "${patient.dateofBirth[2]}",
  //   "year": "${patient.dateofBirth[3]}",
  // },
  // 'Address': {
  //   "1": patient.address[1],
  //   "2": patient.address[2],
  //   "3": patient.address[3],
  //   "4": patient.address[4],
  //   "10": patient.address[10],
  //   "100": patient.address[100],
  // },
  // 'emailID': patient.emailAdd,
  // 'Occupation': patient.occupation,
  // 'EmergencyName': patient.emergencyName,
  // 'EmergencyAdd': {
  //   "1": patient.emergencyAdd[1],
  //   "2": patient.emergencyAdd[2],
  //   "3": patient.emergencyAdd[3],
  //   "4": patient.emergencyAdd[4],
  //   "10": patient.emergencyAdd[10],
  //   "100": patient.emergencyAdd[100],
  // },
  // 'MedCare': patient.mediCareNumber,
  // 'MedCareExp': patient.mediCareExpire,
  // 'Drivers': patient.driversLicense,
  // 'DriversExp': patient.driversExpire,
  // 'HealthDirective': patient.advancedHealthDirective,
  // 'age': patient.age,
  // 'OrganDonor': patient.organDonor,
  // 'weight': patient.weight,
  // 'height': patient.height,
  // 'BloodType': patient.bloodType,
  //         'ever-had': {
  //           "Rheumatic Fever": true,
  //           "TB": false,
  //           "Asthama": true,
  //           "Stroke": false,
  //           "Thyroid Problems": true,
  //           "Diabetes": true,
  //           "Epilepsy": false,
  //           "Blood Pressure": true,
  //           "Heart Attack": false,
  //           "Clot in leg-lungs": false,
  //         },
  //         'family-history': {
  //           "Diabetes": true,
  //           "Colon Cancer": false,
  //           "HyperTension": true,
  //           "Depression": true,
  //           "Heart Disease": true,
  //           "Breast Cancer": false,
  //           "Stroke": false,
  //         },
  //         'mentalHealth': {
  //           "Depression": true,
  //           "Anxiety": false,
  //           "Other": true,
  //         },
  //         'operations': {
  //           "Tonsils": false,
  //           "Gall Bladder": false,
  //           "Hernia": true,
  //           "Appendix": true,
  //           "Veins": false,
  //           "Joints-Bones": true,
  //         },
  //       }));
  //   print(json.decode(respone.body));
  //   print('upload completed');
  // }

  Future<void> update(PatientData patient) async {
    print(patient.city);
    String id = patient.id;
    final uri = Uri.parse(
        'https://medcare-98a4c-default-rtdb.asia-southeast1.firebasedatabase.app/patients/$id.json?auth=$authToken');
    final response = await http.patch(uri,
        body: json.encode({
          'DriversExp': patient.driversExpire,
          'MedCareExp': patient.mediCareExpire,
          'Address': patient.address,
          'EmergencyAdd': patient.emergencyAdd,
          'first name': patient.firstName,
          'last name': patient.lastName,
          'emailID': patient.emailAdd,
          'Occupation': patient.occupation,
          'EmergencyName': patient.emergencyName,
          'MedCare': patient.mediCareNumber,
          'Drivers': patient.driversLicense,
          'HealthDirective': patient.advancedHealthDirective,
          'age': patient.age,
          'OrganDonor': patient.organDonor,
          'weight': patient.weight,
          'height': patient.height,
          'BloodType': patient.bloodType,
          'phone': patient.mobileNumber,
          'emergencyphone': patient.emergencyNumber,
          'city': patient.city,
          'state': patient.state,
          'emergencycity': patient.emergencyCity,
          'emergencystate': patient.emergencyState,
        }));
    _items[0] = patient;
    notifyListeners();
  }

  Future<void> findbyID() async {
    final filterString = 'orderBy="creator"&equalTo="$userID"';
    final uri = Uri.parse(
        'https://medcare-98a4c-default-rtdb.asia-southeast1.firebasedatabase.app/patients.json?auth=$authToken&$filterString');
    final Response = await http.get(uri);
    final extractedData = json.decode(Response.body) as Map<String, dynamic>;
    final List<PatientData> loadedData = [];
    extractedData.forEach((key, value) {
      loadedData.add(PatientData(
          id: key,
          address: value['Address'],
          advancedHealthDirective: value['HealthDirective'],
          dateofBirth: value['DOB'],
          driversExpire: value['DriversExp'],
          driversLicense: value['Drivers'],
          emailAdd: value['emailID'],
          emergencyAdd: value['EmergencyAdd'],
          emergencyName: value['EmergencyName'],
          emergencyNumber: value['emergencyphone'],
          firstName: value['first name'],
          lastName: value['last name'],
          mediCareExpire: value['MedCareExp'],
          mediCareNumber: value['MedCare'],
          mobileNumber: value['phone'],
          occupation: value['Occupation'],
          age: value['age'],
          bloodType: value['BloodType'],
          height: value['height'],
          organDonor: value['OrganDonor'],
          weight: value['weight'],
          city: value['city'],
          state: value['state'],
          emergencyCity: value['emergencycity'],
          emergencyState: value['emergencystate']));
    });
    print(loadedData[0].id);
    print(loadedData[0].dateofBirth);
    _items = loadedData;
    notifyListeners();
  }
}
