abstract class AppStates {}

class AppInitialState extends AppStates {}

class AppCreateDatabaseState extends AppStates {}

class AppGetDatabaseLoadingState extends AppStates {}

class AppGetDatabaseState extends AppStates {}

class AppInsertDatabaseState extends AppStates {}

class AppDeleteDatabaseState extends AppStates {}

class AppUpdateDatabaseState extends AppStates {}

class Text_Obsecure_State extends AppStates {}

class bottomnav_state extends AppStates {}

class AppCreateDatabaseState_doctor extends AppStates {}

class AppGetDatabaseLoadingState_doctor extends AppStates {}

class AppGetDatabaseState_doctor extends AppStates {}

class AppInsertDatabaseState_doctor extends AppStates {}

class AppDeleteDatabaseState_doctor extends AppStates {}

class AppCreateDatabaseState_App extends AppStates {}

class AppGetDatabaseLoadingState_App extends AppStates {}

class AppGetDatabaseState_App extends AppStates {}

class AppInsertDatabaseState_App extends AppStates {}

class AppDeleteDatabaseState_App extends AppStates {}

class AppUpdateDatabaseState_App extends AppStates {}

//=====================================
class AddDoctorLoadingState extends AppStates {}

class AddDoctorSuccessState extends AppStates {
  final String message;

  AddDoctorSuccessState({required this.message});
}

class AddDoctorFauilreState extends AppStates {
  final String error;

  AddDoctorFauilreState({required this.error});
}

class GetAllDoctorLoadingState extends AppStates {}

class GetAllDoctorSuccessState extends AppStates {}

class GetAllDoctorFauilreState extends AppStates {
  final String error;

  GetAllDoctorFauilreState({required this.error});
}

class DeleteDoctorLoadingState extends AppStates {}

class DeleteDoctorSuccessState extends AppStates {
  final String message;
  DeleteDoctorSuccessState({required this.message});
}

class DeleteDoctorFauilreState extends AppStates {
  final String error;

  DeleteDoctorFauilreState({required this.error});
}

class GetworkDoctorLoadingState extends AppStates {}

class GetworkDoctorSuccessState extends AppStates {
  final String message;

  GetworkDoctorSuccessState({required this.message});
}

class GetworkDoctorFauilreState extends AppStates {
  final String error;

  GetworkDoctorFauilreState({required this.error});
}

class MakeAppointmentLoadingState extends AppStates {}

class MakeAppointmentSuccessState extends AppStates {
  final String message;

  MakeAppointmentSuccessState({required this.message});
}

class MakeAppointmentFauilreState extends AppStates {
  final String error;

  MakeAppointmentFauilreState({required this.error});
}

class GettimedoctorLoadingState extends AppStates {}

class GettimedoctorSuccessState extends AppStates {}

class GettimedoctorFauilreState extends AppStates {
  final String error;

  GettimedoctorFauilreState({required this.error});
}

class GetAppPatientLoadingState extends AppStates {}

class GetAppPatientSuccessState extends AppStates {}

class GetAppPatientFauilreState extends AppStates {
  final String error;

  GetAppPatientFauilreState({required this.error});
}

class BuyMoneyLoadingState extends AppStates {}

class BuyMoneySuccessState extends AppStates {
  final String message;

  BuyMoneySuccessState({required this.message});
}

class BuyMoneyFauilreState extends AppStates {
  final String error;

  BuyMoneyFauilreState({required this.error});
}

class AppointmentsDoctorLoadingState extends AppStates {}

class AppointmentsDoctorSuccessState extends AppStates {
  final String message;

  AppointmentsDoctorSuccessState({required this.message});
}

class AppointmentsDoctorFauilreState extends AppStates {
  final String error;

  AppointmentsDoctorFauilreState({required this.error});
}

class AcceptAppointmentsDoctorLoadingState extends AppStates {}

class AcceptAppointmentsDoctorSuccessState extends AppStates {
  final String message;

  AcceptAppointmentsDoctorSuccessState({required this.message});
}

class AcceptAppointmentsDoctorFauilreState extends AppStates {
  final String error;

  AcceptAppointmentsDoctorFauilreState({required this.error});
}

class RejectAppointmentsDoctorLoadingState extends AppStates {}

class RejectAppointmentsDoctorSuccessState extends AppStates {
  final String message;

  RejectAppointmentsDoctorSuccessState({required this.message});
}

class RejectAppointmentsDoctorFauilreState extends AppStates {
  final String error;

  RejectAppointmentsDoctorFauilreState({required this.error});
}

class GetMedicinesLoadingState extends AppStates {}

class GetMedicinesSuccessState extends AppStates {}

class GetMedicinesFauilreState extends AppStates {
  final String error;

  GetMedicinesFauilreState({required this.error});
}

class GetSolidMedicinesLoadingState extends AppStates {}

class GetSolidMedicinesSuccessState extends AppStates {}

class GetMedicineswLoadingState extends AppStates {}

class GetMedicineswSuccessState extends AppStates {}

class GetSolidMedicinesFauilreState extends AppStates {
  final String error;

  GetSolidMedicinesFauilreState({required this.error});
}

class SearshFilter extends AppStates {}
