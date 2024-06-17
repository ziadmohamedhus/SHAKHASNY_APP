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

class GetworkDoctorLoadingState extends AppStates {}

class GetworkDoctorSuccessState extends AppStates {
  final String message;

  GetworkDoctorSuccessState({required this.message});
}

class GetworkDoctorFauilreState extends AppStates {
  final String error;

  GetworkDoctorFauilreState({required this.error});
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
