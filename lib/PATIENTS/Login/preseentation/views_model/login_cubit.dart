import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../Api/api_service.dart';
import '../../data/login_model.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  static LoginCubit get(context) => BlocProvider.of(context);

  Login_model? login_model;
  void UserLogin({
    required String email,
    required String password,
  }) {
    emit(LoginLoadingState());
    DioHelper.postData(url: 'https://abdelrahman.in/api/login', data: {
      'email': email,
      'password': password,
    }).then((value) {
      if (value.statusCode! >= 200 && value.statusCode! < 300) {
        login_model = Login_model.fromJson(value.data);
        print(login_model!.message);
        print(login_model!.success);
        emit(LoginSuccessState(loginModel: login_model!));
      } else {
        if (value.statusCode == 401) {
          emit(LoginFauilreState(error: value.data["message"]));
          print(value.data["message"]);
          print(value.data);
        } else {
          emit(LoginFauilreState(error: value.data["message"]));
          print(value.data["message"]);
          print(value.data);
        }
      }
    }).catchError((error) {
      log(error.toString());
      emit(LoginFauilreState(error: error));
    });
  }
}
