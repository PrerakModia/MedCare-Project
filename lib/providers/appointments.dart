import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Appointment {
  String docName;
  String patientId;
  String symptom;
  String date;
  String time;

  Appointment(
      {required this.docName,
      required this.patientId,
      required this.date,
      required this.time,
      required this.symptom});
}

class Appointments with ChangeNotifier {
  List<Appointment> _items = [
    Appointment(
        docName: 'Anant',
        patientId: '12',
        date: '12-04-22',
        time: '6:00 - 7:00',
        symptom: 'Sore Throat Cough Headache'),
  ];

  List<Appointment> get all {
    return [..._items];
  }

  final String authToken;
  final String userID;
  Appointments(this.authToken, this.userID);

  Future<void> upload(Appointment appoint) async {
    final uri = Uri.parse(
        'https://medcare-98a4c-default-rtdb.asia-southeast1.firebasedatabase.app/appointments/-N1zgx60A9VJjhGRwJCC/appointments.json?auth=$authToken');
    final response = await http.post(uri,
        body: json.encode({
          'docname': appoint.docName,
          'patientid': appoint.patientId,
          'date': appoint.date,
          'time': appoint.time,
          'symptom': appoint.symptom
        }));
    print(jsonDecode(response.body));
  }

  Future<void> getappointments(String id) async {
    final filterString = 'orderBy="Doctor Id"&equalTo="$userID"';
    final uri = Uri.parse(
        'https://medcare-98a4c-default-rtdb.asia-southeast1.firebasedatabase.app/appointments.json?auth=$authToken&$filterString');
    final response = await http.get(uri);
    final extractedData = json.decode(response.body) as Map<String, dynamic>;
    List<Appointment> loadedappointment = [];
    extractedData.forEach((key, value) {
      for (var element in (value['appointments'] as List<dynamic>)) {
        loadedappointment.add(Appointment(
            docName: element['docname'],
            patientId: element['patientid'],
            date: element['date'],
            time: element['time'],
            symptom: element['symptom']));
      }
    });
    _items = loadedappointment;
    notifyListeners();
  }

  void addAppointment(Appointment appointment) {
    final newAppoint = Appointment(
        docName: appointment.docName,
        patientId: appointment.patientId,
        date: appointment.date,
        time: appointment.time,
        symptom: appointment.symptom);
    _items.add(newAppoint);
    notifyListeners();
  }

  void deleteAppointment(int index) {
    print('delete function accessed');
    _items.removeAt(index);
    notifyListeners();
  }
}
