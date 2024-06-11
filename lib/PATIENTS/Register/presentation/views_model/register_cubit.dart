import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../Api/api_service.dart';
import '../../data/Register_Model.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());
  static RegisterCubit get(context) => BlocProvider.of(context);

  Register_model? registermodel;
  void UserRegister({
    required String email,
    required String password,
    required String phone,
    required String first_name,
    required String last_name,
    required String birth_date,
  }) {
    emit(RegisterLoadingState());
    DioHelper.postData(
      url: 'https://abdelrahman.in/api/register',
      data: {
        'first_name': first_name,
        'last_name': last_name,
        'email': email,
        'password': password,
        'phone': phone,
        'birth_date': birth_date,
      },
    ).then((value) {
      if (value.statusCode! >= 200 && value.statusCode! < 300) {
        registermodel = Register_model.fromJson(value.data);
        print(registermodel!.message);
        print(registermodel!.success);
        emit(RegisterSuccessState(loginModel: registermodel!));
      } else {
        if (value.statusCode == 401) {
          emit(RegisterFauilreState(error: value.data["message"]));
          print(value.data["message"]);
          print(value.data);
        } else {
          emit(RegisterFauilreState(error: value.data["message"]));
          print(value.data["message"]);
          print(value.data);
        }
      }
    }).catchError((error) {
      log(error.toString());
      emit(RegisterFauilreState(error: error));
    });
  }
}
