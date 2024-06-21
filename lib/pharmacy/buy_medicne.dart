import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:hospital/COMPONENTS/styles/custom_flutter_toast.dart';
import 'package:hospital/pharmacy/data/pharmacy_model.dart';

import '../constant.dart';
import '../payment/views/payment_medicine.dart';

class View_medicene extends StatefulWidget {
  final DataPharmacy data;

  const View_medicene({Key? key, required this.data}) : super(key: key);
  @override
  State<View_medicene> createState() => _View_mediceneState();
}

class _View_mediceneState extends State<View_medicene> {
  int x = 0;
  num t = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
                      Text('Medicine,',
                          style: TextStyle(
                              color: HexColor('32313a'),
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                  Icon(
                    Icons.format_list_bulleted_outlined,
                    size: 35.0,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 35,
            ),
            CircleAvatar(
              backgroundColor: Colors.grey[400],
              backgroundImage: widget.data.image != null
                  ? NetworkImage("${imagebase}${widget.data.image!.path}")
                  : NetworkImage(
                      "https://cloudinary.images-iherb.com/image/upload/f_auto,q_auto:eco/images/enz/enz29011/y/23.jpg"),
              radius: 75.0,
            ),
            SizedBox(
              height: 20,
            ),
            Text('${widget.data.name}',
                style: TextStyle(
                    color: HexColor('32313a'),
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold)),
            SizedBox(
              height: 10,
            ),
            Text('${widget.data.expiryDate}',
                style: TextStyle(
                    color: HexColor('32313a'),
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold)),
            SizedBox(
              height: 10,
            ),
            Text('${widget.data.price} EG',
                style: TextStyle(
                    color: HexColor('32313a'),
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold)),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  color: HexColor('8a86e2'),
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        x++;
                      });
                    },
                    child: Text(
                      '+',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(
                  width: 15.0,
                ),
                Text(
                  x.toString(),
                  style: TextStyle(
                      color: HexColor('8a86e2'),
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 15.0,
                ),
                Container(
                  color: HexColor('8a86e2'),
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        x--;
                        // t=t-widget.map['money'].;
                        if (x < 0) {
                          x = 0;
                          t = 0;
                        }
                      });
                    },
                    child: Text(
                      '-',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Total = ${x * double.parse(widget.data.price!)}',
              style: TextStyle(
                  color: HexColor('8a86e2'),
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              color: Colors.pink[200],
              child: MaterialButton(
                onPressed: widget.data.quantity! > x
                    ? () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) => PaymentMedicine(
                                  data: widget.data,
                                  total: x,
                                  price: x * double.parse(widget.data.price!),
                                )));
                      }
                    : () {
                        showToast(
                            text:
                                "There is no quantity of this medicine: It Found ${widget.data.quantity}",
                            state: ToastStates.ERROR);
                      },
                child: Text(
                  'BUY',
                  style: TextStyle(
                      color: HexColor('8a86e2'),
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
