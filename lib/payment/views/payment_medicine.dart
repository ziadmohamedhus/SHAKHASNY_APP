import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:hospital/COMPONENTS/styles/custom_flutter_toast.dart';
import 'package:hospital/DATABASE/cubit.dart';
import 'package:hospital/DATABASE/states.dart';

import '../../COMPONENTS/components/default_bottom.dart';
import '../../PATIENTS/Buy-done.dart';
import '../../pharmacy/data/pharmacy_model.dart';

class PaymentMedicine extends StatefulWidget {
  final DataPharmacy data;
  final double price;
  final int total;

  const PaymentMedicine(
      {Key? key, required this.data, required this.price, required this.total})
      : super(key: key);
  @override
  State<PaymentMedicine> createState() => _PaymentMedicine();
}

class _PaymentMedicine extends State<PaymentMedicine> {
  String cardNumber = '', expiryDate = '', cardHolderName = '', cvvCode = '';

  var formKey = GlobalKey<FormState>();

  bool showBackView = false;

  @override
  Widget build(BuildContext context) {
    print(widget.total);
    print(widget.price);
    return BlocProvider(
      create: (context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {
          if (state is BuyMoneySuccessState) {
            showToast(text: state.message, state: ToastStates.SUCCESS);
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => Buy_done(
                          name: widget.data.name!,
                          money: widget.price,
                          number: widget.total,
                        )));
          } else if (state is BuyMoneyFauilreState) {
            showToast(text: state.error, state: ToastStates.ERROR);
          }
        },
        builder: (context, state) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CreditCardWidget(
                    cardType: CardType.visa,
                    cardNumber: cardNumber,
                    expiryDate: expiryDate,
                    cardHolderName: cardHolderName,
                    cvvCode: cvvCode,
                    showBackView: showBackView,
                    isHolderNameVisible: true,
                    onCreditCardWidgetChange: (value) {},
                  ),
                  CreditCardForm(
                      isHolderNameVisible: true,
                      cardNumber: cardNumber,
                      expiryDate: expiryDate,
                      cardHolderName: cardHolderName,
                      cvvCode: cvvCode,
                      onCreditCardModelChange: (carditCardModel) {
                        cardHolderName = carditCardModel.cardHolderName;
                        expiryDate = carditCardModel.expiryDate;
                        cvvCode = carditCardModel.cvvCode;
                        cardNumber = carditCardModel.cardNumber;
                        showBackView = carditCardModel.isCvvFocused;
                        setState(() {});
                      },
                      formKey: formKey),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DefaultButton(
                      title: "Pay",
                      onPressed: () {
                        cardNumber = cardNumber.replaceAll(RegExp(r'\s+'), '');
                        print(cardNumber);
                        String day = expiryDate.substring(0, 2);
                        String year = "20";
                        year += expiryDate.substring(expiryDate.length - 2);
                        AppCubit.get(context).BuyMedicine(
                            quantity: widget.total.toString(),
                            card_name: cardHolderName,
                            card_number: cardNumber,
                            exp_month: day,
                            exp_year: year,
                            id: widget.data.id.toString(),
                            cvc: cvvCode);
                      },
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
