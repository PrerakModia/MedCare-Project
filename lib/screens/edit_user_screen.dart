import 'package:appointment_app/providers/patients.dart';
import 'package:appointment_app/screens/patient_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class EditUserScreen extends StatefulWidget {
  static const routeName = '/edit-User';
  const EditUserScreen({Key? key}) : super(key: key);

  @override
  State<EditUserScreen> createState() => _EditUserScreenState();
}

class _EditUserScreenState extends State<EditUserScreen> {
  var editedPatient = PatientData(
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
      bloodType: '',
      height: '',
      organDonor: '',
      weight: '',
      city: '',
      state: '',
      emergencyCity: '',
      emergencyState: '');

  var _isInit = true;

  @override
  void didChangeDependencies() {
    if (_isInit) {
      final patient1 = Provider.of<Patients>(context).allPatients;
      selectDate.text = patient1.dateofBirth;
      licenseDate.text = patient1.driversExpire;
      medcareDate.text = patient1.mediCareExpire;
      address.text = patient1.address;
      emergencyAddress.text = patient1.emergencyAdd;
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  final _form = GlobalKey<FormState>();
  TextEditingController selectDate = TextEditingController();
  TextEditingController licenseDate = TextEditingController();
  TextEditingController medcareDate = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController emergencyAddress = TextEditingController();

  Future<void> _select(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1950),
        lastDate: DateTime.now());
    if (picked != null && picked != DateTime.now()) {
      setState(() {
        selectDate.text = DateFormat('dd-MM-yy').format(picked);
      });
    }
  }

  Widget _selectDate(BuildContext context, PatientData patient) {
    return TextFormField(
      decoration: InputDecoration(labelText: data[2]),
      textInputAction: TextInputAction.done,
      keyboardType: TextInputType.none,
      controller: selectDate,
      onTap: () {
        _select(context);
      },
      // validator: (value) {
      //   if (value!.isEmpty) {
      //     return 'Please select a date';
      //   }
      //   return null;
      // },
      onSaved: (value) {
        patient.dateofBirth = value.toString();
      },
    );
  }

