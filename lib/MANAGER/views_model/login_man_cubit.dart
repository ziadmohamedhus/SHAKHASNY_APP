import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../Api/api_service.dart';
import '../../PATIENTS/Login/data/login_model.dart';

part 'login_man_state.dart';

class LoginManCubit extends Cubit<LoginManState> {
  LoginManCubit() : super(LoginManInitial());
  static LoginManCubit get(context) => BlocProvider.of(context);
  bool obsecure = false;
  void cahngeicon() {
    obsecure = !obsecure;
    emit(LoginManChangeIconState());
  }

  Login_model? login_model;
  void UserLoginMan({
    required String email,
    required String password,
  }) {
    print(email);
    print(password);
    emit(LoginManLoadingState());
    DioHelper.postData(url: 'https://abdelrahman.in/api/login', data: {
      'email': email,
      'password': password,
    }).then((value) {
      if (value.statusCode! >= 200 && value.statusCode! < 300) {
        login_model = Login_model.fromJson(value.data);
        print(login_model!.message);
        print(login_model!.success);
        emit(LoginManSuccessState(loginModel: login_model!));
      } else {
        if (value.statusCode == 401) {
          emit(LoginManFauilreState(error: value.data["message"]));
          print(value.data["message"]);
          print(value.data);
        } else {
          emit(LoginManFauilreState(error: value.data["message"]));
          print(value.data["message"]);
          print(value.data);
        }
      }
    }).catchError((error) {
      //log(error.toString());
      emit(LoginManFauilreState(error: error));
    });
  }
}
