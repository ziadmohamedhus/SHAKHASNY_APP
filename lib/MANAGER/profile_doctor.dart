import 'package:flutter/material.dart';

import 'Add_doctors/Data/all_doctor_model.dart';

class ProfileScreen extends StatelessWidget {
  final DataDoctor doc;

  const ProfileScreen({Key? key, required this.doc}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 70,
                  backgroundImage: AssetImage("asset/image/1.jpg"),
                ),
                const SizedBox(height: 20),
                itemProfile(
                    "DR :", '${doc.firstName} ${doc.lastName}', Icons.person),
                const SizedBox(height: 10),
                itemProfile("Phone Number", '${doc.phone}', Icons.phone),
                const SizedBox(height: 10),
                itemProfile("Specialization", '${doc.doctor!.specialization}',
                    Icons.science),
                const SizedBox(height: 10),
                itemProfile("Email", '${doc.email}', Icons.mail),
                const SizedBox(
                  height: 10,
                ),
                itemProfile("Birthday", '${doc.birthDate}', Icons.date_range),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  itemProfile(String title, String subtitle, IconData iconData) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.pinkAccent[100]!.withOpacity(0.2),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                offset: const Offset(0, 5),
                color:
                    const Color.fromARGB(255, 216, 218, 203).withOpacity(0.6),
                spreadRadius: 2,
                blurRadius: 10)
          ]),
      child: ListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        leading: Icon(iconData),
        // trailing: Icon(Icons.arrow_forward, color: Colors.grey.shade400),
        tileColor: Colors.white,
      ),
    );
  }
}