  Future<void> _select1(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(2025));
    if (picked != null && picked != DateTime.now()) {
      setState(() {
        licenseDate.text = DateFormat('dd-MM-yy').format(picked);
      });
    }
  }

  Widget _selectDate1(BuildContext context, PatientData patient) {
    return TextFormField(
      decoration: InputDecoration(labelText: data[20]),
      textInputAction: TextInputAction.done,
      keyboardType: TextInputType.none,
      controller: licenseDate,
      onTap: () {
        _select1(context);
      },
      // validator: (value) {
      //   if (value!.isEmpty) {
      //     return 'Please select a date';
      //   }
      //   return null;
      // },
      onSaved: (value) {
        patient.driversExpire = value.toString();
      },
    );
  }

  Future<void> _select2(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(2025));
    if (picked != null && picked != DateTime.now()) {
      setState(() {
        medcareDate.text = DateFormat('dd-MM-yy').format(picked);
      });
    }
  }

  Widget _selectDate2(BuildContext context, PatientData patient) {
    return TextFormField(
      decoration: InputDecoration(labelText: data[18]),
      textInputAction: TextInputAction.done,
      keyboardType: TextInputType.none,
      controller: medcareDate,
      onTap: () {
        _select2(context);
      },
      // validator: (value) {
      //   if (value!.isEmpty) {
      //     return 'Please select a date';
      //   }
      //   return null;
      // },
      onSaved: (value) {
        patient.mediCareExpire = value.toString();
      },
    );
  }

  void _saveForm(PatientData patient) async {
    final isValid = _form.currentState!.validate();
    if (!isValid) {
      return;
    }
    _form.currentState!.save();
    await Provider.of<Patients>(context, listen: false).update(patient);
    Navigator.of(context).pushNamed(PatientScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    PatientData patient = Provider.of<Patients>(context).allPatients;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(30.0),
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: Image.asset(
                      'images/screen-0.png',
                      height: 50,
                      width: 70,
                      //fit: BoxFit.,
                    ),
                  ),
                  Container(
                    width: 240,
                    alignment: Alignment.bottomLeft,
                    height: 50,
                    padding: const EdgeInsets.only(bottom: 3),
                    child: const Text(
                      'Medical Profile',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    height: 37,
                    width: MediaQuery.of(context).size.width - 310,
                    alignment: const Alignment(1.0, 1.0),
                    child: IconButton(
                      onPressed: () {
                        _saveForm(patient);
                      },
                      icon: const Icon(Icons.save),
                    ),
                  )
                ]),
          ),
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
              key: _form,
              child: ListView(
                children: <Widget>[
                  TextFormField(
                    initialValue: patient.firstName,
                    decoration: InputDecoration(labelText: data[0]),
                    textInputAction: TextInputAction.next,
                    onSaved: (value) {
                      patient.firstName = value.toString();
                    },
                    validator: (value) {
                      if (value == '') return 'Please Enter a Valid Name';
                      return null;
                    },
                  ),
                  TextFormField(
                    initialValue: patient.lastName,
                    decoration: InputDecoration(labelText: data[1]),
                    textInputAction: TextInputAction.done,
                    onSaved: (value) {
                      patient.lastName = value.toString();
                    },
                  ),
                  _selectDate(context, patient),
                  TextFormField(
                    initialValue: patient.age,
                    decoration: InputDecoration(labelText: data[3]),
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.number,
                    onSaved: (value) {
                      patient.age = value.toString();
                    },
                  ),
                  TextFormField(
                    initialValue: patient.organDonor,
                    decoration: InputDecoration(labelText: data[4]),
                    textInputAction: TextInputAction.next,
                    onSaved: (value) {
                      patient.organDonor = value.toString();
                    },
                  ),
                  TextFormField(
                    initialValue: patient.bloodType,
                    decoration: InputDecoration(labelText: data[5]),
                    textInputAction: TextInputAction.next,
                    onSaved: (value) {
                      patient.bloodType = value.toString();
                    },
                  ),
                  TextFormField(
                    initialValue: patient.height,
                    decoration: InputDecoration(labelText: '${data[6]} (cm)'),
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.number,
                    onSaved: (value) {
                      patient.height = value.toString();
                    },
                  ),
                  TextFormField(
                    initialValue: patient.weight,
                    decoration: InputDecoration(labelText: '${data[7]} (kg)'),
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.number,
                    onSaved: (value) {
                      patient.weight = value.toString();
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: data[8]),
                    textInputAction: TextInputAction.done,
                    controller: address,
                    maxLines: 4,
                    onSaved: (value) {
                      patient.address = value.toString();
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: TextFormField(
                          initialValue: patient.city,
                          decoration: InputDecoration(labelText: data[9]),
                          textInputAction: TextInputAction.next,
                          onSaved: (value) {
                            patient.city = value.toString();
                          },
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: TextFormField(
                          initialValue: patient.state,
                          decoration: InputDecoration(labelText: data[10]),
                          textInputAction: TextInputAction.next,
                          onSaved: (value) {
                            patient.state = value.toString();
                          },
                        ),
                      ),
                    ],
                  ),
                  TextFormField(
                    initialValue: patient.mobileNumber,
                    decoration: InputDecoration(labelText: data[11]),
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.number,
                    onSaved: (value) {
                      patient.mobileNumber = value.toString();
                    },
                  ),
                  TextFormField(
                    initialValue: patient.emailAdd,
                    decoration: InputDecoration(labelText: data[12]),
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.emailAddress,
                    onSaved: (value) {
                      patient.emailAdd = value.toString();
                    },
                  ),
                  TextFormField(
                    initialValue: patient.occupation,
                    decoration: InputDecoration(labelText: data[13]),
                    textInputAction: TextInputAction.next,
                    onSaved: (value) {
                      patient.occupation = value.toString();
                    },
                  ),
                  TextFormField(
                    initialValue: patient.emergencyName,
                    decoration: InputDecoration(labelText: data[14]),
                    textInputAction: TextInputAction.next,
                    onSaved: (value) {
                      patient.emergencyName = value.toString();
                    },
                  ),
                  TextFormField(
                    initialValue: patient.emergencyNumber,
                    decoration: InputDecoration(labelText: data[15]),
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.number,
                    onSaved: (value) {
                      patient.emergencyNumber = value.toString();
                    },
                  ),
                  TextFormField(
                    controller: emergencyAddress,
                    decoration: InputDecoration(labelText: data[16]),
                    textInputAction: TextInputAction.next,
                    maxLines: 4,
                    onSaved: (value) {
                      patient.emergencyAdd = value.toString();
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: TextFormField(
                          initialValue: patient.emergencyCity,
                          decoration: InputDecoration(labelText: data[9]),
                          textInputAction: TextInputAction.next,
                          onSaved: (value) {
                            patient.emergencyCity = value.toString();
                          },
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: TextFormField(
                          initialValue: patient.emergencyState,
                          decoration: InputDecoration(labelText: data[10]),
                          textInputAction: TextInputAction.next,
                          onSaved: (value) {
                            patient.emergencyState = value.toString();
                          },
                        ),
                      ),
                    ],
                  ),
                  TextFormField(
                    initialValue: patient.mediCareNumber,
                    decoration: InputDecoration(labelText: data[17]),
                    textInputAction: TextInputAction.done,
                    onSaved: (value) {
                      patient.mediCareNumber = value.toString();
                    },
                  ),
                  _selectDate2(context, patient),
                  TextFormField(
                    initialValue: patient.driversLicense,
                    decoration: InputDecoration(labelText: data[19]),
                    textInputAction: TextInputAction.done,
                    onSaved: (value) {
                      patient.driversLicense = value.toString();
                    },
                  ),
                  _selectDate1(context, patient),
                ],
              ))),
    );
  }
}
