import 'dart:ffi';

import 'package:appointment_app/providers/appointments.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../providers/doctors.dart';

import 'package:flutter/material.dart';

class MakeAppointment extends StatefulWidget {
  static const routeName = '/make-appointment';
  const MakeAppointment({Key? key}) : super(key: key);

  @override
  State<MakeAppointment> createState() => _MakeAppointmentState();
}

class _MakeAppointmentState extends State<MakeAppointment> {
  final doctorName = TextEditingController();
  final selectDate = TextEditingController();
  final selectTime = TextEditingController();
  final enterSymptoms = TextEditingController();
  DateTime selectedDate = DateTime.now();
  final _form = GlobalKey<FormState>();

  var _makingAppointment =
      Appointment(docName: '', patientId: '', date: '', time: '', symptom: '');

  //  var _initVal = {
  //    'docName': '',
  //    'patientID': '',
  //    'Date': '',
  //    'time': '',
  //    'symptoms': '',
  //  };
  var _isInit = true;

  @override
  void didChangeDependencies() {
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    doctorName.dispose();
    selectDate.dispose();
    selectTime.dispose();
    enterSymptoms.dispose();
    super.dispose();
  }

  Future<void> _select(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(const Duration(days: 7)));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectDate.text = DateFormat('dd-MM-yy').format(picked);
      });
    }
  }

  Widget _selectDoc(BuildContext context) {
    List<DoctorData> doctors = Provider.of<Doctors>(context).allDoctors;
    return TextFormField(
      controller: doctorName,
      decoration: const InputDecoration(label: Text('Select Doctor')),
      textInputAction: TextInputAction.done,
      keyboardType: TextInputType.none,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please select a Doctor';
        }
        return null;
      },
      onSaved: (value) {
        _makingAppointment = Appointment(
            docName: doctorName.text,
            patientId: _makingAppointment.patientId,
            date: _makingAppointment.date,
            time: _makingAppointment.time,
            symptom: _makingAppointment.symptom);
      },
      onTap: () {
        showDialog(
            context: context,
            builder: (_) {
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Dialog(
                  backgroundColor: Colors.transparent,
                  insetPadding: const EdgeInsets.all(10),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: ListView.builder(
                    itemBuilder: (BuildContext context, int index) {
                      return ElevatedButton(
                        onPressed: () {
                          setState(() {
                            doctorName.text = doctors[index].name;
                            Navigator.of(context).pop();
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.only(
                            top: 5,
                            bottom: 5,
                            left: 10,
                            right: 10,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                doctors[index].name,
                                style: const TextStyle(fontSize: 18),
                              ),
                              Text(
                                doctors[index].speciality,
                                style: const TextStyle(fontSize: 18),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    itemCount: doctors.length,
                  ),
                ),
                behavior: HitTestBehavior.opaque,
              );
            });
      },
    );
  }

  Widget _selectDate(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.none,
      controller: selectDate,
      decoration: const InputDecoration(label: Text('Select Date')),
      textInputAction: TextInputAction.done,
      onTap: () {
        _select(context);
      },
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please select a date';
        }
        return null;
      },
      onSaved: (value) {
        _makingAppointment = Appointment(
            docName: _makingAppointment.docName,
            patientId: _makingAppointment.patientId,
            date: selectDate.text,
            time: _makingAppointment.date,
            symptom: _makingAppointment.symptom);
      },
    );
  }

  Widget _selectTime(BuildContext context) {
    Map<String, bool> getTime =
        Provider.of<Doctors>(context, listen: false).getTime(doctorName.text);
    getTime.removeWhere((key, value) => value == false);

    return TextFormField(
      keyboardType: TextInputType.none,
      controller: selectTime,
      decoration: const InputDecoration(label: Text('Select Time')),
      textInputAction: TextInputAction.next,
      onTap: () {
        showDialog(
            context: context,
            builder: (_) {
              return GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  behavior: HitTestBehavior.opaque,
                  child: Dialog(
                    backgroundColor: Colors.transparent,
                    insetPadding: const EdgeInsets.all(10),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: GridView.builder(
                      itemCount: getTime.length,
                      padding: const EdgeInsets.all(5),
                      itemBuilder: (ctx, index) {
                        return ElevatedButton(
                          onPressed: () {
                            setState(() {
                              selectTime.text = getTime.keys.elementAt(index);
                              Navigator.of(context).pop();
                            });
                          },
                          child: Center(
                            child: Text(getTime.keys.elementAt(index)),
                          ),
                        );
                      },
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 5.0,
                        mainAxisSpacing: 5.0,
                        mainAxisExtent: 40,
                      ),
                    ),
                  ));
            });
      },
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please provide your Patient ID';
        }
        return null;
      },
      onSaved: (value) {
        _makingAppointment = Appointment(
            docName: _makingAppointment.docName,
            patientId: _makingAppointment.patientId,
            date: _makingAppointment.date,
            time: selectTime.text,
            symptom: _makingAppointment.symptom);
      },
    );
  }

  void _saveForm() {
    final isValid = _form.currentState!.validate();
    if (isValid == false) {
      return;
    }
    _form.currentState!.save();
    _form.currentState!.save();

    Provider.of<Appointments>(context, listen: false)
        .upload(_makingAppointment);
    print('Appointment Made');
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Orders')),
        actions: <Widget>[
          IconButton(
              onPressed: () {
                _saveForm();
              },
              icon: const Icon(Icons.save))
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _form,
          child: ListView(
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(label: Text('Enter ID')),
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please provide your Patient ID';
                  }
                  return null;
                },
                onSaved: (value) {
                  _makingAppointment = Appointment(
                      docName: _makingAppointment.docName,
                      patientId: value.toString(),
                      date: _makingAppointment.date,
                      time: _makingAppointment.time,
                      symptom: _makingAppointment.symptom);
                },
              ),
              _selectDoc(context),
              _selectDate(context),
              _selectTime(context),
              TextFormField(
                controller: enterSymptoms,
                decoration:
                    const InputDecoration(label: Text('Enter Symptoms')),
                maxLines: 3,
                keyboardType: TextInputType.multiline,
                textInputAction: TextInputAction.next,
                validator: (value) {
                  if (value!.isEmpty) {
                    print('pls enter ID');
                    return 'Please provide your symptoms';
                  }
                  return null;
                },
                onSaved: (value) {
                  _makingAppointment = Appointment(
                      docName: _makingAppointment.docName,
                      patientId: _makingAppointment.patientId,
                      date: _makingAppointment.date,
                      time: _makingAppointment.time,
                      symptom: enterSymptoms.text);
                },
                onFieldSubmitted: (_) {
                  _saveForm();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
