import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

class CustomCreditCard extends StatefulWidget {
  @override
  State<CustomCreditCard> createState() => _CustomCreditCardState();
}

class _CustomCreditCardState extends State<CustomCreditCard> {
  String cardNumber = '', expiryDate = '', cardHolderName = '', cvvCode = '';
  var formKey = GlobalKey<FormState>();
  bool showBackView = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          ],
        ),
      ),
    );
  }
}
