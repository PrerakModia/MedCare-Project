import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DoctorData {
  String name;
  String id;
  String speciality;
  Map<String, bool> time;

  DoctorData({
    required this.id,
    required this.name,
    required this.speciality,
    required this.time,
  });
}

class Doctors with ChangeNotifier {
  List<DoctorData> _items = [
    DoctorData(id: '11', name: 'Anant', speciality: 'ENT', time: {
      '4:00 - 5:00': true,
      '5:00 = 6:00': true,
      '6:00 - 7:00': true,
      '7:00 = 8:00': true,
    }),
    DoctorData(id: '12', name: 'Rahi', speciality: 'Plastic', time: {
      '4:00 - 5:00': true,
      '5:00 = 6:00': true,
      '6:00 - 7:00': true,
      '7:00 = 8:00': true,
    }),
    DoctorData(id: '13', name: 'Rohan', speciality: 'MD', time: {
      '4:00 - 5:00': true,
      '5:00 = 6:00': true,
      '6:00 - 7:00': true,
      '7:00 = 8:00': true,
    }),
    DoctorData(id: '14', name: 'Subhayan', speciality: 'Ortho', time: {
      '4:00 - 5:00': true,
      '5:00 = 6:00': true,
      '6:00 - 7:00': true,
      '7:00 = 8:00': true,
    }),
    DoctorData(id: '16', name: 'Saransh', speciality: 'Neuro', time: {
      '4:00 - 5:00': true,
      '5:00 = 6:00': true,
      '6:00 - 7:00': true,
      '7:00 = 8:00': true,
    }),
  ];

  final String authToken;
  final String userID;
  Doctors(this.authToken, this.userID);

  // Future<void> upload() async {
  //   print('upload accessed');
  //   final uri = Uri.parse(
  //       'https://medcare-98a4c-default-rtdb.asia-southeast1.firebasedatabase.app/doctors.json?auth=$authToken');
  //   final response = await http.post(uri,
  //       body: json.encode({
  //         'creator': userID,
  //         'name': doc.name,
  //         'speciality': doc.speciality,
  //       }));
  //   print(json.decode(response.body));
  //   print('upload completed');
  // }

  Future<void> findbyID() async {
    final filterString = 'orderBy="creator"&equalTo="$userID"';
    final uri = Uri.parse(
        'https://medcare-98a4c-default-rtdb.asia-southeast1.firebasedatabase.app/doctors.json?auth=$authToken&$filterString');
    final response = await http.get(uri);
    final extractedData = json.decode(response.body) as Map<String, dynamic>;

    List<DoctorData> loadedData = [];

    extractedData.forEach((key, value) {
      loadedData.add(DoctorData(
          id: value['creator'],
          name: value['name'],
          speciality: value['speciality'],
          time: {}));
    });
    _items = loadedData;
    notifyListeners();
  }

  List<DoctorData> get allDoctors {
    return [..._items];
  }

  DoctorData get doctor {
    return _items[0];
  }

  String getIDfromName(String namai) {
    return _items.firstWhere((element) => element.name == namai).id;
  }

  Map<String, bool> getTime(String namai) {
    return _items
        .firstWhere((element) => element.name == namai, orElse: () => _items[0])
        .time;
  }
}
