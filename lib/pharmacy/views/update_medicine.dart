import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:hospital/COMPONENTS/styles/custom_flutter_toast.dart';
import 'package:intl/intl.dart';

import '../../DATABASE/cubit.dart';
import '../../DATABASE/states.dart';
import '../../MANAGER/Home-M.dart';
import '../data/pharmacy_model.dart';

class UpdateMedicne extends StatelessWidget {
  TextEditingController name = TextEditingController(); //fname
  TextEditingController price = TextEditingController(); //lname
  TextEditingController quantity = TextEditingController(); //email
  TextEditingController Expiry_date = TextEditingController(); //pass
  final DataPharmacy data;
  var Register_Key = GlobalKey<FormState>();

  UpdateMedicne({Key? key, required this.data}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    name.text = data.name!;
    price.text = data.price!;
    quantity.text = data.quantity.toString()!;
    Expiry_date.text = data.expiryDate!;
    return BlocProvider(
      create: (context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {
          if (state is AddDoctorSuccessState) {
            showToast(text: state.message, state: ToastStates.SUCCESS);
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => HomeManager()));
          } else if (state is AddDoctorFauilreState) {
            showToast(text: state.error, state: ToastStates.ERROR);
          }
        },
        builder: (context, state) => Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Form(
                  key: Register_Key,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10.0,
                      ),
                      //الشريط الاعلي
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('FILL OUT,',
                                    style: TextStyle(
                                        color: HexColor('32313a'),
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold)),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Text('Update Medicine',
                                    style: TextStyle(
                                        color: HexColor('32313a'),
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                            InkWell(
                              onTap: () {
                                AppCubit.get(context)
                                    .Delete_Medicines(id: data.id.toString());
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => HomeManager()));
                              },
                              child: Icon(
                                Icons.delete,
                                color: Colors.deepPurple,
                                size: 25,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 35,
                      ),
                      TextFormField(
                        controller: name,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'please enter your Medicine Name';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            labelText: 'Medicine NAME',
                            hintText: 'Enter your NAME',
                            prefixIcon: Icon(Icons.medical_information),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30.0))),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        controller: price,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'please enter your Price';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            labelText: 'Price',
                            hintText: 'Enter your Price',
                            prefixIcon: Icon(Icons.money),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30.0))),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        controller: quantity,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'please enter your quantity';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            labelText: 'quantity',
                            hintText: 'Enter your quantity',
                            prefixIcon: Icon(Icons.numbers),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30.0))),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        controller: Expiry_date,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'please enter your Expiry_date';
                          }
                          return null;
                        },
                        onTap: () {
                          //لاظهار ساعة لتحديد الوقت
                          showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime.now(),
                                  lastDate: DateTime.parse('2040-01-01'))
                              .then((value) {
                            Expiry_date.text =
                                DateFormat.yMMMd().format(value!);
                          });
                          //لاظهار نتيجة للتاريخ
                          // showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime.parse('2023-12-01'), lastDate: DateTime.parse('2000-01-01'));
                        },
                        decoration: InputDecoration(
                            labelText: 'Expiry_date',
                            hintText: 'Enter The Expiry_date',
                            prefixIcon: Icon(Icons.calendar_month_outlined),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30.0))),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: () {
                              AppCubit.get(context).openGallery(context);
                            },
                            icon: Icon(Icons.image),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      MaterialButton(
                        onPressed: () {
                          if (Register_Key.currentState!.validate()) {
                            AppCubit.get(context).Update_Medicines(
                                id: data.id.toString(),
                                name: name.text,
                                price: price.text,
                                expiry_date: Expiry_date.text,
                                quantity: quantity.text);
                          }
                        },
                        child: Text(
                          'Update',
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
