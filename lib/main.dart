// ignore_for_file: prefer_const_constructors, unused_local_variable
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque_flutter/Controller/CheckBox/checkbox_cubit.dart';
import 'package:jobsque_flutter/Controller/CompeteProfile/complete_profile_cubit.dart';
import 'package:jobsque_flutter/Controller/Country_Selection/countryselection_cubit.dart';
import 'package:jobsque_flutter/Controller/Creat/creataccount_cubit.dart';
import 'package:jobsque_flutter/Controller/DropDownbutton/dropdown_cubit.dart';
import 'package:jobsque_flutter/Controller/GetCompanies/getcompanies_cubit.dart';
import 'package:jobsque_flutter/Controller/Messages/message_cubit.dart';
import 'package:jobsque_flutter/Controller/Otp/otp_cubit.dart';
import 'package:jobsque_flutter/Controller/Profile/profile_cubit.dart';
import 'package:jobsque_flutter/Controller/Select%20language/select_language_cubit.dart';
import 'package:jobsque_flutter/Controller/SwitchButton/switchbutton_cubit.dart';
import 'package:jobsque_flutter/Controller/ToggleJob/toggle_job_dart_cubit.dart';
import 'package:jobsque_flutter/Controller/Visibility/visibility_cubit.dart';
import 'package:jobsque_flutter/Controller/Work_mode/workmode_cubit.dart';
import 'package:jobsque_flutter/Controller/login/login_cubit.dart';
import 'package:jobsque_flutter/Controller/navbar/navbar_cubit.dart';
import 'package:jobsque_flutter/Controller/TypeOfWork/typeofwork_cubit.dart';
import 'package:jobsque_flutter/Model/Services/ProfileApiServices.dart';
import 'package:jobsque_flutter/Model/Services/dioHelper.dart';
import 'package:jobsque_flutter/View/Screens/CreatAccount.dart';
import 'package:jobsque_flutter/View/Screens/homeScreen.dart';
import 'package:jobsque_flutter/shared_Preferences/sharedPreferencesHelper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Cache cache = Cache();
  await cache.cacheInitialization();
  DioHelper.init();
  ProfileApiService profileApiService = ProfileApiService();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => LoginCubit(),
      ),
      BlocProvider(
        create: (context) => CreataccountCubit(),
      ),
      BlocProvider(
        create: (context) => NavbarCubit(),
      ),
      BlocProvider(create: (context) => TypeofworkCubit()),
      BlocProvider(create: (context) => WorkmodeCubit()),
      BlocProvider(create: (context) => CountryselectionCubit()),
      BlocProvider(create: (context) => CheckboxCubit()),
      BlocProvider(create: (context) => VisibilityCubit()),
      BlocProvider(create: (context) => SelectLanguageCubit()),
      BlocProvider(create: (context) => SwitchbuttonCubit()),
      BlocProvider(create: (context) => OtpCubit()),
      BlocProvider(create: (context) => CompleteProfileCubit()),
      BlocProvider(create: (context) => ToggleJobDartCubit()),
      BlocProvider(create: (context) => DropdownCubit()),
      BlocProvider(create: (context) => MessageCubit()),
      BlocProvider(create: (context) => GetcompaniesCubit()..getCompanies()),
      BlocProvider(create: (context) => ProfileCubit(cache)),
    ],
    child: Myapp(),
  ));
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Creataccount(),
    );
  }
}
