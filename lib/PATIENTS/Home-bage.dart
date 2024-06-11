
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital/DATABASE/cubit.dart';
import 'package:hospital/DATABASE/states.dart';

class Home_bage extends StatelessWidget {
late String name;
late String phone;
late String email;
late String country;
Home_bage({ String n='', String p='', String e='', String c=''})
{
  name=n;
  phone=p;
  email=e;
  country=c;
}
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context)=>AppCubit(),
        child:BlocConsumer<AppCubit,AppStates> (
          listener: (context,state){},
          builder: (context,state)
          {
            var cubit=AppCubit.get(context);
            return Scaffold(
                body: cubit.screans[cubit.current_index],
              bottomNavigationBar: BottomNavigationBar(
                currentIndex: cubit.current_index,
                onTap: (index)
                {
                  cubit.changebottomnav(index);
                },
                items: cubit.bottomItems,
              ),
            );
          },
        ),
    );
  }
}
