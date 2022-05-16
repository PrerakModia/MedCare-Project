import 'package:appointment_app/providers/appointments.dart';
import 'package:appointment_app/providers/auth.dart';
import 'package:appointment_app/providers/doctors.dart';
import 'package:appointment_app/providers/medical_history.dart';
import 'package:appointment_app/providers/patients.dart';
import 'package:appointment_app/screens/appointment_screen.dart';
import 'package:appointment_app/screens/doctors_screen.dart';
import 'package:appointment_app/screens/edit_user_screen.dart';
import 'package:appointment_app/screens/home_screen.dart';
import 'package:appointment_app/screens/login.dart';
import 'package:appointment_app/screens/patient_screen.dart';
import 'package:appointment_app/screens/signup.dart';
import 'package:appointment_app/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './screens/app_home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: Auth()),
        ChangeNotifierProxyProvider<Auth, Patients>(
          create: (context) => Patients('', ''),
          update: (ctx, auth, previousPatients) =>
              Patients(auth.token, auth.userID),
        ),
        ChangeNotifierProxyProvider<Auth, Medical>(
          create: (context) => Medical('', ''),
          update: (ctx, auth, previousHistory) =>
              Medical(auth.token, auth.userID),
        ),
        ChangeNotifierProxyProvider<Auth, Doctors>(
          create: (context) => Doctors('', ''),
          update: (ctx, auth, previousDoctors) =>
              Doctors(auth.token, auth.userID),
        ),
        ChangeNotifierProxyProvider<Auth, Appointments>(
          create: (context) => Appointments('', ''),
          update: (ctx, auth, previousAppointments) =>
              Appointments(auth.token, auth.userID),
        ),
      ],
      child: Consumer<Auth>(builder: (ctx, auth, _) {
        //print('auth after rebuild : ${auth.isAuth}');
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
              primarySwatch: Colors.blue,
              fontFamily: 'Quicksand',
              textTheme: ThemeData.light().textTheme.copyWith(
                      titleMedium: const TextStyle(
                    fontFamily: 'Quicksand',
                    fontSize: 18,
                  ))),
          home: auth.isAuth
              ? const HomeScreen()
              : FutureBuilder(builder: (ctx, authResultSnapshot) {
                  //print('Future Builder Accessed');
                  return authResultSnapshot.connectionState ==
                          ConnectionState.waiting
                      ? SplashScreen()
                      : AppHomeScreen();
                }),
          routes: {
            //  '/': (context) => const AppHomeScreen(),
            LogInScreen.routeName: (context) => const LogInScreen(),
            SignUpScreen.routeName: (context) => const SignUpScreen(),
            MakeAppointment.routeName: (context) => const MakeAppointment(),
            PatientScreen.routeName: (context) => const PatientScreen(),
            DoctorScreen.routeName: (context) => const DoctorScreen(),
            EditUserScreen.routeName: (context) => const EditUserScreen(),
          },
        );
      }),
    );
  }
}
